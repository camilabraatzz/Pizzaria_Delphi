object FrmListaClientes: TFrmListaClientes
  Left = 0
  Top = 0
  Caption = 'Lista de Clientes'
  ClientHeight = 448
  ClientWidth = 541
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
    Width = 541
    Height = 41
    Align = alTop
    Caption = 'Lista de clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -102
    ExplicitWidth = 549
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 541
    Height = 48
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -102
    ExplicitWidth = 549
    object edtBuscarCliente: TLabeledEdit
      Left = 96
      Top = 14
      Width = 321
      Height = 21
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = 'Busca por c'#243'digo'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object btnBuscarCliente: TButton
      Left = 426
      Top = 1
      Width = 114
      Height = 46
      Align = alRight
      Caption = 'Buscar'
      TabOrder = 1
      ExplicitLeft = 434
    end
  end
  object ListBox1: TListBox
    Left = 0
    Top = 89
    Width = 541
    Height = 318
    Align = alClient
    ItemHeight = 13
    TabOrder = 2
    ExplicitLeft = 1
    ExplicitTop = 84
    ExplicitHeight = 304
  end
  object Panel3: TPanel
    Left = 0
    Top = 407
    Width = 541
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitLeft = -102
    ExplicitTop = 160
    ExplicitWidth = 549
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 114
      Height = 39
      Align = alLeft
      Caption = 'Novo'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 115
      Top = 1
      Width = 114
      Height = 39
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 426
      Top = 1
      Width = 114
      Height = 39
      Align = alRight
      Caption = 'Excluir'
      TabOrder = 2
      ExplicitLeft = 434
    end
  end
  object dsCliente: TDataSource
    DataSet = DM.ClienteTable
    Left = 499
    Top = 344
  end
end
