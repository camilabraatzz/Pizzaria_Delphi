unit uFrmSaborEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSabor, Vcl.StdCtrls, Vcl.ExtCtrls,
  uSaborDAO;

type
  TFrmSaborEditar = class(TForm)
    Panel1: TPanel;
    edtSabor: TLabeledEdit;
    edtIngredientes: TLabeledEdit;
    btnSalvar: TButton;
    btnExcluir: TButton;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    _Sabor : TSabor;
    _SaborDAO : TSaborDAO;
    procedure PreencherTela;
    procedure PreencherSabor;
    { Private declarations }
  public
    constructor Create(AOwner : TComponent; pSabor : TSabor);
    { Public declarations }
  end;

var
  FrmSaborEditar: TFrmSaborEditar;

implementation

{$R *.dfm}

{ TFrmSaborEditar }

procedure TFrmSaborEditar.btnExcluirClick(Sender: TObject);
begin
  if _SaborDAO.Deletar(_Sabor) then
  begin
    ShowMessage('O sabor foi excluído com sucesso!');
    Close;
  end;
end;

procedure TFrmSaborEditar.btnSalvarClick(Sender: TObject);
begin
  PreencherSabor;
  if _SaborDAO.Alterar(_Sabor) then
  begin
    ShowMessage('O sabor foi alterado com sucesso!');
    Close;
  end;
end;

constructor TFrmSaborEditar.Create(AOwner: TComponent; pSabor: TSabor);
begin
  inherited Create(AOwner);
  _SaborDAO := TSaborDAO.Create;
  try
    if Assigned(pSabor) then
    begin
      _Sabor := pSabor;
      PreencherTela;
    end;
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TFrmSaborEditar.PreencherSabor;
begin
  _Sabor.Sabor        := edtSabor.Text;
  _Sabor.Ingredientes := edtIngredientes.Text;
end;

procedure TFrmSaborEditar.PreencherTela;
begin
  edtSabor.Text        := _Sabor.Sabor;
  edtIngredientes.Text := _Sabor.Ingredientes;
end;

end.
