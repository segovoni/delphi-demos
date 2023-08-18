object DM: TDM
  OldCreateOrder = False
  Height = 205
  Width = 263
  object FDConnection: TFDConnection
    Left = 56
    Top = 40
  end
  object FDQrySelectEncryptedData: TFDQuery
    AutoCalcFields = False
    Connection = FDConnection
    Left = 120
    Top = 104
  end
  object FDQryUpdateEncryptedData: TFDQuery
    Connection = FDConnection
    Left = 160
    Top = 48
  end
end
