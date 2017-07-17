program TableDataGateway1_Console;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Item.TableDataGateway in 'Source\Item.TableDataGateway.pas',
  UDMConnection in 'Source\UDMConnection.pas' {DMConnection: TDataModule};

var
  I: Integer;
  LItemTableDataGateway: TItemTableDataGateway;
  LItem: TItem;
  LItems: TItems;

begin
  try
    DMConnection := TDMConnection.Create(nil);
    LItemTableDataGateway := TItemTableDataGateway.Create(DMConnection.FDConnection);

    try
      LItemTableDataGateway.DeleteAll;

      for I := 1 to 5 do
        LItemTableDataGateway.Insert('Item' + Trim(IntToStr(I)), 'Description of Item ' + Trim(IntToStr(I)), 8 + I);

      LItemTableDataGateway.Insert('Item100', 'Description of Item 100', 7);
      LItemTableDataGateway.Update(LItemTableDataGateway.GetLastInsertID, 'Item100', 'Description of Item 100 --modified--', 60);
      LItem := LItemTableDataGateway.Get(LItemTableDataGateway.GetLastInsertID);
      WriteLn(LItem.ToString);
      LItem.Free;
      LItemTableDataGateway.Delete(LItemTableDataGateway.GetLastInsertID);

      LItems := LItemTableDataGateway.GetAll;

      for LItem in LItems do
        WriteLn(LItem.ToString);

      LItems.Free;

    finally
      LItemTableDataGateway.Free;
      DMConnection.FDConnection.Close;
      DMConnection.Free
    end;

  except on E: Exception do
    WriteLn(E.Message);
  end;

  Readln;
end.
