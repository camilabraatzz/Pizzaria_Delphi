unit uFrmSaborInserir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uSabor,
  uSaborDAO;

type
  TFrmSaborInserir = class(TForm)
    Panel1: TPanel;
    btnSalvar: TButton;
    edtSabor: TLabeledEdit;
    edtIngredientes: TLabeledEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    _Sabor : TSabor;
    _SaborDAO : TSaborDAO;
    procedure PreencherSabor;
  public
    { Public declarations }
  end;

var
  FrmSaborInserir: TFrmSaborInserir;

implementation

{$R *.dfm}

{ TFrmSaborInserir }

procedure TFrmSaborInserir.btnSalvarClick(Sender: TObject);
begin
  PreencherSabor;
  if _SaborDAO.Inserir(_Sabor) then
  begin
    ShowMessage('Sabor cadastrado com sucesso!');
    Close;
  end;
end;

procedure TFrmSaborInserir.FormCreate(Sender: TObject);
begin
  _Sabor    := TSabor.Create;
  _SaborDAO := TSaborDAO.Create;
end;

procedure TFrmSaborInserir.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(_Sabor) then
      FreeAndNil(_Sabor);
    if Assigned(_SaborDAO) then
      FreeAndNil(_SaborDAO);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmSaborInserir.PreencherSabor;
begin
  _Sabor.Sabor        := edtSabor.Text;
  _Sabor.Ingredientes := edtIngredientes.Text;
end;

end.
