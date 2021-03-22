object FrmListaDePedidos: TFrmListaDePedidos
  Left = 0
  Top = 0
  Caption = 'FrmListaDePedidos'
  ClientHeight = 419
  ClientWidth = 530
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
    Width = 530
    Height = 41
    Align = alTop
    Caption = 'Lista de pedidos'
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
    Width = 530
    Height = 48
    Align = alTop
    TabOrder = 1
    object edtBuscarPedido: TLabeledEdit
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
    object btnBuscarPedido: TButton
      Left = 415
      Top = 1
      Width = 114
      Height = 46
      Align = alRight
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnBuscarPedidoClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 378
    Width = 530
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnNovoPedido: TButton
      Left = 1
      Top = 1
      Width = 114
      Height = 39
      Align = alLeft
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoPedidoClick
    end
    object btnEditarPedido: TButton
      Left = 115
      Top = 1
      Width = 114
      Height = 39
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarPedidoClick
    end
    object btnExcluirPedido: TButton
      Left = 415
      Top = 1
      Width = 114
      Height = 39
      Align = alRight
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirPedidoClick
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 89
    Width = 530
    Height = 289
    Align = alClient
    BiDiMode = bdLeftToRight
    Color = clWhite
    Columns = <
      item
        Caption = 'C'#243'digo'
      end
      item
        Caption = 'Data e hora'
        Width = 150
      end
      item
        Caption = 'C'#243'digo do cliente'
        Width = 100
      end
      item
      end
      item
        Caption = 'C'#243'digo do sabor'
        Width = 100
      end
      item
        Caption = 'C'#243'digo do vendedor'
        Width = 200
      end
      item
        Caption = 'Tamanho'
        Width = 120
      end
      item
        Caption = 'Valor'
      end>
    DoubleBuffered = False
    GridLines = True
    ParentBiDiMode = False
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    ViewStyle = vsReport
    ExplicitTop = 84
  end
end
