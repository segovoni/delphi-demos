object frmNameValueGenerics: TfrmNameValueGenerics
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Generics: TNameValue<T>'
  ClientHeight = 248
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object btnNameValueInteger: TButton
    Left = 16
    Top = 16
    Width = 305
    Height = 97
    Caption = 'NameValue<Integer>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnNameValueIntegerClick
  end
  object btnNameValueEdit: TButton
    Left = 16
    Top = 128
    Width = 305
    Height = 97
    Caption = 'NameValue<TEdit>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnNameValueEditClick
  end
end
