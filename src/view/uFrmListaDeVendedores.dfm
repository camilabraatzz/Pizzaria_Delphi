object FrmListaDeVendedores: TFrmListaDeVendedores
  Left = 0
  Top = 0
  Caption = 'FrmListaDeVendedores'
  ClientHeight = 435
  ClientWidth = 488
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
    Width = 488
    Height = 41
    Align = alTop
    Caption = 'Lista de vendedores'
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
    Width = 488
    Height = 48
    Align = alTop
    TabOrder = 1
    object edtBuscarVendedor: TLabeledEdit
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
    object btnBuscarVendedor: TButton
      Left = 373
      Top = 1
      Width = 114
      Height = 46
      Align = alRight
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnBuscarVendedorClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 394
    Width = 488
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnNovoVendedor: TButton
      Left = 1
      Top = 1
      Width = 114
      Height = 39
      Align = alLeft
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoVendedorClick
    end
    object btnEditarVendedor: TButton
      Left = 115
      Top = 1
      Width = 114
      Height = 39
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarVendedorClick
    end
    object btnExcluirVendedor: TButton
      Left = 373
      Top = 1
      Width = 114
      Height = 39
      Align = alRight
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirVendedorClick
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 89
    Width = 488
    Height = 305
    Align = alClient
    BiDiMode = bdLeftToRight
    Color = clWhite
    Columns = <
      item
        Caption = 'C'#243'digo'
      end
      item
        Caption = 'Nome'
        Width = 150
      end
      item
        Caption = 'Telefone'
        Width = 100
      end
      item
        Caption = 'CPF'
        Width = 100
      end
      item
        Caption = 'Endere'#231'o'
        Width = 200
      end
      item
        Caption = 'Data de nascimento'
        Width = 120
      end
      item
        Caption = 'Sexo'
      end>
    DoubleBuffered = False
    GridLines = True
    ParentBiDiMode = False
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    ViewStyle = vsReport
    ExplicitTop = 94
  end
end
