unit uCliente;

interface

uses
  System.SysUtils, uException, System.Classes;
type
  TCliente = class
  private
    FCodigo: Integer;
    FNome: String;
    FEndereco: String;
    FDataNasc: TDate;
    FSexo: String;
    FTelefone: String;
    FCpf: String;
    procedure SetCodigo(const Value: Integer);
    procedure SetCpf(const Value: String);
    procedure SetDataNasc(const Value: TDate);
    procedure SetEndereco(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetSexo(const Value: String);
    procedure SetTelefone(const Value: String);
  public
    constructor Create;
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: String read FNome write SetNome;
    property Endereco: String read FEndereco write SetEndereco;
    property DataNasc: TDate read FDataNasc write SetDataNasc;
    property Sexo: String read FSexo write SetSexo;
    property Telefone: String read FTelefone write SetTelefone;
    property Cpf: String read FCpf write SetCpf;
  end;

implementation

{ TCliente }


constructor TCliente.Create;
begin
  FCodigo   := 0;
  FNome     := '';
  FEndereco := '';
  FSexo     := '';
  FTelefone := '';
  FCpf      := '';
  FDataNasc := EncodeDate(1900, 1, 1);
end;

procedure TCliente.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCliente.SetCpf(const Value: String);
begin
  if Value = EmptyStr then
    raise ECpfObrigatorio.Create;
  FCpf := Value;
end;

procedure TCliente.SetDataNasc(const Value: TDate);
begin
  FDataNasc := Value;
end;

procedure TCliente.SetEndereco(const Value: String);
begin
  if Value = EmptyStr then
    raise EEnderecoObrigatorio.Create;
  FEndereco := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  if Value = EmptyStr then
    raise ENomeObrigatorio.Create;
  FNome := Value;
end;

procedure TCliente.SetSexo(const Value: String);
begin
  if Value = EmptyStr then
    raise ESexoObrigatorio.Create;
  FSexo := Value;
end;

procedure TCliente.SetTelefone(const Value: String);
begin
  if Value = EmptyStr then
    raise ETelefoneObrigatorio.Create;
  FTelefone := Value;
end;

end.
