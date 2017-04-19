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
  object lblOperazione: TLabel
    Left = 137
    Top = 24
    Width = 55
    Height = 13
    Caption = 'Operazione'
  end
  object lbledtValore1: TLabeledEdit
    Left = 24
    Top = 40
    Width = 89
    Height = 66
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Valore 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object lbledtValore2: TLabeledEdit
    Left = 312
    Top = 40
    Width = 89
    Height = 66
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Valore 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnEsegui: TButton
    Left = 24
    Top = 120
    Width = 521
    Height = 46
    Caption = 'Esegui'
    TabOrder = 2
    OnClick = btnEseguiClick
  end
  object lbledtResult: TLabeledEdit
    Left = 424
    Top = 40
    Width = 121
    Height = 66
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'Risultato'
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
