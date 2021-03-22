unit uFrmVendedorInserir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, uVendedorDAO, uVendedor;

type
  TFrmVendedorInserir = class(TForm)
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
    edtTelefone: TMaskEdit;
    edtCpf: TMaskEdit;
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    _VendedorDAO : TVendedorDAO;
    _Vendedor : TVendedor;
    procedure PreencherVendedor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendedorInserir: TFrmVendedorInserir;

implementation

{$R *.dfm}

{ TFrmVendedorInserir }

procedure TFrmVendedorInserir.btnSalvarClick(Sender: TObject);
begin
  PreencherVendedor;
  if _VendedorDAO.Inserir(_Vendedor) then
  begin
    ShowMessage('O vendedor foi cadastrado com sucesso!');
    Close;
  end;
end;

procedure TFrmVendedorInserir.FormCreate(Sender: TObject);
begin
  _Vendedor    := TVendedor.Create;
  _VendedorDAO := TVendedorDAO.Create;  
end;

procedure TFrmVendedorInserir.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(_Vendedor) then
      FreeAndNil(_Vendedor);
    if Assigned(_VendedorDAO) then
      FreeAndNil(_VendedorDAO);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmVendedorInserir.PreencherVendedor;
begin
  _Vendedor.Nome     := edtNomeVendedor.Text;
  _Vendedor.Telefone := edtTelefone.Text;
  _Vendedor.Cpf      := edtCpf.Text;
  _Vendedor.Endereco := edtEndereco.Text;
  _Vendedor.DataNasc := dtpDataNasc.Date;
  _Vendedor.Sexo     := edtSexo.Text;
end;

end.
