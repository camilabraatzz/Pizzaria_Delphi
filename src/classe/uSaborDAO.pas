unit uSaborDAO;

interface

uses
  uBaseDAO, System.Generics.Collections, uSabor, FireDAC.Comp.Client,
  System.SysUtils, Data.DB;

type
  TSaborDAO = class(TBaseDAO)
  private
    FListaDeSabores : TObjectList<TSabor>;
    procedure Preencher(Ds : TFDQuery);
  public
    constructor Create;
    destructor Destroy; override;
    function Inserir(pSabor : TSabor) : Boolean;
    function Alterar(pSabor : TSabor) : Boolean;
    function Deletar(pSabor : TSabor) : Boolean;
    function ListarPorNome(pSabor : String) : TObjectList<TSabor>;
  end;

implementation

{ TSaborDAO }

function TSaborDAO.Alterar(pSabor: TSabor): Boolean;
var
  Sql : String;
begin
  Sql := 'UPDATE SABOR         ' +
         '  SET SABOR        = ' + QuotedStr(pSabor.Sabor) + ',' +
         '      INGREDIENTES = ' + QuotedStr(pSabor.Ingredientes) +
         ' WHERE CODIGO      = ' + IntToStr(pSabor.Codigo);
  Result := ExecutarComando(Sql) > 0;
end;

constructor TSaborDAO.Create;
begin
  inherited Create;
  FListaDeSabores := TObjectList<TSabor>.Create;
end;

function TSaborDAO.Deletar(pSabor: TSabor): Boolean;
var
  Sql : String;
begin
  Sql := 'DELETE' +
         '  FROM SABOR ' +
         ' WHERE CODIGO = ' + IntToStr(pSabor.Codigo);
  Result := ExecutarComando(Sql) > 0;
end;

destructor TSaborDAO.Destroy;
begin
  inherited;
  try
    if Assigned(FListaDeSabores) then
    FreeAndNil(FListaDeSabores);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TSaborDAO.Inserir(pSabor: TSabor): Boolean;
var
  Sql : String;
begin
  Sql := 'INSERT INTO SABOR(SABOR, INGREDIENTES)' +
         ' VALUES (' +
                  QuotedStr(pSabor.Sabor) + ',' +
                  QuotedStr(pSabor.Ingredientes) +
                  ')';
  Result := ExecutarComando(Sql) > 0;
end;

function TSaborDAO.ListarPorNome(pSabor: String): TObjectList<TSabor>;
var
  Sql : string;
begin
  Sql := 'SELECT S.CODIGO, S.SABOR, S.INGREDIENTES' +
         '  FROM SABOR S                ' +
         ' WHERE SABOR LIKE ' + QuotedStr('%'+pSabor+'%');
  _FQry := RetornaDataSet(Sql);

  if not(_FQry.IsEmpty) then
  begin
    Preencher(_FQry);
    Result := FListaDeSabores;
  end;
end;

procedure TSaborDAO.Preencher(Ds: TFDQuery);
var
  I : integer;
begin
  I := 0;
  FListaDeSabores.Clear;
  while not Ds.Eof do
  begin
    FListaDeSabores.Add(TSabor.Create);
    FListaDeSabores[I].Codigo       := Ds.FieldByName('CODIGO').AsInteger;
    FListaDeSabores[I].Sabor        := Ds.FieldByName('SABOR').AsString;
    FListaDeSabores[I].Ingredientes := Ds.FieldByName('INGREDIENTES').AsString;
    Ds.Next;
    I := I + 1;
  end;
end;

end.
