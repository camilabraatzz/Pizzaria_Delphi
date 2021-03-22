object FrmSabor: TFrmSabor
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Cadastro de sabores'
  ClientHeight = 373
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 28
    Height = 13
    Caption = 'Sabor'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 61
    Height = 13
    Caption = 'Ingredientes'
    FocusControl = DBEdit2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 103
    Width = 447
    Height = 245
    Align = alBottom
    DataSource = dsSabor
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 348
    Width = 447
    Height = 25
    DataSource = dsSabor
    Align = alBottom
    TabOrder = 1
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 16
    Width = 105
    Height = 21
    DataField = 'SABOR'
    DataSource = dsSabor
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 59
    Width = 417
    Height = 21
    DataField = 'INGREDIENTES'
    DataSource = dsSabor
    TabOrder = 3
  end
  object dsSabor: TDataSource
    DataSet = DM.SaborTable
    Left = 32
    Top = 280
  end
end
