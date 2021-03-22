object FrmClientes: TFrmClientes
  Left = 0
  Top = 0
  Caption = 'Cadastrar clientes'
  ClientHeight = 429
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dsCliente: TDataSource
    DataSet = DM.ClienteTable
    Left = 448
    Top = 8
  end
end
