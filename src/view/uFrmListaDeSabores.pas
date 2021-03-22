unit uFrmListaDeSabores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  uSabor, uSaborDAO, System.Generics.Collections, uDataModule, System.UITypes,
  uFrmSaborInserir, uFrmSaborEditar;

type
  TFrmListaSabores = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtBuscarSabor: TLabeledEdit;
    btnBuscarSabor: TButton;
    Panel3: TPanel;
    btnNovoSabor: TButton;
    btnEditarSabor: TButton;
    btnExcluirSabor: TButton;
    ListView1: TListView;
    procedure btnExcluirSaborClick(Sender: TObject);
    procedure btnEditarSaborClick(Sender: TObject);
    procedure btnNovoSaborClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarSaborClick(Sender: TObject);
  private
    DM : TDM;
    _SaborDAO : TSaborDAO;
    procedure PreencherLista(pListaSabores : TList<TSabor>);
    procedure CarregarSabores;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListaSabores: TFrmListaSabores;

implementation

{$R *.dfm}

{ TForm2 }

procedure TFrmListaSabores.btnBuscarSaborClick(Sender: TObject);
begin
  CarregarSabores;
end;

procedure TFrmListaSabores.btnEditarSaborClick(Sender: TObject);
begin
  try
    FrmSaborEditar := TFrmSaborEditar.Create(Self, TSabor(ListView1.ItemFocused.Data));
    FrmSaborEditar.ShowModal;
    CarregarSabores;
  finally
    FreeAndNil(FrmSaborEditar);
  end;
end;

procedure TFrmListaSabores.btnExcluirSaborClick(Sender: TObject);
begin
  if MessageDlg('Deseja remover esse sabor da lista', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if ListView1.ItemIndex > -1 then
    begin
      if _SaborDAO.Deletar(TSabor(ListView1.ItemFocused.Data)) then
        CarregarSabores;
    end;
  end;
end;

procedure TFrmListaSabores.btnNovoSaborClick(Sender: TObject);
begin
  try
    FrmSaborInserir := TFrmSaborInserir.Create(Self);
    FrmSaborInserir.ShowModal;
    CarregarSabores;
  finally
    FreeAndNil(FrmSaborInserir);
  end;
end;

procedure TFrmListaSabores.CarregarSabores;
begin
  try
    PreencherLista(_SaborDAO.ListarPorNome(edtBuscarSabor.Text));
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmListaSabores.FormCreate(Sender: TObject);
begin
  DM        := TDM.Create(Self);
  _SaborDAO := TSaborDAO.Create;
end;

procedure TFrmListaSabores.PreencherLista(pListaSabores: TList<TSabor>);
var
  i : integer;
  tempSabor : TListItem;
begin
  if Assigned(pListaSabores) then
  begin
    ListView1.Clear;
    for i := 0 to pListaSabores.Count-1 do
    begin
      tempSabor         := ListView1.Items.Add;
      tempSabor.Caption := IntToStr(TSabor(pListaSabores[i]).Codigo);
      tempSabor.SubItems.Add(TSabor(pListaSabores[i]).Sabor);
      tempSabor.SubItems.Add(TSabor(pListaSabores[i]).Ingredientes);
      tempSabor.Data    := TSabor(pListaSabores[i]);
    end;
  end
  else
    ShowMessage('Nenhum sabor encontrado');
end;

end.
