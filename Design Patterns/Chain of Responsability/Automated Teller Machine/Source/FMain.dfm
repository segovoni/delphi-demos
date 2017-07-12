object frmATM: TfrmATM
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Automated Teller Machine (ATM)'
  ClientHeight = 158
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnPreleva: TButton
    Left = 8
    Top = 72
    Width = 359
    Height = 65
    Caption = 'Preleva'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnPrelevaClick
  end
  object edtImporto: TLabeledEdit
    Left = 8
    Top = 24
    Width = 359
    Height = 33
    EditLabel.Width = 81
    EditLabel.Height = 13
    EditLabel.Caption = 'Importo richiesto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = 'Digita l'#39'importo da prelevare'
  end
end
