unit uVendedorDAO;

interface

uses
  uBaseDAO, System.Generics.Collections, uVendedor, FireDAC.Comp.Client,
  System.SysUtils, Data.DB;

type
  TVendedorDAO = class(TBaseDAO)
  private
    FListaDeVendedores : TObjectList<TVendedor>;
    procedure Preencher(Ds : TFDQuery);
  public
    constructor Create;
    destructor Destroy; override;
    function Inserir(pVendedor : TVendedor)  : Boolean;
    function Deletar(pVendedor : TVendedor)  : Boolean;
    function Alterar(pVendedor : TVendedor)  : Boolean;
    function ListarPorNome(pNome : String) : TObjectList<TVendedor>;
  end;

implementation

{ TVendedorDAO }

function TVendedorDAO.Alterar(pVendedor: TVendedor): Boolean;
var
  Sql : string;
begin
  Sql := 'UPDATE VENDEDOR ' +
         '  SET NOME          = ' + QuotedStr(pVendedor.Nome) + ',' +
         '    TELEFONE        = ' + QuotedStr(pVendedor.Telefone) + ',' +
         '    CPF             = ' + QuotedStr(pVendedor.Cpf) + ',' +
         '    ENDERECO        = ' + QuotedStr(pVendedor.Endereco) + ',' +
         '    DATA_NASCIMENTO = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', pVendedor.DataNasc)) + ',' +
         '    SEXO            = ' + QuotedStr(pVendedor.Sexo) +
         'WHERE CODIGO        = ' + IntToStr(pVendedor.Codigo);
  Result := ExecutarComando(Sql) > 0;
end;

constructor TVendedorDAO.Create;
begin
  inherited Create;
  FListaDeVendedores := TObjectList<TVendedor>.Create;
end;

function TVendedorDAO.Deletar(pVendedor: TVendedor): Boolean;
var
  Sql : string;
begin
  Sql := 'DELETE          ' +
         '  FROM VENDEDOR ' +
         ' WHERE CODIGO = ' + IntToStr(pVendedor.Codigo);
  Result := ExecutarComando(Sql) > 0;
end;

destructor TVendedorDAO.Destroy;
begin
  inherited;
  try
    if Assigned(FListaDeVendedores) then
      FreeAndNil(FListaDeVendedores);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TVendedorDAO.Inserir(pVendedor: TVendedor): Boolean;
var
  Sql : String;
begin
  Sql := 'INSERT INTO VENDEDOR(NOME, TELEFONE, CPF, ENDERECO, DATA_NASCIMENTO, SEXO)' +
         'VALUES (' +
                 QuotedStr(pVendedor.Nome) + ',' +
                 QuotedStr(pVendedor.Telefone) + ',' +
                 QuotedStr(pVendedor.Cpf) + ',' +
                 QuotedStr(pVendedor.Endereco) + ',' +
                 QuotedStr(FormatDateTime('yyyy-mm-dd',pVendedor.DataNasc)) + ',' +
                 QuotedStr(pVendedor.Sexo) +
                 ')';
  Result := ExecutarComando(Sql) > 0;

end;

function TVendedorDAO.ListarPorNome(pNome: String): TObjectList<TVendedor>;
var
  Sql : String;
begin
  Result := Nil;
  Sql := 'SELECT V.CODIGO, V.NOME, V.TELEFONE, V.CPF,  ' +
         '       V.ENDERECO, V.DATA_NASCIMENTO, V.SEXO ' +
         '  FROM VENDEDOR V                            ' +
         ' WHERE NOME LIKE ' + QuotedStr('%'+pNome+'%');

  _FQry := RetornaDataSet(Sql);

  if not(_FQry.IsEmpty) then
  begin
    Preencher(_FQry);
    Result := FListaDeVendedores;
  end;
end;

procedure TVendedorDAO.Preencher(Ds: TFDQuery);
var
  I : integer;
begin
  I := 0;
  FListaDeVendedores.Clear;
  while not Ds.Eof do
  begin
    FListaDeVendedores.Add(TVendedor.Create);
    FListaDeVendedores[I].Codigo     := Ds.FieldByName('CODIGO').AsInteger;
    FListaDeVendedores[I].Nome       := Ds.FieldByName('NOME').AsString;
    FListaDeVendedores[I].Telefone   := Ds.FieldByName('TELEFONE').AsString;
    FListaDeVendedores[I].Cpf        := Ds.FieldByName('CPF').AsString;
    FListaDeVendedores[I].Endereco   := Ds.FieldByName('ENDERECO').AsString;
    FListaDeVendedores[I].DataNasc   := Ds.FieldByName('DATA_NASCIMENTO').AsDateTime;
    FListaDeVendedores[I].Sexo       := Ds.FieldByName('SEXO').AsString;
    Ds.Next;
    I := I + 1;
  end;
end;

end.
