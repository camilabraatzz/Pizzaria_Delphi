unit uSabor;

interface

uses
  System.SysUtils, uException;

type
  TSabor = class
  private
    FCodigo : Integer;
    FSabor : String;
    FIngredientes : String;
    procedure SetIngredientes(const Value: String);
    procedure SetSabor(const Value: String);
    procedure SetCodigo(const Value: Integer);
  public
    constructor Create;
    property Codigo : Integer read FCodigo write SetCodigo;
    property Sabor : String read FSabor write SetSabor;
    property Ingredientes : String read FIngredientes write SetIngredientes;
  end;

implementation

{ TSabor }

constructor TSabor.Create;
begin
  FSabor        := '';
  FIngredientes := '';
end;

procedure TSabor.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TSabor.SetIngredientes(const Value: String);
begin
  if Value = EmptyStr then
    raise EIngredientesObrigatorios.Create;
  FIngredientes := Value;
end;

procedure TSabor.SetSabor(const Value: String);
begin
  if Value = EmptyStr then
    raise ESaborObrigatorio.Create;
  FSabor := Value;
end;

end.
