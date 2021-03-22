unit uClienteDAO;

interface

uses
  uBaseDAO, System.Generics.Collections, uCliente, FireDAC.Comp.Client,
  System.SysUtils, Data.DB;

type
  TClienteDAO = class(TBaseDAO)
  private
    FListaDeClientes : TObjectList<TCliente>;
    procedure Preencher(Ds : TFDQuery);
  public
    constructor Create;
    destructor Destroy; override;
    function Inserir(pCliente : TCliente)  : Boolean;
    function Deletar(pCliente : TCliente)  : Boolean;
    function Alterar(pCliente : TCliente)  : Boolean;
    function ListarPorNome(pNome : String) : TObjectList<TCliente>;
  end;

implementation

{ TClienteDAO }

function TClienteDAO.Alterar(pCliente: TCliente): Boolean;
var
  Sql : String;
begin
  Sql := 'UPDATE CLIENTE ' +
         '  SET NOME          = ' + QuotedStr(pCliente.Nome) + ',' +
         '    TELEFONE        = ' + QuotedStr(pCliente.Telefone) + ',' +
         '    CPF             = ' + QuotedStr(pCliente.Cpf) + ',' +
         '    ENDERECO        = ' + QuotedStr(pCliente.Endereco) + ',' +
         '    DATA_NASCIMENTO = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', pCliente.DataNasc)) + ',' +
         '    SEXO            = ' + QuotedStr(pCliente.Sexo) +
         'WHERE CODIGO        = ' + IntToStr(pCliente.Codigo);
  Result := ExecutarComando(Sql) > 0;
end;

constructor TClienteDAO.Create;
begin
  inherited Create;
  FListaDeClientes := TObjectList<TCliente>.Create;
end;

function TClienteDAO.Deletar(pCliente: TCliente): Boolean;
var
  Sql : String;
begin
  Sql := 'DELETE          ' +
         '  FROM CLIENTE  ' +
         ' WHERE CODIGO = ' + IntToStr(pCliente.Codigo);
  Result := ExecutarComando(Sql) > 0;
end;

destructor TClienteDAO.Destroy;
begin
  inherited;
  try
    if Assigned(FListaDeClientes) then
      FreeAndNil(FListaDeClientes);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TClienteDAO.Inserir(pCliente: TCliente): Boolean;
var
  Sql : String;
begin
  Sql := 'INSERT INTO CLIENTE (NOME, TELEFONE, CPF, ENDERECO, DATA_NASCIMENTO, SEXO)' +
         'VALUES(' +
                QuotedStr(pCliente.Nome) + ',' +
                QuotedStr(pCliente.Telefone) + ',' +
                QuotedStr(pCliente.Cpf) + ',' +
                QuotedStr(pCliente.Endereco) + ',' +
                QuotedStr(FormatDateTime('yyyy-mm-dd',pCliente.DataNasc)) + ',' +
                QuotedStr(pCliente.Sexo) +
                ')';
  Result := ExecutarComando(Sql) > 0;
end;

function TClienteDAO.ListarPorNome(pNome: String): TObjectList<TCliente>;
var
  Sql : String;
begin
  Result := Nil;
  Sql := 'SELECT C.CODIGO, C.NOME, C.TELEFONE, C.CPF,  ' +
         '       C.ENDERECO, C.DATA_NASCIMENTO, C.SEXO ' +
         '  FROM CLIENTE C                             ' +
         ' WHERE NOME LIKE ' + QuotedStr('%'+pNome+'%');

  _FQry := RetornaDataSet(Sql);

  if not(_FQry.IsEmpty) then
  begin
    Preencher(_FQry);
    Result := FListaDeClientes;
  end;
end;

procedure TClienteDAO.Preencher(Ds: TFDQuery);
var
  I : integer;
begin
  I := 0;
  FListaDeClientes.Clear;
  while not Ds.Eof do
  begin
    FListaDeClientes.Add(TCliente.Create);
    FListaDeClientes[I].Codigo     := Ds.FieldByName('CODIGO').AsInteger;
    FListaDeClientes[I].Nome       := Ds.FieldByName('NOME').AsString;
    FListaDeClientes[I].Telefone   := Ds.FieldByName('TELEFONE').AsString;
    FListaDeClientes[I].Cpf        := Ds.FieldByName('CPF').AsString;
    FListaDeClientes[I].Endereco   := Ds.FieldByName('ENDERECO').AsString;
    FListaDeClientes[I].DataNasc   := Ds.FieldByName('DATA_NASCIMENTO').AsDateTime;
    FListaDeClientes[I].Sexo       := Ds.FieldByName('SEXO').AsString;
    Ds.Next;
    I := I + 1;
  end;
end;

end.
