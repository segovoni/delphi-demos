unit Item.TableDataGateway;

interface

uses
  System.Generics.Collections, FireDAC.DApt, FireDAC.Comp.Client;

type

  TItem = class
    ID: Integer;
    ItemNumber: string;
    ItemDescr: string;
    SafetyStock: Integer;
    constructor Create(const AID: Integer; const AItemNumber: string; const AItemDescr: string; ASafetyStock: Integer);
    function ToString: string; override;
  end;

  TItems = class(TObjectList<TItem>)
  end;

  TItemTableDataGateway = class
  private
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
    SQL_GET_MAX_ID = 'SELECT SCOPE_IDENTITY() as U';
    var
      FConnection: TFDConnection;
      function GetMaxID: Integer;
  protected
    FLastID: Integer;
    function LoadItem(Areader: TFDAdaptedDataSet): TItem;

  public
    function GetLastInsertID: Integer;
    constructor Create(AConnection: TFDConnection);
    procedure Insert(const AItemNumber: string; const AItemDescr: string; const ASafetyStock: Integer);
    procedure Update(const AID: Integer; const AItemNumber: string; const AItemDescr: string; const ASafetyStock: Integer);
    procedure Delete(const AID: Integer);
    function Get(const AID: Integer): TItem;
    function GetAll: TItems;
    procedure DeleteAll;
  end;

implementation

uses
  System.Variants, System.SysUtils;

{ TItemsTableDataGateway }

constructor TItemTableDataGateway.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

procedure TItemTableDataGateway.Delete(const AID: Integer);
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  try
    LQry.Connection := FConnection;
    LQry.SQL.Text := Format(SQL_DELETE, [AID]);
    FConnection.ResourceOptions.DirectExecute := True;
    LQry.ExecSQL;
  finally
    LQry.Free;
  end;
end;

procedure TItemTableDataGateway.DeleteAll;
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  try
    LQry.Connection := FConnection;
    LQry.SQL.Text := SQL_DELETE_ALL;
    FConnection.ResourceOptions.DirectExecute := True;
    LQry.ExecSQL;
  finally
    LQry.Free;
  end;
end;

function TItemTableDataGateway.Get(const AID: Integer): TItem;
var
  LQry: TFDQuery;
begin
  Result := nil;

  LQry := TFDQuery.Create(nil);

  try
    LQry.Connection := FConnection;
    LQry.SQL.Text := Format(SQL_FIND_BY_PK, [AID]);
    LQry.Open();
    if (not LQry.Eof) then
      Result := LoadItem(LQry);
  finally
    LQry.Free;
  end;
end;

function TItemTableDataGateway.GetAll: TItems;
var
  LQry: TFDQuery;
begin
  Result := TItems.Create(true);

  LQry := TFDQuery.Create(nil);
  try
    LQry.Connection := FConnection;
    LQry.SQL.Text := SQL_FIND_ALL;
    LQry.Open();

    while (not LQry.Eof) do
    begin
      Result.Add(LoadItem(LQry));
      LQry.Next;
    end;

  finally
    LQry.Free;
  end;
end;

function TItemTableDataGateway.GetLastInsertID: Integer;
begin
  Result := FLastID
end;

function TItemTableDataGateway.GetMaxID: Integer;
var
  LMaxID: Integer;
begin
  Result := -1;

  LMaxID := FConnection.ExecSQLScalar(SQL_GET_MAX_ID);

  if (LMaxID <> Null) then
    Result := LMaxID;
  FConnection.ResourceOptions.DirectExecute := False;
end;

procedure TItemTableDataGateway.Insert(const AItemNumber, AItemDescr: string;
  const ASafetyStock: Integer);
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  try
    LQry.Connection := FConnection;
    LQry.SQL.Text := Format(SQL_INSERT, [AItemNumber, AItemDescr, ASafetyStock]);
    FConnection.ResourceOptions.DirectExecute := True;
    LQry.ExecSQL;
    FLastID := GetMaxID();
  finally
    LQry.Free;
  end;
end;

function TItemTableDataGateway.LoadItem(Areader: TFDAdaptedDataSet): TItem;
begin
  Result := TItem.Create(AReader.Fields[0].AsInteger, AReader.Fields[1].AsString,
    AReader.Fields[2].AsString, AReader.Fields[3].AsInteger);
end;

procedure TItemTableDataGateway.Update(const AID: Integer; const AItemNumber,
  AItemDescr: string; const ASafetyStock: Integer);
var
  LQry: TFDQuery;
begin
  LQry := TFDQuery.Create(nil);
  try
    LQry.Connection := FConnection;
    LQry.SQL.Text := Format(SQL_UPDATE, [AItemNumber, AItemDescr, ASafetyStock, AID]);
    FConnection.ResourceOptions.DirectExecute := True;
    LQry.ExecSQL;
  finally
    LQry.Free;
  end;
end;

{ TItem }

constructor TItem.Create(const AID: Integer; const AItemNumber, AItemDescr: string;
  ASafetyStock: Integer);
begin
  inherited Create;
  Self.ID := AID;
  Self.ItemNumber := AItemNumber;
  Self.ItemDescr := AItemDescr;
  Self.SafetyStock := ASafetyStock;
end;

function TItem.ToString: string;
begin
  Result := Format('%s, %s (Safety Stock: %d) (ID: %d)', [ItemNumber, ItemDescr, SafetyStock, ID]);
end;

end.
