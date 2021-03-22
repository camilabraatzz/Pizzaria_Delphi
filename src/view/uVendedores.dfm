object FrmVendedores: TFrmVendedores
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Cadastro de vendedores'
  ClientHeight = 321
  ClientWidth = 358
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
    Width = 358
    Height = 321
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 29
      Height = 13
      Caption = 'NOME'
      FocusControl = DBEdit1
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 91
      Width = 356
      Height = 204
      Align = alBottom
      DataSource = dsVendedor
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 295
      Width = 356
      Height = 25
      DataSource = dsVendedor
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 301
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 35
      Width = 329
      Height = 21
      DataField = 'NOME'
      DataSource = dsVendedor
      TabOrder = 2
    end
  end
  object dsVendedor: TDataSource
    DataSet = DM.VendedorTable
    Left = 264
    Top = 104
  end
end
