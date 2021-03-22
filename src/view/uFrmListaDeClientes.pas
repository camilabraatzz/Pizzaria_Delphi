unit uFrmListaDeClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  uClienteDAO, uDataModule, System.Generics.Collections, uCliente, Vcl.ComCtrls,
  uFrmClientesInserir, uFrmClienteEditar, Vcl.Dialogs, System.UITypes;

type
  TFrmListaClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtBuscarCliente: TLabeledEdit;
    btnBuscarCliente: TButton;
    Panel3: TPanel;
    btnNovoCliente: TButton;
    btnEditarCliente: TButton;
    btnExcluirCliente: TButton;
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarClienteClick(Sender: TObject);
    procedure btnNovoClienteClick(Sender: TObject);
    procedure btnEditarClienteClick(Sender: TObject);
    procedure btnExcluirClienteClick(Sender: TObject);
  private
    DM : TDM;
    _ClienteDAO : TClienteDAO;
    procedure PreencherLista(pListaClientes : TList<TCliente>);
    procedure CarregarClientes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListaClientes: TFrmListaClientes;

implementation

{$R *.dfm}

procedure TFrmListaClientes.btnBuscarClienteClick(Sender: TObject);
begin
  CarregarClientes;
end;

procedure TFrmListaClientes.btnEditarClienteClick(Sender: TObject);
begin
  try
    FrmClienteEditar := TFrmClienteEditar.Create(Self, TCliente(ListView1.ItemFocused.Data));
    FrmClienteEditar.ShowModal;
    CarregarClientes;
  finally
    FreeAndNil(FrmClienteEditar);
  end;
end;

procedure TFrmListaClientes.btnExcluirClienteClick(Sender: TObject);
begin
  if MessageDlg('Deseja remover esse cliente da lista', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if ListView1.ItemIndex > -1 then
    begin
      if _ClienteDAO.Deletar(TCliente(ListView1.ItemFocused.Data)) then
        CarregarClientes;
    end;
  end;
end;

procedure TFrmListaClientes.btnNovoClienteClick(Sender: TObject);
begin
  try
    FrmClientesInserir := TFrmClientesInserir.Create(Self);
    FrmClientesInserir.ShowModal;
    CarregarClientes;
  finally
    FreeAndNil(FrmClientesInserir);
  end;
end;

procedure TFrmListaClientes.CarregarClientes;
begin
  try
    PreencherLista(_ClienteDAO.ListarPorNome(edtBuscarCliente.Text));
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmListaClientes.FormCreate(Sender: TObject);
begin
  DM := TDM.Create(Self);
  _ClienteDAO := TClienteDAO.Create;
//  CarregarClientes;
end;

procedure TFrmListaClientes.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(DM) then
      FreeAndNil(DM);
    if Assigned(_ClienteDAO) then
      FreeAndNil(_ClienteDAO);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmListaClientes.PreencherLista(pListaClientes: TList<TCliente>);
var
  i : integer;
  tempCliente : TListItem;
begin
  if Assigned(pListaClientes) then
  begin
    ListView1.Clear;
    for i := 0 to pListaClientes.Count-1 do
    begin
      tempCliente := ListView1.Items.Add;
      tempCliente.Caption := IntToStr(TCliente(pListaClientes[i]).Codigo);
      tempCliente.SubItems.Add(TCliente(pListaClientes[i]).Nome);
      tempCliente.SubItems.Add(TCliente(pListaClientes[i]).Telefone);
      tempCliente.SubItems.Add(TCliente(pListaClientes[i]).Cpf);
      tempCliente.SubItems.Add(TCliente(pListaClientes[i]).Endereco);
      tempCliente.SubItems.Add(FormatDateTime('yyyy-mm-dd', TCliente(pListaClientes[i]).DataNasc));
      tempCliente.SubItems.Add(TCliente(pListaClientes[i]).Sexo);
      tempCliente.Data := TCliente(pListaClientes[i]);
    end;
  end
  else
    ShowMessage('Nenhum cliente encontrado');
end;

end.
