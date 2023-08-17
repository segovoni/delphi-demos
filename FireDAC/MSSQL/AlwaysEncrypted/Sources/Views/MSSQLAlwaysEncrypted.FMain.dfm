object frmAlwaysEncryptedMain: TfrmAlwaysEncryptedMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'SQL Server Always Encrypted Main Form'
  ClientHeight = 359
  ClientWidth = 819
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
  object pnlQueryEncryptedData: TRelativePanel
    Left = 281
    Top = 0
    Width = 536
    Height = 359
    ControlCollection = <
      item
        Control = dbgQueryEncryptedData
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = memoSELECT
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = btnOpenQuery
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
      end>
    Align = alLeft
    Alignment = taRightJustify
    TabOrder = 0
    DesignSize = (
      536
      359)
    object dbgQueryEncryptedData: TDBGrid
      Left = 6
      Top = 8
      Width = 523
      Height = 158
      Align = alTop
      DataSource = dsQueryEncryptedData
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object memoSELECT: TMemo
      Left = 6
      Top = 172
      Width = 523
      Height = 114
      Hint = 'SELECT ColumnName FROM dbo.TableName;'
      Anchors = []
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 1
    end
    object btnOpenQuery: TButton
      Left = 6
      Top = 308
      Width = 523
      Height = 39
      Anchors = []
      Caption = 'Open query'
      TabOrder = 2
      OnClick = btnOpenQueryClick
    end
  end
  object pnlConnection: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 359
    Align = alLeft
    Alignment = taRightJustify
    TabOrder = 1
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
      Top = 78
      Width = 233
      Height = 21
      EditLabel.Width = 58
      EditLabel.Height = 13
      EditLabel.Caption = 'Data source'
      TabOrder = 1
    end
    object lbledtServerName: TLabeledEdit
      Left = 8
      Top = 125
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
    object lbledtDatabaseName: TLabeledEdit
      Left = 8
      Top = 172
      Width = 233
      Height = 21
      EditLabel.Width = 75
      EditLabel.Height = 13
      EditLabel.Caption = 'Database name'
      TabOrder = 3
    end
    object lbledtUserName: TLabeledEdit
      Left = 8
      Top = 218
      Width = 233
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'User name'
      TabOrder = 4
    end
    object lbledtPassword: TLabeledEdit
      Left = 8
      Top = 265
      Width = 233
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Password'
      TabOrder = 5
    end
    object btnConnect: TButton
      Left = 8
      Top = 308
      Width = 233
      Height = 39
      Caption = 'Connect'
      TabOrder = 6
      TabStop = False
      OnClick = btnConnectClick
    end
  end
  object dsQueryEncryptedData: TDataSource
    AutoEdit = False
    Left = 504
    Top = 88
  end
end
