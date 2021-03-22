unit uFrmPedidoInserir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  uPedidoDAO, uPedido, System.ImageList, Vcl.ImgList, uFrmListaDeClientes,
  uFrmListaDeVendedores, uFrmListaDeSabores;

type
  TFrmPedidoInserir = class(TForm)
    panel: TPanel;
    DataHoraPedido: TDateTimePicker;
    edtCodigoCliente: TEdit;
    edtCodigoSabor: TEdit;
    edtCodigoVendedor: TEdit;
    edtTamanho: TEdit;
    edtValor: TEdit;
    btnSalvar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnBuscarSabor: TButton;
    ImageList1: TImageList;
    btnBuscarVendedor: TButton;
    btnBuscarCliente: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClienteClick(Sender: TObject);
    procedure btnBuscarSaborClick(Sender: TObject);
    procedure btnBuscarVendedorClick(Sender: TObject);
  private
    _Pedido : TPedido;
    _PedidoDAO : TPedidoDAO;
    procedure PreencherPedido;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedidoInserir: TFrmPedidoInserir;

implementation

{$R *.dfm}

{ TFrmPedidoInserir }

procedure TFrmPedidoInserir.btnBuscarSaborClick(Sender: TObject);
begin
  FrmListaDeVendedores.ShowModal;
end;

procedure TFrmPedidoInserir.btnBuscarVendedorClick(Sender: TObject);
begin
  FrmListaSabores.ShowModal;
end;

procedure TFrmPedidoInserir.btnSalvarClick(Sender: TObject);
begin
  PreencherPedido;
  if _PedidoDAO.Inserir(_Pedido) then
  begin
    ShowMessage('Pedido cadastrado com sucesso!');
    Close;
  end;
end;

procedure TFrmPedidoInserir.btnBuscarClienteClick(Sender: TObject);
begin
  FrmListaClientes.ShowModal;
end;

procedure TFrmPedidoInserir.FormCreate(Sender: TObject);
begin
  _Pedido    := TPedido.Create;
  _PedidoDAO := TPedidoDAO.Create;
end;

procedure TFrmPedidoInserir.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(_Pedido) then
      FreeAndNil(_Pedido);
    if Assigned(_PedidoDAO) then
      FreeAndNil(_PedidoDAO);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmPedidoInserir.PreencherPedido;
begin
  _Pedido.DataHora       := DataHoraPedido.DateTime;
  _Pedido.CodigoCliente  := StrToInt(edtCodigoCliente.Text);
  _Pedido.CodigoSabor    := StrToInt(edtCodigoSabor.Text);
  _Pedido.CodigoVendedor := StrToInt(edtCodigoVendedor.Text);
  _Pedido.Tamanho        := StrToInt(edtTamanho.Text);
  _Pedido.Valor          := StrToFloat(edtValor.Text);
end;

end.
