unit uFrmVendedorEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, uVendedorDAO, uVendedor;

type
  TFrmVendedorEditar = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnSalvar: TButton;
    edtNomeVendedor: TEdit;
    edtEndereco: TEdit;
    edtSexo: TEdit;
    dtpDataNasc: TDateTimePicker;
    btnDeletar: TButton;
    edtTelefone: TMaskEdit;
    edtCpf: TMaskEdit;
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    _Vendedor : TVendedor;
    _VendedorDAO : TVendedorDAO;
    procedure PreencherTela;
    procedure PreencherVendedor;
    { Private decl0arations }
  public
    constructor Create(AOwner : TComponent; pVendedor : TVendedor);
    { Public declarations }
  end;

var
  FrmVendedorEditar: TFrmVendedorEditar;

implementation

{$R *.dfm}

{ TFrmVendedorEditar }

procedure TFrmVendedorEditar.btnDeletarClick(Sender: TObject);
begin
  if _VendedorDAO.Deletar(_Vendedor) then
  begin
    ShowMessage('O vendedor foi excluído com sucesso!');
    Close;
  end;
end;

procedure TFrmVendedorEditar.btnSalvarClick(Sender: TObject);
begin
  PreencherVendedor;
  if _VendedorDAO.Alterar(_Vendedor) then
  begin
    ShowMessage('Vendedor alterado com sucesso!');
    Close;
  end;
end;

constructor TFrmVendedorEditar.Create(AOwner: TComponent; pVendedor: TVendedor);
begin
  inherited Create(AOwner);
  _VendedorDAO := TVendedorDAO.Create;
  try
    if Assigned(pVendedor) then
    begin
      _Vendedor := pVendedor;
      PreencherTela;
    end;
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmVendedorEditar.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(_VendedorDAO) then
      FreeAndNil(_VendedorDAO);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmVendedorEditar.PreencherTela;
begin
  edtNomeVendedor.Text := _Vendedor.Nome;
  edtTelefone.Text     := _Vendedor.Telefone;
  edtCpf.Text          := _Vendedor.Cpf;
  edtEndereco.Text     := _Vendedor.Endereco;
  dtpDataNasc.Date     := _Vendedor.DataNasc;
  edtSexo.Text         := _Vendedor.Sexo;
end;

procedure TFrmVendedorEditar.PreencherVendedor;
begin
  _Vendedor.Nome     := edtNomeVendedor.Text;
  _Vendedor.Telefone := edtTelefone.Text;
  _Vendedor.Cpf      := edtCpf.Text;
  _Vendedor.Endereco := edtEndereco.Text;
  _Vendedor.DataNasc := dtpDataNasc.Date;
  _Vendedor.Sexo     := edtSexo.Text;
end;

end.
