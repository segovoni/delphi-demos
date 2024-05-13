object frmAlwaysEncryptedMainSimplified: TfrmAlwaysEncryptedMainSimplified
  Left = 0
  Top = 8
  Caption = 'SQL Server Always Encrypted Main Form'
  ClientHeight = 860
  ClientWidth = 1002
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 21
  object cpgAlwaysEncrypted: TCategoryPanelGroup
    Left = 0
    Top = 0
    Width = 1002
    Height = 819
    VertScrollBar.Tracking = True
    Align = alClient
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -18
    HeaderFont.Name = 'Segoe UI'
    HeaderFont.Style = []
    TabOrder = 0
    StyleName = 'Windows'
    ExplicitHeight = 975
    object CategoryPanel1: TCategoryPanel
      Top = 517
      Height = 288
      Caption = 'CategoryPanel1'
      TabOrder = 0
      object btnUpdate: TButton
        Left = 762
        Top = 203
        Width = 200
        Height = 30
        Caption = 'Update'
        TabOrder = 0
        OnClick = btnUpdateClick
      end
      object lbledtFirstName: TLabeledEdit
        Left = 12
        Top = 48
        Width = 440
        Height = 29
        EditLabel.Width = 73
        EditLabel.Height = 21
        EditLabel.Caption = 'First name'
        TabOrder = 1
        Text = ''
      end
      object lbledtLastName: TLabeledEdit
        Left = 492
        Top = 50
        Width = 440
        Height = 29
        EditLabel.Width = 71
        EditLabel.Height = 21
        EditLabel.Caption = 'Last name'
        TabOrder = 2
        Text = ''
      end
      object lbledtSocialSecurityNumber: TDBLabeledEdit
        Left = 12
        Top = 112
        Width = 262
        Height = 29
        TabOrder = 3
        EditLabel.Width = 158
        EditLabel.Height = 21
        EditLabel.Caption = 'Social security number'
      end
      object lbledtCreditCardNumber: TLabeledEdit
        Left = 345
        Top = 112
        Width = 262
        Height = 29
        EditLabel.Width = 135
        EditLabel.Height = 21
        EditLabel.Caption = 'Credit card number'
        TabOrder = 4
        Text = ''
      end
      object lbledtSalary: TLabeledEdit
        Left = 670
        Top = 112
        Width = 262
        Height = 29
        EditLabel.Width = 43
        EditLabel.Height = 21
        EditLabel.Caption = 'Salary'
        TabOrder = 5
        Text = ''
      end
    end
    object cpQueryEncryptedData: TCategoryPanel
      Top = 229
      Height = 288
      Caption = 'Query encrypted data'
      TabOrder = 1
      object pnlQueryEncryptedDataButtons: TPanel
        Left = 0
        Top = 210
        Width = 996
        Height = 52
        Align = alBottom
        TabOrder = 0
        ExplicitTop = 294
        ExplicitWidth = 990
        object btnOpenQuery: TButton
          Left = 762
          Top = 11
          Width = 200
          Height = 30
          Caption = 'Open query'
          TabOrder = 0
          OnClick = btnOpenQueryClick
        end
      end
      object dbgQueryEncryptedData: TDBGrid
        Left = 0
        Top = 0
        Width = 996
        Height = 156
        Align = alClient
        DataSource = dsQueryEncryptedData
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object memoSELECT: TMemo
        Left = 0
        Top = 156
        Width = 996
        Height = 54
        Align = alBottom
        Lines.Strings = (
          
            'SELECT ID, LastName, SocialSecurityNumber, CreditCardNumber, Sal' +
            'ary FROM dbo.Persons;')
        TabOrder = 2
        ExplicitTop = 127
        ExplicitWidth = 970
      end
    end
    object cpConnection: TCategoryPanel
      Top = 0
      Height = 229
      Caption = 'Connection FireDAC'
      TabOrder = 2
      ExplicitWidth = 992
      object lbledtDriverID: TLabeledEdit
        Left = 12
        Top = 48
        Width = 220
        Height = 29
        EditLabel.Width = 62
        EditLabel.Height = 21
        EditLabel.Caption = 'Driver ID'
        TabOrder = 0
        Text = ''
      end
      object lbledtServerName: TLabeledEdit
        Left = 264
        Top = 48
        Width = 220
        Height = 29
        EditLabel.Width = 88
        EditLabel.Height = 21
        EditLabel.Caption = 'Server name'
        TabOrder = 1
        Text = ''
      end
      object lbledtDatabaseName: TLabeledEdit
        Left = 516
        Top = 48
        Width = 220
        Height = 29
        EditLabel.Width = 107
        EditLabel.Height = 21
        EditLabel.Caption = 'Database name'
        TabOrder = 2
        Text = ''
      end
      object lbledtUserName: TLabeledEdit
        Left = 12
        Top = 106
        Width = 220
        Height = 29
        EditLabel.Width = 75
        EditLabel.Height = 21
        EditLabel.Caption = 'User name'
        TabOrder = 3
        Text = ''
      end
      object lbledtPassword: TLabeledEdit
        Left = 264
        Top = 106
        Width = 220
        Height = 29
        EditLabel.Width = 66
        EditLabel.Height = 21
        EditLabel.Caption = 'Password'
        PasswordChar = '*'
        TabOrder = 4
        Text = ''
      end
      object chkTrustServerCertificate: TCheckBox
        Left = 516
        Top = 105
        Width = 220
        Height = 32
        Caption = 'Trust server certificate'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object chkColumnEncryption: TCheckBox
        Left = 742
        Top = 105
        Width = 220
        Height = 32
        Caption = 'Column encryption'
        TabOrder = 6
      end
      object btnConnect: TButton
        Left = 762
        Top = 168
        Width = 200
        Height = 30
        Caption = 'Connect'
        TabOrder = 7
        OnClick = btnConnectClick
      end
    end
  end
  object pnlC: TPanel
    Left = 0
    Top = 819
    Width = 1002
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 815
    ExplicitWidth = 996
  end
  object dsQueryEncryptedData: TDataSource
    OnDataChange = dsQueryEncryptedDataDataChange
    Left = 852
    Top = 301
  end
end
