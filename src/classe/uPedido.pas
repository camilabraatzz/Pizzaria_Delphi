unit uPedido;

interface

uses
  uException, System.SysUtils, System.Classes;

type
  TPedido = class
  private
    FCodigoPedido : integer;
    FDataHora : TDateTime;
    FCodigoCliente : integer;
    FCodigoSabor : integer;
    FCodigoVendedor : integer;
    FTamanho : integer;
    FValor : Double;
    procedure SetDataHora(const Value: TDateTime);
    procedure SetPedido(const Value: integer);
    procedure SetCodigoCliente(const Value: integer);
    procedure SetCodigoSabor(const Value: integer);
    procedure SetCodigoVendedor(const Value: integer);
    procedure SetTamanho(const Value: integer);
    procedure SetValor(const Value: Double);
  public
    constructor Create;
    property CodigoPedido : integer read FCodigoPedido write SetPedido;
    property DataHora : TDateTime read FDataHora write SetDataHora;
    property CodigoCliente : integer read FCodigoCliente write SetCodigoCliente;
    property CodigoSabor : integer read FCodigoSabor write SetCodigoSabor;
    property CodigoVendedor : integer read FCodigoVendedor write SetCodigoVendedor;
    property Tamanho : integer read FTamanho write SetTamanho;
    property Valor: Double read FValor write SetValor;
  end;

implementation

{ TPedido }

constructor TPedido.Create;
begin
  FCodigoPedido   := 0;
  FCodigoCliente  := 0;
  FCodigoSabor    := 0;
  FCodigoVendedor := 0;
  FTamanho        := 0;
  FValor          := 0;
  FDataHora       := Now;
end;

procedure TPedido.SetCodigoCliente(const Value: integer);
begin
  if Value = 0 then
    raise ECodigoClienteObrigatorio.Create;
  FCodigoCliente := Value;
end;

procedure TPedido.SetCodigoSabor(const Value: integer);
begin
  if Value = 0 then
    raise ECodigoSaborObrigatorio.Create;
  FCodigoSabor := Value;
end;

procedure TPedido.SetCodigoVendedor(const Value: integer);
begin
  if Value = 0 then
    raise ECodigoVendedorObrigatorio.Create;
  FCodigoVendedor := Value;
end;

procedure TPedido.SetDataHora(const Value: TDateTime);
begin
  FDataHora := Value;
end;

procedure TPedido.SetPedido(const Value: integer);
begin
  FCodigoPedido := Value;
end;

procedure TPedido.SetTamanho(const Value: integer);
begin
  if Value = 0 then
    raise ETamanhoObrigatorio.Create;
  FTamanho := Value;
end;

procedure TPedido.SetValor(const Value: Double);
begin
  if Value = 0 then
    raise EValorObrigatorio.Create;
  FValor := Value;
end;

end.
