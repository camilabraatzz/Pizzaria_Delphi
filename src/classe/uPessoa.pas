unit uPessoa;

interface

uses
  System.SysUtils;

type
  TPessoa = class
  private
    FNome: String;
    FEndereco: String;
    FDataNasc: TDate;
    FSexo: String;
    FTelefone: String;
    FCpf: String;
    procedure SetCpf(const Value: String);
    procedure SetDataNasc(const Value: TDate);
    procedure SetEndereco(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetSexo(const Value: String);
    procedure SetTelefone(const Value: String);
  public
    constructor Create;
    property Nome: String read FNome write SetNome;
    property Endereco: String read FEndereco write SetEndereco;
    property DataNasc: TDate read FDataNasc write SetDataNasc;
    property Sexo: String read FSexo write SetSexo;
    property Telefone: String read FTelefone write SetTelefone;
    property Cpf: String read FCpf write SetCpf;
  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
  FNome     := '';
  FEndereco := '';
  FSexo     := '';
  FTelefone := '';
  FCpf      := '';
  FDataNasc := EncodeDate(1900, 1, 1);
end;

procedure TPessoa.SetCpf(const Value: String);
begin
  FCpf := Value;
end;

procedure TPessoa.SetDataNasc(const Value: TDate);
begin
  FDataNasc := Value;
end;

procedure TPessoa.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetSexo(const Value: String);
begin
  FSexo := Value;
end;

procedure TPessoa.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
