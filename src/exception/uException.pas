unit uException;

interface

uses
  System.SysUtils;

type
  ENomeObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  ETelefoneObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  ECpfObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  EEnderecoObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  EDataNascObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  ESexoObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  ECampoEmBranco = class(Exception)
    constructor Create; reintroduce;
  end;
  ECodigoClienteObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  ECodigoSaborObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  ECodigoVendedorObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  ETamanhoObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  EValorObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  ESaborObrigatorio = class(Exception)
    constructor Create; reintroduce;
  end;
  EIngredientesObrigatorios = class(Exception)
    constructor Create; reintroduce;
  end;


implementation

{ ENomeObrigatorio }

constructor ENomeObrigatorio.Create;
begin
  Self.Message := 'O campo Nome � obrigat�rio!';
end;

{ ETelefoneObrigatorio }

constructor ETelefoneObrigatorio.Create;
begin
  Self.Message :=  'O campo Telefone � obrigat�rio!';
end;

{ ESexoObrigatorio }

constructor ESexoObrigatorio.Create;
begin
  Self.Message :=  'O campo Sexo � obrigat�rio!';
end;

{ EDataNascObrigatorio }

constructor EDataNascObrigatorio.Create;
begin
  Self.Message :=  'O campo Data de nascimento � obrigat�rio!';
end;

{ EEnderecoObrigatorio }

constructor EEnderecoObrigatorio.Create;
begin
  Self.Message :=  'O campo Endere�o � obrigat�rio!';
end;

{ ECpfObrigatorio }

constructor ECpfObrigatorio.Create;
begin
  Self.Message :=  'O campo CPF � obrigat�rio!';
end;

{ ECampoEmBranco }

constructor ECampoEmBranco.Create;
begin
  Self.Message := 'O campo Pesquisa est� em branco!';
end;

{ ETamanhoObrigatorio }

constructor ETamanhoObrigatorio.Create;
begin
  Self.Message :=  'O campo Tamanho � obrigat�rio!';
end;

{ ECodigoSaborObrigatorio }

constructor ECodigoSaborObrigatorio.Create;
begin
  Self.Message :=  'O campo C�digo Sabor � obrigat�rio!';
end;

{ EValorObrigatorio }

constructor EValorObrigatorio.Create;
begin
  Self.Message :=  'O campo Valor � obrigat�rio!';
end;

{ ECodigoVendedorObrigatorio }

constructor ECodigoVendedorObrigatorio.Create;
begin
  Self.Message :=  'O campo C�digo Vendedor � obrigat�rio!';
end;

{ ECodigoClienteObrigatorio }

constructor ECodigoClienteObrigatorio.Create;
begin
  Self.Message :=  'O campo C�digo Cliente � obrigat�rio!';
end;

{ ESaborObrigatorio }

constructor ESaborObrigatorio.Create;
begin
  Self.Message :=  'O campo Sabor � obrigat�rio!';
end;

{ EIngredientesObrigatorios }

constructor EIngredientesObrigatorios.Create;
begin
  Self.Message :=  'O campo Ingredientes � obrigat�rio!';
end;

end.
