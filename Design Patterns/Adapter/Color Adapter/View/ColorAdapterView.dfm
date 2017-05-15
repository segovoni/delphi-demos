object frmColoring: TfrmColoring
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Color Adapter sample program'
  ClientHeight = 277
  ClientWidth = 440
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
  object clbSource: TColorBox
    Left = 8
    Top = 16
    Width = 424
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 26
    ParentFont = False
    TabOrder = 0
    OnChange = clbSourceChange
  end
  object grbColoringComponents: TGroupBox
    Left = 8
    Top = 64
    Width = 424
    Height = 205
    Caption = ' Coloring components '
    TabOrder = 1
    object lblColoring: TLabel
      Left = 11
      Top = 162
      Width = 403
      Height = 23
      AutoSize = False
      Caption = 'Coloring label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtColoring: TEdit
      Left = 11
      Top = 80
      Width = 403
      Height = 65
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Coloring edit'
    end
    object cbxColoring: TCheckBox
      Left = 11
      Top = 25
      Width = 403
      Height = 33
      Caption = 'Coloring checkbox'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
  end
end
