unit uFrmClienteEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCliente, uClienteDAO, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmClienteEditar = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnSalvar: TButton;
    edtNomeCliente: TEdit;
    edtEndereco: TEdit;
    edtSexo: TEdit;
    dtpDataNasc: TDateTimePicker;
    btnDeletar: TButton;
    edtTelefone: TMaskEdit;
    edtCpf: TMaskEdit;
    procedure FormDestroy(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    _Cliente : TCliente;
    _ClienteDAO : TClienteDAO;
    procedure PreencherCliente;
    procedure PreencherTela;
    { Private declarations }
  public
    constructor Create(AOwner : TComponent; pCliente : TCliente);
    { Public declarations }
  end;

var
  FrmClienteEditar: TFrmClienteEditar;

implementation

{$R *.dfm}

{ TFrmClienteEditar }

procedure TFrmClienteEditar.btnDeletarClick(Sender: TObject);
begin
  if _ClienteDAO.Deletar(_Cliente) then
  begin
    ShowMessage('Cliente excluído com sucesso');
    Close;
  end;
end;

procedure TFrmClienteEditar.btnSalvarClick(Sender: TObject);
begin
  PreencherCliente;
  if _ClienteDAO.Alterar(_Cliente) then
  begin
    ShowMessage('Cliente alterado com sucesso');
    Close;
  end;
end;

constructor TFrmClienteEditar.Create(AOwner: TComponent; pCliente: TCliente);
begin
  inherited Create(AOwner);
  _ClienteDAO := TClienteDAO.Create;
  try
    if Assigned(pCliente) then
    begin
      _Cliente := pCliente;
      PreencherTela;
    end;
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmClienteEditar.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(_ClienteDAO) then
      FreeAndNil(_ClienteDAO);
  except
    on e: exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmClienteEditar.PreencherCliente;
begin
  _Cliente.Nome     := edtNomeCliente.Text;
  _Cliente.Telefone := edtTelefone.Text;
  _Cliente.Cpf      := edtCpf.Text;
  _Cliente.Endereco := edtEndereco.Text;
  _Cliente.DataNasc := dtpDataNasc.Date;
  _Cliente.Sexo     := edtSexo.Text;
end;

procedure TFrmClienteEditar.PreencherTela;
begin
  edtNomeCliente.Text := _Cliente.Nome;
  edtTelefone.Text    := _Cliente.Telefone;
  edtCpf.Text         := _Cliente.Cpf;
  edtEndereco.Text    := _Cliente.Endereco;
  dtpDataNasc.Date    := _Cliente.DataNasc ;
  edtSexo.Text        := _Cliente.Sexo;
end;

end.
