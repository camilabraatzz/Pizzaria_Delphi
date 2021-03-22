unit uNotaFiscal;

interface

type
  TNotaFiscal = class
  private
    FCodigoPedido : integer;
    FDataHora : TDateTime;
    FCodigoCliente : integer;
    FNomeCliente : String;
    FCodigoSabor : integer;
    FSabor : String;
    FCodigoVendedor : integer;
    FNomeVendedor : String;
    FTamanho : Integer;
    FValor : Double;
    procedure SetCodigo(const Value: integer);
    procedure SetCodigoCliente(const Value: integer);
    procedure SetCodigoPedido(const Value: integer);
    procedure SetCodigoSabor(const Value: integer);
    procedure SetDataHora(const Value: TDateTime);
    procedure SetNomeCliente(const Value: String);
    procedure SetNomeVendedor(const Value: String);
    procedure SetSabor(const Value: String);
    procedure SetTamanho(const Value: integer);
    procedure SetValor(const Value: double);
  public
    property CodigoPedido : integer read FCodigoPedido write SetCodigoPedido;
    property DataHora : TDateTime read FDataHora write SetDataHora;
    property CodigoCliente : integer read FCodigoCliente write SetCodigoCliente;
    property NomeCliente : String read FNomeCliente write SetNomeCliente;
    property CodigoSabor : integer read FCodigoSabor write SetCodigoSabor;
    property Sabor : String read FSabor write SetSabor;
    property CodigoVendedor : integer read FCodigoVendedor write SetCodigo;
    property NomeVendedor : String read FNomeVendedor write SetNomeVendedor;
    property Tamanho : integer read FTamanho write SetTamanho;
    property Valor : double read FValor write SetValor;
  end;

implementation

{ TNotaFiscal }

procedure TNotaFiscal.SetCodigo(const Value: integer);
begin
  FCodigoVendedor := Value;
end;

procedure TNotaFiscal.SetCodigoCliente(const Value: integer);
begin
  FCodigoCliente := Value;
end;

procedure TNotaFiscal.SetCodigoPedido(const Value: integer);
begin
  FCodigoPedido := Value;
end;

procedure TNotaFiscal.SetCodigoSabor(const Value: integer);
begin
  FCodigoSabor := Value;
end;

procedure TNotaFiscal.SetDataHora(const Value: TDateTime);
begin
  FDataHora := Value;
end;

procedure TNotaFiscal.SetNomeCliente(const Value: String);
begin
  FNomeCliente := Value;
end;

procedure TNotaFiscal.SetNomeVendedor(const Value: String);
begin
  FNomeVendedor := Value;
end;

procedure TNotaFiscal.SetSabor(const Value: String);
begin
  FSabor := Value;
end;

procedure TNotaFiscal.SetTamanho(const Value: integer);
begin
  FTamanho := Value;
end;

procedure TNotaFiscal.SetValor(const Value: double);
begin
  FValor := Value;
end;

end.
