object DMConnection: TDMConnection
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDConnection: TFDConnection
    Params.Strings = (
      'Server=corso-cappellari.database.windows.net'
      'Database=AdventureWorks'
      'User_Name=sgovoni'
      'Password=corso-cappellari8ik,mju7'
      'MARS=No'
      'ConnectionDef=MSSQL_Demo')
    Connected = True
    Left = 80
    Top = 32
  end
end
