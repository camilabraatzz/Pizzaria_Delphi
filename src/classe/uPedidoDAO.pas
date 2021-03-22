unit uPedidoDAO;

interface

uses
  uBaseDAO, System.Generics.Collections, uPedido, FireDAC.Comp.Client,
  System.SysUtils, Data.DB;

type
  TPedidoDAO = class(TBaseDAO)
  private
    FListaDePedidos : TObjectList<TPedido>;
    procedure Preencher(Ds : TFDQuery);
  public
    constructor Create;
    destructor Destroy; override;
    function Inserir(pPedido : TPedido)  : Boolean;
    function Deletar(pPedido : TPedido)  : Boolean;
    function Alterar(pPedido : TPedido)  : Boolean;
    function ListarPedido(pCodigo : String) : TObjectList<TPedido>;

  end;

implementation

{ TPedidoDAO }

function TPedidoDAO.Alterar(pPedido: TPedido): Boolean;
var
  Sql : String;
begin
  Sql := 'UPDATE PEDIDO ' +
         '  SET DATAHORA_PEDIDO = ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm', pPedido.DataHora) + ',' +
         '    CODIGO_CLIENTE    = ' + IntToStr(pPedido.CodigoCliente) + ',' +
         '    CODIGO_SABOR      = ' + IntToStr(pPedido.CodigoSabor) + ',' +
         '    CODIGO_VENDEDOR   = ' + IntToStr(pPedido.CodigoVendedor) + ',' +
         '    TAMANHO           = ' + IntToStr(pPedido.Tamanho)) + ',' +
         '    VALOR             = ' + FloatToStr(pPedido.Valor) +
         'WHERE CODIGO          = ' + IntToStr(pPedido.CodigoPedido);
  Result := ExecutarComando(Sql) > 0;
end;

constructor TPedidoDAO.Create;
begin
  inherited Create;
  FListaDePedidos := TObjectList<TPedido>.Create;
end;

function TPedidoDAO.Deletar(pPedido: TPedido): Boolean;
var
  Sql : String;
begin
  Sql := 'DELETE          ' +
         '  FROM PEDIDO   ' +
         ' WHERE CODIGO = ' + IntToStr(pPedido.CodigoPedido);
  Result := ExecutarComando(Sql) > 0;
end;

destructor TPedidoDAO.Destroy;
begin
  inherited;
  try
    if Assigned(FListaDePedidos) then
      FreeAndNil(FListaDePedidos);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TPedidoDAO.Inserir(pPedido: TPedido): Boolean;
var
  Sql : String;
begin
  Sql := 'INSERT INTO PEDIDO(DATAHORA_PEDIDO, CODIGO_CLIENTE, ' +
         'CODIGO_SABOR, CODIGO_VENDEDOR, TAMANHO, VALOR)      ' +
         'VALUES (' +
                 QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm', pPedido.DataHora)) + ',' +
                 IntToStr(pPedido.CodigoCliente) + ',' +
                 IntToStr(pPedido.CodigoSabor) + ',' +
                 IntToStr(pPedido.CodigoVendedor) + ',' +
                 IntToStr(pPedido.Tamanho) + ',' +
                 FloatToStr(pPedido.Valor) +
                 ')';
  Result := ExecutarComando(Sql) > 0;
end;

function TPedidoDAO.ListarPedido(pCodigo: String): TObjectList<TPedido>;
var
  Sql : String;
begin
  Result := Nil;
  Sql := 'SELECT P.CODIGO, P.DATAHORA_PEDIDO, P.CODIGO_CLIENTE,        ' +
         '       P.CODIGO_SABOR, P.CODIGO_VENDEDOR, P.TAMANHO, P.VALOR ' +
         '  FROM PEDIDO P                                              ';

  _FQry := RetornaDataSet(Sql);

  if not(_FQry.IsEmpty) then
  begin
    Preencher(_FQry);
    Result := FListaDePedidos;
  end;
end;

procedure TPedidoDAO.Preencher(Ds: TFDQuery);
var
  I : integer;
begin
  I := 0;
  FListaDePedidos.Clear;
  while not Ds.Eof do
  begin
    FListaDePedidos.Add(TPedido.Create);
    FListaDePedidos[I].CodigoPedido   := Ds.FieldByName('CODIGO').AsInteger;
    FListaDePedidos[I].DataHora       := Ds.FieldByName('DATAHORA_PEDIDO').AsDateTime;
    FListaDePedidos[I].CodigoCliente  := Ds.FieldByName('CODIGO_CLIENTE').AsInteger;
    FListaDePedidos[I].CodigoSabor    := Ds.FieldByName('CODIGO_SABOR').AsInteger;
    FListaDePedidos[I].CodigoVendedor := Ds.FieldByName('CODIGO_VENDEDOR').AsInteger;
    FListaDePedidos[I].Tamanho        := Ds.FieldByName('TAMANHO').AsInteger;
    FListaDePedidos[I].Valor          := Ds.FieldByName('VALOR').AsFloat;
    Ds.Next;
    I := I + 1;
  end;
end;

end.
