program ActiveRecord1_Console;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Base.ActiveRecord in 'Source\Base.ActiveRecord.pas',
  Item.ActiveRecord in 'Source\Item.ActiveRecord.pas',
  UDMConnection in 'Source\UDMConnection.pas' {DMConnection: TDataModule};

var
  I, id: Integer;
  LTempItemAR, LItemAR, LItem: TItemActiveRecord;
  LItems: TItems;

begin
  try
    DMConnection := TDMConnection.Create(nil);
    TItemActiveRecord.Connection :=  DMConnection.FDConnection;

    TItemActiveRecord.DeleteAll;

    WriteLn('Insert 5 new items for my company...');
    for I := 1 to 5 do
    begin
      LItemAR := TItemActiveRecord.Create;
      try
        LItemAR.ItemNumber := 'Item' + Trim(IntToStr(I));
        LItemAR.ItemDescr := 'Item description for ' + LItemAR.ItemNumber;
        LItemAR.SafetyStock := 7 + I;
        LItemAR.Insert;
      finally
        LItemAR.Free;
      end;
    end;

    WriteLn('Add Item100...');
    LTempItemAR := TItemActiveRecord.Create;
    LTempItemAR.ItemNumber := 'Item100';
    LTempItemAR.ItemDescr := 'This is the Item100';
    LTempItemAR.SafetyStock := 8;
    LTempItemAR.Insert;

    WriteLn('Change the Safety Stock ', LTempItemAR.ToString);
    LTempItemAR.SafetyStock := 300;
    LTempItemAR.Update;

    WriteLn('The Safety Stock has been changed ', LTempItemAR.ToString);
    ID := LTempItemAR.ID;
    LTempItemAR.Free;

    // Finder
    LTempItemAR := TItemActiveRecord.Get(ID);
    WriteLn('Finding an item...');
    WriteLn(LTempItemAR.ToString);

    // Finder with logic
    WriteLn('Finding critical stock level items...');
    LItems := TItemActiveRecord.GetCriticalStockLevel;
    try
      for LItem in LItems do
        WriteLn(LItem.ToString + '( Full item Ddscription: ' + LItem.FullItemDescription + ' )');
    finally
      LItems.Free;
    end;

  except
    on E: Exception do
      WriteLn(E.ClassName + ' ' + E.Message);
  end;

  Readln;
end.
