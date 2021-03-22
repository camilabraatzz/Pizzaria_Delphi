unit uFrmPedidoEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPedido, uPedidoDAO, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrmPedidoEditar = class(TForm)
    Panel1: TPanel;
    DataHoraPedido: TDateTimePicker;
    edtCodigoCliente: TEdit;
    edtCodigoSabor: TEdit;
    edtCodigoVendedor: TEdit;
    edtTamanho: TEdit;
    edtValor: TEdit;
    btnSalvar: TButton;
    btnExcluir: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    _Pedido : TPedido;
    _PedidoDAO : TPedidoDAO;
    procedure PreencherPedido;
    procedure PreencherTela;
    { Private declarations }
  public
    constructor Create(AOwner : TComponent; pPedido : TPedido);
    { Public declarations }
  end;

var
  FrmPedidoEditar: TFrmPedidoEditar;

implementation

{$R *.dfm}

{ TFrmPedidoEditar }

procedure TFrmPedidoEditar.btnExcluirClick(Sender: TObject);
begin
  if _PedidoDAO.Deletar(_Pedido) then
  begin
    ShowMessage('Pedido exclu[ido com sucesso!');
    Close;
  end;
end;

procedure TFrmPedidoEditar.btnSalvarClick(Sender: TObject);
begin
  PreencherPedido;
  if _PedidoDAO.Alterar(_Pedido) then
  begin
    ShowMessage('Pedido alterado com sucesso!');
    Close;
  end;
end;

constructor TFrmPedidoEditar.Create(AOwner: TComponent; pPedido: TPedido);
begin
  inherited Create(AOwner);
  _PedidoDAO := TPedidoDAO.Create;
  try
    if Assigned(pPedido) then
    begin
      _Pedido := pPedido;
      PreencherTela;
    end;
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmPedidoEditar.PreencherPedido;
begin
  _Pedido.DataHora       := DataHoraPedido.DateTime;
  _Pedido.CodigoCliente  := StrToInt(edtCodigoCliente.Text);
  _Pedido.CodigoSabor    := StrToInt(edtCodigoSabor.Text);
  _Pedido.CodigoVendedor := StrToInt(edtCodigoVendedor.Text);
  _Pedido.Tamanho        := StrToInt(edtTamanho.Text);
  _Pedido.Valor          := StrToFloat(edtValor.Text);
end;

procedure TFrmPedidoEditar.PreencherTela;
begin
  DataHoraPedido.DateTime := _Pedido.DataHora;
  edtCodigoCliente.Text   := IntToStr(_Pedido.CodigoCliente);
  edtCodigoSabor.Text     := IntToStr(_Pedido.CodigoSabor);
  edtCodigoVendedor.Text  := IntToStr(_Pedido.CodigoVendedor);
  edtTamanho.Text         := IntToStr(_Pedido.Tamanho);
  edtValor.Text           := FloatToStr(_Pedido.Valor);
end;

end.
