unit uFrmListaDePedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  uDataModule, uPedido, uPedidoDAO, System.Generics.Collections,
  uFrmPedidoInserir, uFrmPedidoEditar, System.UITypes, uCliente;

type
  TFrmListaDePedidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtBuscarPedido: TLabeledEdit;
    btnBuscarPedido: TButton;
    Panel3: TPanel;
    btnNovoPedido: TButton;
    btnEditarPedido: TButton;
    btnExcluirPedido: TButton;
    ListView1: TListView;
    procedure btnBuscarPedidoClick(Sender: TObject);
    procedure btnNovoPedidoClick(Sender: TObject);
    procedure btnEditarPedidoClick(Sender: TObject);
    procedure btnExcluirPedidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    DM : TDM;
    _PedidoDAO : TPedidoDAO;
    procedure PreencherLista(pListaPedidos : TList<TPedido>);
    procedure CarregarPedidos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListaDePedidos: TFrmListaDePedidos;

implementation

{$R *.dfm}

{ TFrmListaDePedidos }

procedure TFrmListaDePedidos.btnBuscarPedidoClick(Sender: TObject);
begin
  CarregarPedidos;
end;

procedure TFrmListaDePedidos.btnEditarPedidoClick(Sender: TObject);
begin
  try
    FrmPedidoEditar := TFrmPedidoEditar.Create(Self, TPedido(ListView1.ItemFocused.Data));
    FrmPedidoEditar.ShowModal;
    CarregarPedidos;
  finally
    FreeAndNil(FrmPedidoEditar);
  end;
end;

procedure TFrmListaDePedidos.btnExcluirPedidoClick(Sender: TObject);
begin
  if MessageDlg('Deseja remover esse pedido da lista', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if ListView1.ItemIndex > -1 then
    begin
      if _PedidoDAO.Deletar(TPedido(ListView1.ItemFocused.Data)) then
        CarregarPedidos;
    end;
  end;
end;

procedure TFrmListaDePedidos.btnNovoPedidoClick(Sender: TObject);
begin
  try
    FrmPedidoInserir := TFrmPedidoInserir.Create(Self);
    FrmPedidoInserir.ShowModal;
    CarregarPedidos;
  finally
    FreeAndNil(FrmPedidoInserir);
  end;
end;

procedure TFrmListaDePedidos.CarregarPedidos;
begin
  try
    PreencherLista(_PedidoDAO.ListarPedido(edtBuscarPedido.Text));
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmListaDePedidos.FormCreate(Sender: TObject);
begin
  DM := TDM.Create(Self);
  _PedidoDAO := TPedidoDAO.Create;
//  CarregarPedidos;
end;

procedure TFrmListaDePedidos.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(DM) then
      FreeAndNil(DM);
    if Assigned(_PedidoDAO) then
      FreeAndNil(_PedidoDAO);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmListaDePedidos.PreencherLista(pListaPedidos: TList<TPedido>);
var
  i : integer;
  tempPedido : TListItem;
begin
  if Assigned(pListaPedidos) then
  begin
    ListView1.Clear;
    for i := 0 to pListaPedidos.Count-1 do
    begin
      tempPedido := ListView1.Items.Add;
      tempPedido.Caption := IntToStr(TPedido(pListaPedidos[i]).CodigoPedido);
      tempPedido.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:mm', TPedido(pListaPedidos[i]).DataHora));
      tempPedido.SubItems.Add(IntToStr(TPedido(pListaPedidos[i]).CodigoCliente));
      tempPedido.SubItems.Add(IntToStr(TPedido(pListaPedidos[i]).CodigoSabor));
      tempPedido.SubItems.Add(IntToStr(TPedido(pListaPedidos[i]).CodigoVendedor));
      tempPedido.SubItems.Add(IntToStr(TPedido(pListaPedidos[i]).Tamanho));
      tempPedido.SubItems.Add(FloatToStr(TPedido(pListaPedidos[i]).Valor));
      tempPedido.Data := TPedido(pListaPedidos[i]);
    end;
  end
  else
    ShowMessage('Nenhum pedido encontrado');
end;

end.
