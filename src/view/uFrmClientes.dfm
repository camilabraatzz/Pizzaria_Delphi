object FrmClientes: TFrmClientes
  Left = 0
  Top = 0
  Caption = 'Cadastrar clientes'
  ClientHeight = 461
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 282
    Width = 549
    Height = 179
    Align = alBottom
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 282
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -100
    ExplicitTop = -82
    ExplicitWidth = 547
    ExplicitHeight = 283
    object Label2: TLabel
      Left = 16
      Top = 52
      Width = 29
      Height = 13
      Caption = 'NOME'
      FocusControl = edtNomeCliente
    end
    object Label3: TLabel
      Left = 152
      Top = 96
      Width = 50
      Height = 13
      Caption = 'TELEFONE'
      FocusControl = edtTelefone
    end
    object Label4: TLabel
      Left = 16
      Top = 139
      Width = 19
      Height = 13
      Caption = 'CPF'
      FocusControl = edtCpf
    end
    object Label5: TLabel
      Left = 16
      Top = 187
      Width = 54
      Height = 13
      Caption = 'ENDERECO'
      FocusControl = edtEndereco
    end
    object Label6: TLabel
      Left = 16
      Top = 97
      Width = 99
      Height = 13
      Caption = 'DATA_NASCIMENTO'
      FocusControl = edtDataNasc
    end
    object Label7: TLabel
      Left = 264
      Top = 187
      Width = 26
      Height = 13
      Caption = 'SEXO'
      FocusControl = edtSexo
    end
    object Label8: TLabel
      Left = 362
      Top = 6
      Width = 115
      Height = 13
      Caption = 'Filtrar cliente por c'#243'digo'
    end
    object edtNomeCliente: TDBEdit
      Left = 16
      Top = 68
      Width = 289
      Height = 21
      DataField = 'NOME'
      TabOrder = 0
    end
    object edtTelefone: TDBEdit
      Left = 152
      Top = 112
      Width = 153
      Height = 21
      DataField = 'TELEFONE'
      TabOrder = 1
    end
    object edtCpf: TDBEdit
      Left = 16
      Top = 155
      Width = 289
      Height = 21
      DataField = 'CPF'
      TabOrder = 2
    end
    object edtEndereco: TDBEdit
      Left = 16
      Top = 206
      Width = 225
      Height = 21
      DataField = 'ENDERECO'
      TabOrder = 3
    end
    object edtDataNasc: TDBEdit
      Left = 16
      Top = 112
      Width = 121
      Height = 21
      DataField = 'DATA_NASCIMENTO'
      TabOrder = 4
    end
    object edtSexo: TDBEdit
      Left = 264
      Top = 206
      Width = 41
      Height = 21
      DataField = 'SEXO'
      TabOrder = 5
    end
    object edtFiltroCodigo: TEdit
      Left = 362
      Top = 25
      Width = 130
      Height = 21
      TabOrder = 6
    end
    object btnFiltroCodigo: TButton
      Left = 362
      Top = 81
      Width = 95
      Height = 21
      Caption = 'Filtrar'
      TabOrder = 7
    end
    object Button1: TButton
      Left = 16
      Top = 7
      Width = 289
      Height = 39
      Caption = 'Carregar dados'
      TabOrder = 8
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 242
      Width = 547
      Height = 39
      Align = alBottom
      TabOrder = 9
      ExplicitTop = 232
      ExplicitWidth = 503
    end
  end
end
