unit uFrmClientesInserir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, uDataModule, uCliente,
  System.ImageList, Vcl.ImgList, Vcl.WinXCtrls, Vcl.ComCtrls, uClienteDAO;

type
  TFrmClientesInserir = class(TForm)
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
    edtTelefone: TMaskEdit;
    edtCpf: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    _ClienteDAO : TClienteDAO;
    _Cliente : TCliente;
    procedure PreencherCliente;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClientesInserir: TFrmClientesInserir;

implementation

uses
  uException;

{$R *.dfm}

procedure TFrmClientesInserir.btnSalvarClick(Sender: TObject);
begin
  PreencherCliente;
  if _ClienteDAO.Inserir(_Cliente) then
  begin
    ShowMessage('Cliente cadastrado com sucesso!');
    Close;
  end;
end;

procedure TFrmClientesInserir.FormCreate(Sender: TObject);
begin
  _Cliente     := TCliente.Create;
  _ClienteDAO  := TClienteDAO.Create;
end;

procedure TFrmClientesInserir.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(_Cliente) then
      FreeAndNil(_Cliente);
    if Assigned(_ClienteDAO) then
      FreeAndNil(_ClienteDAO);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmClientesInserir.PreencherCliente;
begin
  _Cliente.Nome     := edtNomeCliente.Text;
  _Cliente.Telefone := edtTelefone.Text;
  _Cliente.Cpf      := edtCpf.Text;
  _Cliente.Endereco := edtEndereco.Text;
  _Cliente.DataNasc := dtpDataNasc.Date;
  _Cliente.Sexo     := edtSexo.Text;
end;

end.
