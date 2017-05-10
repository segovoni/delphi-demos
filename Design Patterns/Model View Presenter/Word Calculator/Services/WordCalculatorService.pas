unit WordCalculatorService;

interface

uses
  System.Classes
  ,WordCalculatorServiceIntf;

type

  TFileWordCalculatorService = class(TInterfacedObject, IServiceWordCalculator)
  private
    FFilePath: string;
  public
    function GetWordOccurrence(const AWordSearch: string; out AFileContent: TStringList): Integer;
    procedure SetResourcePath(const AValue: string);
  end;

  TDBWordCalculatorService = class(TInterfacedObject, IServiceWordCalculator)
  private
    FConnectionString: string;
  public
    function GetWordOccurrence(const AWordSearch: string; out AFileContent: TStringList): Integer;
    procedure SetResourcePath(const AValue: string);
  end;

implementation

uses
  System.StrUtils
  ,System.SysUtils
  ,Data.Win.ADODB;

{ TFileWordCalculatorService }

function TFileWordCalculatorService.GetWordOccurrence(const AWordSearch: string; out AFileContent: TStringList): Integer;
var
  LCurrentPosition: Integer;
begin
  Result := 0;
  AFileContent := TStringList.Create;

  if FileExists(FFilePath) then
  begin
    AFileContent := TStringList.Create;

    // Open file
    AFileContent.LoadFromFile(FFilePath);

    LCurrentPosition := PosEx(AWordSearch, AFileContent.Text, 1);

    while (LCurrentPosition <> 0) do
    begin
      Inc(Result);
      LCurrentPosition := PosEx(AWordSearch, AFileContent.Text, LCurrentPosition + Length(AWordSearch));
    end;
  end
  else
    AFileContent.Text := 'The file or directory does not exist!';
end;

procedure TFileWordCalculatorService.SetResourcePath(const AValue: string);
begin
  FFilePath := AValue;
end;

{ TDBWordCalculatorService }

function TDBWordCalculatorService.GetWordOccurrence(const AWordSearch: string; out AFileContent: TStringList): Integer;
var
  LDB: TADOConnection;
  LQuery: TADOQuery;
  LCurrentPosition: Integer;
begin
  Result := 0;
  AFileContent := TStringList.Create;

  LDB := TADOConnection.Create(nil);
  try
    LDB.ConnectionString := FConnectionString;
    LDB.Open();

    if LDB.Connected then
    begin
      LQuery := TADOQuery.Create(nil);

      try
        LQuery.Connection := LDB;
        LQuery.SQL.Text := 'SELECT Col1 From dbo.Table1';
        LQuery.Open;

        while not LQuery.Eof do
        begin
          AFileContent.Add(LQuery.FieldByName('Col1').AsString);

          LCurrentPosition := PosEx(AWordSearch, LQuery.FieldByName('Col1').AsString, 1);

          while (LCurrentPosition <> 0) do
          begin
            Inc(Result);
            LCurrentPosition := PosEx(AWordSearch, LQuery.FieldByName('Col1').AsString, LCurrentPosition + Length(LQuery.FieldByName('Col1').AsString));
          end;

          LQuery.Next;
        end;
      finally
        LQuery.Free;
      end;
    end
    else
      AFileContent.Text := 'It is impossible to access the database!';
  finally
    LDB.Free;
  end;
end;

procedure TDBWordCalculatorService.SetResourcePath(const AValue: string);
begin
  FConnectionString := AValue;
end;

end.
