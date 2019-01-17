object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Generics: TList vs TList<T>'
  ClientHeight = 366
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object btnListOfPointers: TButton
    Left = 8
    Top = 24
    Width = 273
    Height = 89
    Caption = 'List of Pointers'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnListOfPointersClick
  end
  object MemoOutput: TMemo
    Left = 312
    Top = 24
    Width = 455
    Height = 334
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'MemoOutput')
    ParentFont = False
    TabOrder = 2
  end
  object btnListOfT: TButton
    Left = 8
    Top = 128
    Width = 273
    Height = 89
    Caption = 'List<T>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnListOfTClick
  end
end
