object FrmPedidoEditar: TFrmPedidoEditar
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Editar Pedido'
  ClientHeight = 229
  ClientWidth = 398
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
    Width = 398
    Height = 229
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 408
    ExplicitHeight = 218
    object DataHoraPedido: TDateTimePicker
      Left = 24
      Top = 32
      Width = 145
      Height = 21
      Date = 44276.000000000000000000
      Time = 0.829508692128001700
      TabOrder = 0
    end
    object edtCodigoCliente: TEdit
      Left = 24
      Top = 85
      Width = 145
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object edtCodigoSabor: TEdit
      Left = 24
      Top = 136
      Width = 145
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
    object edtCodigoVendedor: TEdit
      Left = 232
      Top = 32
      Width = 145
      Height = 21
      NumbersOnly = True
      TabOrder = 3
    end
    object edtTamanho: TEdit
      Left = 232
      Top = 85
      Width = 145
      Height = 21
      NumbersOnly = True
      TabOrder = 4
    end
    object edtValor: TEdit
      Left = 232
      Top = 136
      Width = 145
      Height = 21
      NumbersOnly = True
      TabOrder = 5
    end
    object btnSalvar: TButton
      Left = 280
      Top = 188
      Width = 118
      Height = 41
      Caption = 'Salvar'
      TabOrder = 6
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 0
      Top = 188
      Width = 118
      Height = 41
      Caption = 'Excluir'
      TabOrder = 7
      OnClick = btnExcluirClick
    end
  end
end
