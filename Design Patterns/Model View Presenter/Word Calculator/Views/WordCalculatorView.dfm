object frmWordCalculator: TfrmWordCalculator
  Left = 0
  Top = 0
  Caption = 'Word Occurence Calculator'
  ClientHeight = 502
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbledtResourcePath: TLabeledEdit
    Left = 8
    Top = 138
    Width = 377
    Height = 41
    AutoSize = False
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = 'File path'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnOpenResource: TButton
    Left = 391
    Top = 137
    Width = 84
    Height = 43
    Caption = '...'
    TabOrder = 1
    OnClick = btnOpenResourceClick
  end
  object memResourceContent: TMemo
    Left = 8
    Top = 192
    Width = 467
    Height = 169
    Lines.Strings = (
      'memFileContent')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object btnWordCalculator: TButton
    Left = 8
    Top = 367
    Width = 467
    Height = 50
    Caption = 'Exec Calculation'
    TabOrder = 3
    OnClick = btnWordCalculatorClick
  end
  object edtResult: TEdit
    Left = 8
    Top = 423
    Width = 467
    Height = 66
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '0'
  end
  object rgSources: TRadioGroup
    Left = 8
    Top = 8
    Width = 466
    Height = 49
    Caption = ' Source '
    ItemIndex = 0
    Items.Strings = (
      'File'
      'Table')
    TabOrder = 5
    WordWrap = True
  end
  object lbledtWordToSearch: TLabeledEdit
    Left = 8
    Top = 77
    Width = 466
    Height = 41
    AutoSize = False
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'Word to search'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
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
