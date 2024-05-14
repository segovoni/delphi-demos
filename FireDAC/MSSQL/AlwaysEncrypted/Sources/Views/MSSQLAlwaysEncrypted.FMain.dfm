object frmAlwaysEncryptedMain: TfrmAlwaysEncryptedMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'SQL Server Always Encrypted Main Form'
  ClientHeight = 827
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object pnlQueryEncryptedData: TRelativePanel
    Left = 251
    Top = 0
    Width = 525
    Height = 676
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
      end
      item
        Control = DBGrid2
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
    ExplicitHeight = 659
    DesignSize = (
      525
      676)
    object dbgQueryEncryptedData: TDBGrid
      Left = 6
      Top = 8
      Width = 515
      Height = 158
      Align = alTop
      DataSource = dsQueryEncryptedData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
      Width = 515
      Height = 114
      Hint = 'SELECT ColumnName FROM dbo.TableName;'
      Anchors = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'SELECT * FROM dbo.Persons;')
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 1
    end
    object btnOpenQuery: TButton
      Left = 6
      Top = 308
      Width = 515
      Height = 39
      Anchors = []
      Caption = 'Open query'
      TabOrder = 2
      OnClick = btnOpenQueryClick
    end
    object DBGrid2: TDBGrid
      Left = 29
      Top = 528
      Width = 492
      Height = 120
      Anchors = []
      DataSource = DataSourceTEST
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnlConnection: TPanel
    Left = 0
    Top = 0
    Width = 251
    Height = 676
    Align = alLeft
    Alignment = taRightJustify
    TabOrder = 1
    ExplicitHeight = 659
    object lbledtDriverID: TLabeledEdit
      Left = 8
      Top = 32
      Width = 233
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Driver ID'
      TabOrder = 0
      Text = 'MSSQL'
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
      Text = ''
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
      Text = ''
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
      Text = ''
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
      Text = ''
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
      Text = ''
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
  object pnlUpdate: TPanel
    Left = 0
    Top = 676
    Width = 776
    Height = 151
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 659
    ExplicitWidth = 770
    object lbledtUpdateStmt: TLabeledEdit
      Left = 6
      Top = 32
      Width = 67
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = 'UPDATE'
      Enabled = False
      TabOrder = 0
      Text = 'UPDATE'
    end
    object lbledtEncryptedTableName: TLabeledEdit
      Left = 79
      Top = 32
      Width = 210
      Height = 21
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Table name'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = ''
      TextHint = 'mandatory example dbo.Person'
    end
    object lbledtSet: TLabeledEdit
      Left = 295
      Top = 32
      Width = 41
      Height = 21
      EditLabel.Width = 18
      EditLabel.Height = 13
      EditLabel.Caption = 'SET'
      Enabled = False
      TabOrder = 2
      Text = 'SET'
    end
    object lbledtEncryptedColumnName: TLabeledEdit
      Left = 342
      Top = 32
      Width = 174
      Height = 21
      EditLabel.Width = 165
      EditLabel.Height = 13
      EditLabel.Caption = 'Encrypted column name - char(11)'
      TabOrder = 3
      Text = ''
      TextHint = 'mandatory example SSN'
    end
    object lbledtEqualTo: TLabeledEdit
      Left = 522
      Top = 32
      Width = 26
      Height = 21
      EditLabel.Width = 8
      EditLabel.Height = 13
      EditLabel.Caption = '='
      Enabled = False
      TabOrder = 4
      Text = '='
    end
    object lbledtNonEncryptedValue: TLabeledEdit
      Left = 554
      Top = 32
      Width = 218
      Height = 21
      EditLabel.Width = 152
      EditLabel.Height = 13
      EditLabel.Caption = 'Non-encrypted value - char(11)'
      TabOrder = 5
      Text = ''
      TextHint = 'mandatory example 795-73-9838'
    end
    object btnUpdate: TButton
      Left = 6
      Top = 104
      Width = 766
      Height = 39
      Caption = 'Update'
      TabOrder = 10
      OnClick = btnUpdateClick
    end
    object lbledtWhereClause: TLabeledEdit
      Left = 6
      Top = 77
      Width = 67
      Height = 21
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'WHERE'
      Enabled = False
      TabOrder = 6
      Text = 'WHERE'
    end
    object lbledtColumnNameWhere: TLabeledEdit
      Left = 79
      Top = 77
      Width = 210
      Height = 21
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = 'Column name'
      TabOrder = 7
      Text = ''
      TextHint = 'example FirstName'
    end
    object lbledtEqualToWhere: TLabeledEdit
      Left = 295
      Top = 77
      Width = 41
      Height = 21
      EditLabel.Width = 8
      EditLabel.Height = 13
      EditLabel.Caption = '='
      Enabled = False
      TabOrder = 8
      Text = '='
    end
    object lbledtColumnValueWhere: TLabeledEdit
      Left = 342
      Top = 77
      Width = 174
      Height = 21
      EditLabel.Width = 101
      EditLabel.Height = 13
      EditLabel.Caption = 'Non-encrypted value'
      TabOrder = 9
      Text = ''
      TextHint = 'example Jane'
    end
  end
  object DBGrid1: TDBGrid
    Left = 280
    Top = 384
    Width = 496
    Height = 120
    DataSource = dsQueryEncryptedDataTEST
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dsQueryEncryptedData: TDataSource
    AutoEdit = False
    Left = 376
    Top = 32
  end
  object dsQueryEncryptedDataTEST: TDataSource
    DataSet = FDQueryTEST
    Left = 504
    Top = 424
  end
  object FDQueryTEST: TFDQuery
    Active = True
    ConstraintsEnabled = True
    Connection = FDConnectionTEST
    SQL.Strings = (
      'SELECT'
      '  LastName'
      '  ,SocialSecurityNumber'
      'FROM'
      '  dbo.Persons')
    Left = 376
    Top = 432
  end
  object FDConnectionTEST: TFDConnection
    Params.Strings = (
      'Encrypt=Yes'
      'Database=AlwaysEncryptedDB'
      'User_Name=Delphi_User'
      'Password=DelphiDay2024!'
      'Server=decision-making'
      'ODBCAdvanced=TrustServerCertificate=yes;ColumnEncryption=Enabled'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 624
    Top = 400
  end
  object ADOConnectionTEST: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI10.1;Persist Security Info=False;User ID=Delphi_' +
      'User;Initial Catalog=AlwaysEncryptedDB;Data Source=decision-maki' +
      'ng;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4' +
      '096;Workstation ID=decision-making;Initial File Name="";Use Encr' +
      'yption for Data=True;Tag with column collation when possible=Fal' +
      'se;MARS Connection=False;DataTypeCompatibility=0;Trust Server Ce' +
      'rtificate=True;Server SPN=""'
    Provider = 'SQLNCLI10.1'
    Left = 368
    Top = 576
  end
  object ADOQueryTEST: TADOQuery
    Active = True
    Connection = ADOConnectionTEST
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  LastName'
      '  ,SocialSecurityNumber'
      'FROM'
      '  dbo.Persons')
    Left = 496
    Top = 592
  end
  object DataSourceTEST: TDataSource
    DataSet = ADOQueryTEST
    Left = 632
    Top = 552
  end
end
