unit uFrmListaDeVendedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  uVendedorDAO, uVendedor, uDataModule, System.Generics.Collections,
  uFrmVendedorInserir, uFrmVendedorEditar, System.UITypes;

type
  TFrmListaDeVendedores = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtBuscarVendedor: TLabeledEdit;
    btnBuscarVendedor: TButton;
    Panel3: TPanel;
    btnNovoVendedor: TButton;
    btnEditarVendedor: TButton;
    btnExcluirVendedor: TButton;
    ListView1: TListView;
    procedure btnExcluirVendedorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoVendedorClick(Sender: TObject);
    procedure btnEditarVendedorClick(Sender: TObject);
    procedure btnBuscarVendedorClick(Sender: TObject);
  private
    DM : TDM;
    _VendedorDAO : TVendedorDAO;
    procedure PreencherLista(pListaVendedores : TList<TVendedor>);
    procedure CarregarVendedores;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListaDeVendedores: TFrmListaDeVendedores;

implementation

{$R *.dfm}

procedure TFrmListaDeVendedores.btnBuscarVendedorClick(Sender: TObject);
begin
  CarregarVendedores;
end;

procedure TFrmListaDeVendedores.btnEditarVendedorClick(Sender: TObject);
begin
  try
    FrmVendedorEditar := TFrmVendedorEditar.Create(Self, TVendedor(ListView1.ItemFocused.Data));
    FrmVendedorEditar.ShowModal;
    CarregarVendedores;
  finally
    FreeAndNil(FrmVendedorEditar);
  end;
end;

procedure TFrmListaDeVendedores.btnExcluirVendedorClick(Sender: TObject);
begin
  if MessageDlg('Deseja remover esse vendedor da lista', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if ListView1.ItemIndex > -1 then
    begin
      if _VendedorDAO.Deletar(TVendedor(ListView1.ItemFocused.Data)) then
        CarregarVendedores;
    end;
  end;
end;

procedure TFrmListaDeVendedores.btnNovoVendedorClick(Sender: TObject);
begin
  try
    FrmVendedorInserir := TFrmVendedorInserir.Create(Self);
    FrmVendedorInserir.ShowModal;
    CarregarVendedores;
  finally
    FreeAndNil(FrmVendedorInserir);
  end;
end;

procedure TFrmListaDeVendedores.CarregarVendedores;
begin
  try
    PreencherLista(_VendedorDAO.ListarPorNome(edtBuscarVendedor.Text));
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmListaDeVendedores.FormCreate(Sender: TObject);
begin
  DM := TDM.Create(Self);
  _VendedorDAO := TVendedorDAO.Create;
//  CarregarVendedores;
end;

procedure TFrmListaDeVendedores.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(DM) then
      FreeAndNil(DM);
    if Assigned(_VendedorDAO) then
      FreeAndNil(_VendedorDAO);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmListaDeVendedores.PreencherLista(pListaVendedores: TList<TVendedor>);
var
  i : integer;
  tempVendedor : TListItem;
begin
  if Assigned(pListaVendedores) then
  begin
    ListView1.Clear;
    for i := 0 to pListaVendedores.Count-1 do
    begin
      tempVendedor := ListView1.Items.Add;
      tempVendedor.Caption := IntToStr(TVendedor(pListaVendedores[i]).Codigo);
      tempVendedor.SubItems.Add(TVendedor(pListaVendedores[i]).Nome);
      tempVendedor.SubItems.Add(TVendedor(pListaVendedores[i]).Telefone);
      tempVendedor.SubItems.Add(TVendedor(pListaVendedores[i]).Cpf);
      tempVendedor.SubItems.Add(TVendedor(pListaVendedores[i]).Endereco);
      tempVendedor.SubItems.Add(FormatDateTime('yyyy-mm-dd', TVendedor(pListaVendedores[i]).DataNasc));
      tempVendedor.SubItems.Add(TVendedor(pListaVendedores[i]).Sexo);
      tempVendedor.Data := TVendedor(pListaVendedores[i]);
    end;
  end
  else
    ShowMessage('Nenhum vendedor encontrado');
end;
end.
