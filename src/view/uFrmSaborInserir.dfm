object FrmSaborInserir: TFrmSaborInserir
  Left = 0
  Top = 0
  Caption = 'Cadastrar sabor'
  ClientHeight = 163
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 163
    Align = alClient
    TabOrder = 0
    object btnSalvar: TButton
      Left = 1
      Top = 123
      Width = 403
      Height = 39
      Align = alBottom
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
      ExplicitLeft = 2
      ExplicitTop = 124
    end
    object edtSabor: TLabeledEdit
      Left = 24
      Top = 32
      Width = 137
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Sabor'
      TabOrder = 1
    end
    object edtIngredientes: TLabeledEdit
      Left = 24
      Top = 81
      Width = 361
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'Ingredientes'
      TabOrder = 2
    end
  end
end
