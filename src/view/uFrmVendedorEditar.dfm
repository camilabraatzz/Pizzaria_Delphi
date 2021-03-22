object FrmVendedorEditar: TFrmVendedorEditar
  Left = 0
  Top = 0
  Caption = 'Editar vendedor'
  ClientHeight = 248
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 362
    Height = 248
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 12
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label4: TLabel
      Left = 184
      Top = 56
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label5: TLabel
      Left = 17
      Top = 99
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label6: TLabel
      Left = 16
      Top = 151
      Width = 95
      Height = 13
      Caption = 'Data de nascimento'
    end
    object Label7: TLabel
      Left = 264
      Top = 151
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object btnSalvar: TButton
      Left = 224
      Top = 209
      Width = 138
      Height = 39
      Align = alCustom
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object edtNomeVendedor: TEdit
      Left = 16
      Top = 31
      Width = 313
      Height = 21
      TabOrder = 1
    end
    object edtEndereco: TEdit
      Left = 17
      Top = 118
      Width = 312
      Height = 21
      TabOrder = 2
    end
    object edtSexo: TEdit
      Left = 264
      Top = 170
      Width = 65
      Height = 21
      TabOrder = 3
    end
    object dtpDataNasc: TDateTimePicker
      Left = 16
      Top = 170
      Width = 216
      Height = 21
      Date = 44274.000000000000000000
      Time = 0.453814166663505600
      TabOrder = 4
    end
    object btnDeletar: TButton
      Left = 0
      Top = 209
      Width = 138
      Height = 39
      Align = alCustom
      Caption = 'Deletar'
      TabOrder = 5
      OnClick = btnDeletarClick
    end
    object edtTelefone: TMaskEdit
      Left = 17
      Top = 75
      Width = 107
      Height = 21
      EditMask = '!\(00\)90000-0000;1;_'
      MaxLength = 14
      TabOrder = 6
      Text = '(  )     -    '
    end
    object edtCpf: TMaskEdit
      Left = 184
      Top = 75
      Width = 116
      Height = 21
      EditMask = '000\.000\.000\-00;1;_'
      MaxLength = 14
      TabOrder = 7
      Text = '   .   .   -  '
    end
  end
end
