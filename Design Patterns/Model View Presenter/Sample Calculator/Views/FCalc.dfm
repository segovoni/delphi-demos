object FCalculator: TFCalculator
  Left = 0
  Top = 0
  Caption = 'FCalculator'
  ClientHeight = 174
  ClientWidth = 570
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
  object lblOperation: TLabel
    Left = 137
    Top = 24
    Width = 48
    Height = 13
    Caption = 'Operation'
  end
  object lbledtValue1: TLabeledEdit
    Left = 24
    Top = 40
    Width = 89
    Height = 66
    EditLabel.Width = 35
    EditLabel.Height = 13
    EditLabel.Caption = 'Value 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object lbledtValue2: TLabeledEdit
    Left = 312
    Top = 40
    Width = 89
    Height = 66
    EditLabel.Width = 35
    EditLabel.Height = 13
    EditLabel.Caption = 'Value 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnPerformOperation: TButton
    Left = 24
    Top = 120
    Width = 521
    Height = 46
    Caption = 'Perform Operation'
    TabOrder = 2
    OnClick = btnPerformOperationClick
  end
  object lbledtResult: TLabeledEdit
    Left = 424
    Top = 40
    Width = 121
    Height = 66
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Result'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 137
    Top = 40
    Width = 152
    Height = 66
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 4
    Text = '+'
    Items.Strings = (
      '+'
      '-')
  end
end
