unit uBaseDAO;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, uDataModule, Data.DB, Vcl.Dialogs,
     System.Classes;

type
  TBaseDAO = class(TObject)
  private

  protected
    _FQry : TFDQuery;
    constructor Create;
    destructor Destroy; override;
    function RetornaDataSet(pSQL : String)  : TFDQuery;
    function ExecutarComando(pSQL : String) : Integer;
  public
  end;

implementation

{ TBaseDAO }

constructor TBaseDAO.Create;
begin
  inherited Create;
  _FQry            := TFDQuery.Create(Nil);
  _FQry.Connection := DM.PizzariaConnection;
end;

destructor TBaseDAO.Destroy;
begin
  try
    if Assigned(_FQry) then
      FreeAndNil(_FQry);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TBaseDAO.ExecutarComando(pSQL: String): Integer;
begin
  Result := 0;
  try
    DM.PizzariaConnection.StartTransaction;
    _FQry.SQL.Text := pSQL;
    _FQry.ExecSQL;
    Result := _FQry.RowsAffected;
    DM.PizzariaConnection.Commit;
  except
    DM.PizzariaConnection.Rollback;
  end;
end;

function TBaseDAO.RetornaDataSet(pSQL: String): TFDQuery;
begin
  _FQry.SQL.Text := pSQL;
  _FQry.Active   := True;
  Result         := _FQry;
end;

end.
