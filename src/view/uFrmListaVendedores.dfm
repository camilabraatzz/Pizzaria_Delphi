object FrmListaVendedores: TFrmListaVendedores
  Left = 0
  Top = 0
  Caption = 'Cadastro de vendedores'
  ClientHeight = 447
  ClientWidth = 492
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
    Width = 492
    Height = 447
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 358
    ExplicitHeight = 321
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 490
      Height = 41
      Align = alTop
      Caption = 'Lista de funcion'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 501
    end
    object Panel3: TPanel
      Left = 1
      Top = 42
      Width = 490
      Height = 48
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 41
      ExplicitWidth = 501
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
        Left = 375
        Top = 1
        Width = 114
        Height = 46
        Align = alRight
        Caption = 'Buscar'
        TabOrder = 1
        ExplicitLeft = 241
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 405
      Width = 490
      Height = 41
      Align = alBottom
      TabOrder = 2
      ExplicitLeft = 0
      ExplicitTop = 403
      ExplicitWidth = 501
      object btnNovoVendedor: TButton
        Left = 1
        Top = 1
        Width = 114
        Height = 39
        Align = alLeft
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNovoVendedorClick
        ExplicitLeft = -5
        ExplicitTop = 6
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
        ExplicitTop = 6
      end
      object btnExcluirVendedor: TButton
        Left = 375
        Top = 1
        Width = 114
        Height = 39
        Align = alRight
        Caption = 'Excluir'
        TabOrder = 2
        OnClick = btnExcluirVendedorClick
        ExplicitLeft = 241
      end
    end
    object ListView1: TListView
      Left = 1
      Top = 90
      Width = 490
      Height = 315
      Align = alClient
      BiDiMode = bdLeftToRight
      Color = clWhite
      Columns = <
        item
          Caption = 'C'#243'digo'
        end
        item
          Caption = 'Nome'
          Width = 200
        end>
      DoubleBuffered = False
      GridLines = True
      ParentBiDiMode = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      ViewStyle = vsReport
      ExplicitWidth = 487
    end
  end
end
