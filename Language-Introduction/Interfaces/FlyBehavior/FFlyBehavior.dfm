object frmFlyBehavior: TfrmFlyBehavior
  Left = 0
  Top = 0
  AlphaBlend = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FlyBehavior'
  ClientHeight = 375
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object btnFlyInterface: TButton
    Left = 8
    Top = 8
    Width = 491
    Height = 113
    Caption = 'Fly with Interface'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnFlyInterfaceClick
  end
  object btnFlyClass: TButton
    Left = 8
    Top = 131
    Width = 491
    Height = 113
    Caption = 'Fly with Class'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnFlyClassClick
  end
  object btnNoFly: TButton
    Left = 8
    Top = 250
    Width = 491
    Height = 113
    Caption = 'No Fly'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnNoFlyClick
  end
end
