object frmAdapter: TfrmAdapter
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Display Text Adapter sample program'
  ClientHeight = 408
  ClientWidth = 528
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
  object edtSource: TEdit
    Left = 8
    Top = 8
    Width = 511
    Height = 57
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = edtSourceChange
  end
  object grbTarget: TGroupBox
    Left = 8
    Top = 80
    Width = 511
    Height = 307
    Caption = ' Targets '
    TabOrder = 1
    object lblTarget: TLabel
      Left = 5
      Top = 25
      Width = 503
      Height = 31
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblTarget'
    end
    object lblTargetOne: TLabel
      Left = 3
      Top = 212
      Width = 257
      Height = 45
      AutoSize = False
      Caption = 'lblTargetOne'
    end
    object btnTarget: TButton
      Left = 3
      Top = 128
      Width = 503
      Height = 49
      Caption = 'btnTarget'
      TabOrder = 0
    end
    object edtTarget: TEdit
      Left = 5
      Top = 67
      Width = 503
      Height = 46
      Alignment = taCenter
      AutoSize = False
      TabOrder = 1
      Text = 'edtTarget'
    end
  end
  object chbTarger: TCheckBox
    Left = 13
    Top = 330
    Width = 485
    Height = 35
    Caption = 'chbTarger'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
