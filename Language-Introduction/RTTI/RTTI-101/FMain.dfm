object frmRTTI101: TfrmRTTI101
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RTTI 101'
  ClientHeight = 379
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object btnReadFormProperties: TButton
    Left = 8
    Top = 8
    Width = 297
    Height = 73
    Caption = 'Read TForm Properties'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnReadFormPropertiesClick
  end
  object lstbFormProperties: TListBox
    Left = 311
    Top = 8
    Width = 228
    Height = 363
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 21
    ParentFont = False
    TabOrder = 1
  end
  object btnReadThisProperty: TButton
    Left = 8
    Top = 111
    Width = 297
    Height = 73
    Caption = 'Read Property'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnReadThisPropertyClick
  end
  object lstbPropertyValue: TListBox
    Left = 545
    Top = 8
    Width = 228
    Height = 363
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 21
    ParentFont = False
    TabOrder = 3
  end
end
