unit Item.ActiveRecord;

interface

uses
  FireDAC.Comp.Client, Base.ActiveRecord, System.Generics.Collections;

type

  TItems = class;

  TItemActiveRecord = class(TBaseActiveRecord)
  const
    SQL_INSERT =
      'INSERT INTO dbo.Items (ItemNumber, ItemDescr, SafetyStock) VALUES (''%s'',''%s'',%d)';
    SQL_UPDATE =
      'UPDATE dbo.Items SET ItemNumber = ''%s'', ItemDescr = ''%s'', SafetyStock = %d WHERE ID = %d';
    SQL_FIND_ALL =
      'SELECT ID, ItemNumber, ItemDescr, SafetyStock FROM dbo.Items';
    SQL_FIND_BY_PK =
      'SELECT ID, ItemNumber, ItemDescr, SafetyStock FROM dbo.Items WHERE ID = %d';
    SQL_DELETE =
      'DELETE FROM dbo.Items WHERE ID = %d';
    SQL_DELETE_ALL =
      'DELETE FROM dbo.Items';
    // Business logic
    SQL_FIND_CRITICAL_STOCK_LEVEL =
      'SELECT ID, ItemNumber, ItemDescr, SafetyStock FROM dbo.Items WHERE SafetyStock < 10';
  private
    FID: Integer;
    FItemNumber: string;
    FItemDescr: string;
    FSafetyStock: Integer;
    procedure SetItemNumber(const AValue: string);
    procedure SetItemDescr(const AValue: string);
    procedure SetSafetyStock(const AValue: Integer);
  private
    class function LoadItem(AReader: TFDAdaptedDataSet): TItemActiveRecord;
    class function FillItemList(const ASQL: string): TItems;
    function GetFullItemDescription: string;
  public
    class function Get(AID: Integer): TItemActiveRecord;
    class function GetAll: TItems;
    class function GetCriticalStockLevel: TItems;
    class procedure DeleteAll;
    procedure Insert;
    procedure Update;
    procedure Delete;
    function ToString: string; override;
    property ID: Integer read FID;
    property ItemNumber: string read FItemNumber write SetItemNumber;
    property ItemDescr: string read FItemDescr write SetItemDescr;
    property SafetyStock: Integer read FSafetyStock write SetSafetyStock;
    property FullItemDescription: string read GetFullItemDescription;

  end;

  TItems = class(TObjectList<TItemActiveRecord>);

implementation

uses
  System.SysUtils, FireDAC.DApt;

{ TItemActiveRecord }

procedure TItemActiveRecord.Delete;
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  try
    LQry.Connection := Connection;
    LQry.SQL.Text := Format(SQL_DELETE, [ID]);
    Connection.ResourceOptions.DirectExecute := True;
    LQry.ExecSQL;
  finally
    LQry.Free;
  end;
end;

class procedure TItemActiveRecord.DeleteAll;
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  try
    LQry.Connection := Connection;
    LQry.SQL.Text := SQL_DELETE_ALL;
    Connection.ResourceOptions.DirectExecute := True;
    LQry.ExecSQL;
  finally
    LQry.Free;
  end;
end;

class function TItemActiveRecord.FillItemList(const ASQL: string): TItems;
var
  LQry: TFDQuery;
begin
  Result := TItems.Create(True);
  LQry := TFDQuery.Create(nil);

  try
    LQry.Connection := Connection;
    LQry.SQL.Text := ASQL;
    LQry.Open();

    while (not LQry.Eof) do begin
      Result.Add(LoadItem(LQry));
      LQry.Next;
    end;

  finally
    LQry.Free
  end;
end;

class function TItemActiveRecord.Get(AID: Integer): TItemActiveRecord;
var
  LQry: TFDQuery;
begin
  Result := nil;

  LQry := TFDQuery.Create(nil);

  try
    LQry.Connection := Connection;
    LQry.SQL.Text := Format(SQL_FIND_BY_PK, [AID]);
    LQry.Open();
    if (not LQry.Eof) then
      Result := LoadItem(LQry);
  finally
    LQry.Free;
  end;
end;

class function TItemActiveRecord.GetAll: TItems;
begin
  Result := FillItemList(SQL_FIND_ALL)
end;

class function TItemActiveRecord.GetCriticalStockLevel: TItems;
begin
  Result := FillItemList(SQL_FIND_CRITICAL_STOCK_LEVEL);
end;

function TItemActiveRecord.GetFullItemDescription: string;
begin
  Result := FItemNumber + ' ' + FItemDescr;
end;

procedure TItemActiveRecord.Insert;
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  try
    LQry.Connection := Connection;
    LQry.SQL.Text := Format(SQL_INSERT, [ItemNumber, ItemDescr, SafetyStock]);
    Connection.ResourceOptions.DirectExecute := True;
    LQry.ExecSQL;
    FID := GetMaxID();
  finally
    LQry.Free;
  end;
end;

class function TItemActiveRecord.LoadItem(
  AReader: TFDAdaptedDataSet): TItemActiveRecord;
begin
  Result := TItemActiveRecord.Create;
  Result.FID := AReader.Fields[0].AsInteger;
  Result.FItemNumber := AReader.Fields[1].AsString;
  Result.FItemDescr := AReader.Fields[2].AsString;
  Result.FSafetyStock := AReader.Fields[3].AsInteger;
end;

procedure TItemActiveRecord.SetItemDescr(const AValue: string);
begin
  FItemDescr := AValue;
end;

procedure TItemActiveRecord.SetItemNumber(const AValue: string);
begin
  FItemNumber := AValue;
end;

procedure TItemActiveRecord.SetSafetyStock(const AValue: Integer);
begin
  FSafetyStock := AValue;
end;

function TItemActiveRecord.ToString: string;
begin
  Result := Format('%s, %s (Safety Stock: %d) (ID: %d)', [ItemNumber, ItemDescr, SafetyStock, ID]);
end;

procedure TItemActiveRecord.Update;
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  try
    LQry.Connection := Connection;
    LQry.SQL.Text := Format(SQL_UPDATE, [ItemNumber, ItemDescr, SafetyStock, ID]);
    Connection.ResourceOptions.DirectExecute := True;
    LQry.ExecSQL;
  finally
    LQry.Free;
  end;
end;

end.
