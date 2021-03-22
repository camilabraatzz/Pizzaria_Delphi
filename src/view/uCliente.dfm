object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pizzaria'
  ClientHeight = 451
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBEdit7: TDBEdit
    Left = 552
    Top = -85
    Width = 17
    Height = 21
    DataField = 'SEXO'
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 496
    Height = 451
    ActivePage = ts1
    Align = alClient
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'Cliente'
      ExplicitLeft = 8
      ExplicitTop = 28
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 82
        Height = 13
        Caption = 'C'#243'digo do cliente'
        FocusControl = edtCodigo
      end
      object Label2: TLabel
        Left = 122
        Top = 8
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = edtNome
      end
      object Label3: TLabel
        Left = 8
        Top = 115
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = edtTelefone
      end
      object Label4: TLabel
        Left = 248
        Top = 61
        Width = 19
        Height = 13
        Caption = 'CPF'
        FocusControl = edtCpf
      end
      object Label5: TLabel
        Left = 122
        Top = 115
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = edtEndereco
      end
      object Label6: TLabel
        Left = 8
        Top = 61
        Width = 95
        Height = 13
        Caption = 'Data de nascimento'
        FocusControl = edtDataNascimento
      end
      object Label7: TLabel
        Left = 160
        Top = 59
        Width = 24
        Height = 13
        Caption = 'Sexo'
        FocusControl = edtSexo
      end
      object Label8: TLabel
        Left = 294
        Top = 115
        Width = 69
        Height = 13
        Caption = 'C'#243'digo Cidade'
        FocusControl = edtCodigoCidade
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 398
        Width = 488
        Height = 25
        DataSource = DataSource1
        Align = alBottom
        TabOrder = 0
      end
      object edtCodigo: TDBEdit
        Left = 8
        Top = 27
        Width = 82
        Height = 21
        DataField = 'CODIGO'
        DataSource = DataSource1
        TabOrder = 1
      end
      object edtNome: TDBEdit
        Left = 122
        Top = 27
        Width = 241
        Height = 21
        DataField = 'NOME'
        DataSource = DataSource1
        TabOrder = 2
      end
      object edtTelefone: TDBEdit
        Left = 8
        Top = 134
        Width = 82
        Height = 21
        DataField = 'TELEFONE'
        DataSource = DataSource1
        TabOrder = 3
      end
      object edtCpf: TDBEdit
        Left = 248
        Top = 80
        Width = 115
        Height = 21
        DataField = 'CPF'
        DataSource = DataSource1
        TabOrder = 4
      end
      object edtEndereco: TDBEdit
        Left = 122
        Top = 134
        Width = 145
        Height = 21
        DataField = 'ENDERECO'
        DataSource = DataSource1
        TabOrder = 5
      end
      object edtDataNascimento: TDBEdit
        Left = 8
        Top = 80
        Width = 127
        Height = 21
        DataField = 'DATA_NASCIMENTO'
        DataSource = DataSource1
        TabOrder = 6
      end
      object edtSexo: TDBEdit
        Left = 160
        Top = 78
        Width = 49
        Height = 21
        DataField = 'SEXO'
        DataSource = DataSource1
        TabOrder = 7
      end
      object edtCodigoCidade: TDBEdit
        Left = 294
        Top = 134
        Width = 69
        Height = 21
        DataField = 'CODIGO_CIDADE'
        DataSource = DataSource1
        TabOrder = 8
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 168
        Width = 488
        Height = 230
        Align = alBottom
        DataSource = DataSource1
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object PizzariaConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Pizzaria')
    Connected = True
    LoginPrompt = False
    Left = 428
    Top = 25
  end
  object DataSource1: TDataSource
    DataSet = ClienteTable
    Left = 424
    Top = 136
  end
  object ClienteTable: TFDQuery
    Active = True
    Connection = PizzariaConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 425
    Top = 81
    object ClienteTableCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClienteTableNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object ClienteTableTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      Size = 15
    end
    object ClienteTableCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 15
    end
    object ClienteTableENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 40
    end
    object ClienteTableDATA_NASCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
      Required = True
    end
    object ClienteTableSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ClienteTableCODIGO_CIDADE: TIntegerField
      FieldName = 'CODIGO_CIDADE'
      Origin = 'CODIGO_CIDADE'
      Required = True
    end
  end
end
