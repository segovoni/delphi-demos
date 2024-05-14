object DM: TDM
  OldCreateOrder = False
  Height = 266
  Width = 349
  object FDConnection: TFDConnection
    Left = 64
    Top = 16
  end
  object FDQrySelectEncryptedData: TFDQuery
    AutoCalcFields = False
    Connection = FDConnection
    Left = 248
    Top = 16
  end
  object FDQryUpdateEncryptedData: TFDQuery
    Connection = FDConnection
    Left = 64
    Top = 80
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 64
    Top = 152
  end
end
