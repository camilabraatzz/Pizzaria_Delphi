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
  Self.Message := 'O campo Nome é obrigatório!';
end;

{ ETelefoneObrigatorio }

constructor ETelefoneObrigatorio.Create;
begin
  Self.Message :=  'O campo Telefone é obrigatório!';
end;

{ ESexoObrigatorio }

constructor ESexoObrigatorio.Create;
begin
  Self.Message :=  'O campo Sexo é obrigatório!';
end;

{ EDataNascObrigatorio }

constructor EDataNascObrigatorio.Create;
begin
  Self.Message :=  'O campo Data de nascimento é obrigatório!';
end;

{ EEnderecoObrigatorio }

constructor EEnderecoObrigatorio.Create;
begin
  Self.Message :=  'O campo Endereço é obrigatório!';
end;

{ ECpfObrigatorio }

constructor ECpfObrigatorio.Create;
begin
  Self.Message :=  'O campo CPF é obrigatório!';
end;

{ ECampoEmBranco }

constructor ECampoEmBranco.Create;
begin
  Self.Message := 'O campo Pesquisa está em branco!';
end;

{ ETamanhoObrigatorio }

constructor ETamanhoObrigatorio.Create;
begin
  Self.Message :=  'O campo Tamanho é obrigatório!';
end;

{ ECodigoSaborObrigatorio }

constructor ECodigoSaborObrigatorio.Create;
begin
  Self.Message :=  'O campo Código Sabor é obrigatório!';
end;

{ EValorObrigatorio }

constructor EValorObrigatorio.Create;
begin
  Self.Message :=  'O campo Valor é obrigatório!';
end;

{ ECodigoVendedorObrigatorio }

constructor ECodigoVendedorObrigatorio.Create;
begin
  Self.Message :=  'O campo Código Vendedor é obrigatório!';
end;

{ ECodigoClienteObrigatorio }

constructor ECodigoClienteObrigatorio.Create;
begin
  Self.Message :=  'O campo Código Cliente é obrigatório!';
end;

{ ESaborObrigatorio }

constructor ESaborObrigatorio.Create;
begin
  Self.Message :=  'O campo Sabor é obrigatório!';
end;

{ EIngredientesObrigatorios }

constructor EIngredientesObrigatorios.Create;
begin
  Self.Message :=  'O campo Ingredientes é obrigatório!';
end;

end.
