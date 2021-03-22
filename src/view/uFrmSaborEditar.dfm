object FrmSaborEditar: TFrmSaborEditar
  Left = 0
  Top = 0
  Caption = 'Editar Sabor'
  ClientHeight = 170
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 170
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -14
    ExplicitWidth = 405
    ExplicitHeight = 163
    object edtSabor: TLabeledEdit
      Left = 24
      Top = 32
      Width = 137
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Sabor'
      TabOrder = 0
    end
    object edtIngredientes: TLabeledEdit
      Left = 24
      Top = 81
      Width = 361
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'Ingredientes'
      TabOrder = 1
    end
    object btnSalvar: TButton
      Left = 303
      Top = 131
      Width = 99
      Height = 39
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 0
      Top = 131
      Width = 99
      Height = 39
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
  end
end
