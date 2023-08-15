object frmAlwaysEncryptedMain: TfrmAlwaysEncryptedMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'SQL Server Always Encrypted Main Form'
  ClientHeight = 362
  ClientWidth = 253
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
  object lbledtServerName: TLabeledEdit
    Left = 8
    Top = 128
    Width = 233
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'Server name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object lbledtUserName: TLabeledEdit
    Left = 8
    Top = 224
    Width = 233
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'User name'
    TabOrder = 4
  end
  object lbledtPassword: TLabeledEdit
    Left = 8
    Top = 272
    Width = 233
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Password'
    TabOrder = 5
  end
  object btnConnect: TButton
    Left = 8
    Top = 319
    Width = 233
    Height = 25
    Caption = 'Connect'
    TabOrder = 6
    TabStop = False
    OnClick = btnConnectClick
  end
  object lbledtDatabaseName: TLabeledEdit
    Left = 8
    Top = 176
    Width = 233
    Height = 21
    EditLabel.Width = 75
    EditLabel.Height = 13
    EditLabel.Caption = 'Database name'
    TabOrder = 3
  end
  object lbledtDriverID: TLabeledEdit
    Left = 8
    Top = 32
    Width = 233
    Height = 21
    EditLabel.Width = 43
    EditLabel.Height = 13
    EditLabel.Caption = 'Driver ID'
    TabOrder = 0
    Text = 'ODBC'
  end
  object lbledtDataSource: TLabeledEdit
    Left = 8
    Top = 80
    Width = 233
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Data source'
    TabOrder = 1
  end
end
