object frmWordCalculator: TfrmWordCalculator
  Left = 0
  Top = 0
  Caption = 'Word Occurence Calculator'
  ClientHeight = 785
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 22
  object lbledtResourcePath: TLabeledEdit
    Left = 13
    Top = 216
    Width = 588
    Height = 64
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    AutoSize = False
    EditLabel.Width = 67
    EditLabel.Height = 22
    EditLabel.Margins.Left = 5
    EditLabel.Margins.Top = 5
    EditLabel.Margins.Right = 5
    EditLabel.Margins.Bottom = 5
    EditLabel.Caption = 'File path'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -18
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnOpenResource: TButton
    Left = 611
    Top = 214
    Width = 132
    Height = 67
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = '...'
    TabOrder = 1
    OnClick = btnOpenResourceClick
  end
  object memResourceContent: TMemo
    Left = 13
    Top = 300
    Width = 730
    Height = 264
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Lines.Strings = (
      'memFileContent')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object btnWordCalculator: TButton
    Left = 13
    Top = 574
    Width = 730
    Height = 77
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Exec Calculation'
    TabOrder = 3
    OnClick = btnWordCalculatorClick
  end
  object edtResult: TEdit
    Left = 13
    Top = 661
    Width = 730
    Height = 103
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -75
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '0'
  end
  object rgSources: TRadioGroup
    Left = 13
    Top = 13
    Width = 728
    Height = 76
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = ' Source '
    ItemIndex = 0
    Items.Strings = (
      'File'
      'Table')
    TabOrder = 5
    WordWrap = True
  end
  object lbledtWordToSearch: TLabeledEdit
    Left = 13
    Top = 120
    Width = 728
    Height = 65
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    AutoSize = False
    EditLabel.Width = 120
    EditLabel.Height = 22
    EditLabel.Margins.Left = 5
    EditLabel.Margins.Top = 5
    EditLabel.Margins.Right = 5
    EditLabel.Margins.Bottom = 5
    EditLabel.Caption = 'Word to search'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -18
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object OpenDialog: TOpenDialog
    Left = 432
    Top = 168
  end
end
