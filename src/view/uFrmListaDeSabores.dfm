object FrmListaSabores: TFrmListaSabores
  Left = 0
  Top = 0
  Caption = 'Lista de sabores'
  ClientHeight = 422
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 41
    Align = alTop
    Caption = 'Lista de sabores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 490
    Height = 48
    Align = alTop
    TabOrder = 1
    object edtBuscarSabor: TLabeledEdit
      Left = 96
      Top = 14
      Width = 265
      Height = 21
      EditLabel.Width = 76
      EditLabel.Height = 13
      EditLabel.Caption = 'Busca por nome'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object btnBuscarSabor: TButton
      Left = 375
      Top = 1
      Width = 114
      Height = 46
      Align = alRight
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnBuscarSaborClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 381
    Width = 490
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnNovoSabor: TButton
      Left = 1
      Top = 1
      Width = 114
      Height = 39
      Align = alLeft
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoSaborClick
    end
    object btnEditarSabor: TButton
      Left = 115
      Top = 1
      Width = 114
      Height = 39
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarSaborClick
    end
    object btnExcluirSabor: TButton
      Left = 375
      Top = 1
      Width = 114
      Height = 39
      Align = alRight
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirSaborClick
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 89
    Width = 490
    Height = 292
    Align = alClient
    BiDiMode = bdLeftToRight
    Color = clWhite
    Columns = <
      item
        Caption = 'C'#243'digo'
      end
      item
        Caption = 'Sabor'
        Width = 100
      end
      item
        Caption = 'Ingredientes'
        Width = 250
      end>
    DoubleBuffered = False
    GridLines = True
    ParentBiDiMode = False
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    ViewStyle = vsReport
  end
end
