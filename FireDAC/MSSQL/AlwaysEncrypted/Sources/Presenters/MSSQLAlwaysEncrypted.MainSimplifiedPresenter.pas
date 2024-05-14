unit MSSQLAlwaysEncrypted.MainSimplifiedPresenter;

interface

uses
  MSSQLAlwaysEncrypted.Interfaces;

type

  TAlwaysEncryptedMainSimplifiedPresenter = class
  protected
    FMainSimplifiedView: IMainSimplifiedView;
  public
    constructor Create(AMainSimplifiedView: IMainSimplifiedView);
    procedure Connect;
    procedure OpenQuery;
    procedure Update;
    procedure DisplayPerson;
  end;

implementation

uses
  MSSQLAlwaysEncrypted.DataModule, Data.DB,
  MSSQLAlwaysEncrypted.Person.ActiveRecord;

{ TAlwaysEncryptedMainSimplifiedPresenter }

procedure TAlwaysEncryptedMainSimplifiedPresenter.Connect;
var
  LDriverID: string;
  LServerName: string;
  LDatabaseName: string;
  LUserName: string;
  LPassword: string;
  LODBCAdvanced: string;
begin
  LDriverID := FMainSimplifiedView.GetDriverID;
  LServerName := FMainSimplifiedView.GetServerName;
  LDatabaseName := FMainSimplifiedView.GetDatabaseName;
  LUserName := FMainSimplifiedView.GetUserName;
  LPassword := FMainSimplifiedView.GetPassword;

  DM.FDConnection.Connected := False;
  DM.FDConnection.Params.Clear;

  DM.FDConnection.Params.DriverID := LDriverID;
  DM.FDConnection.Params.Add('Server=' + LServerName);
  DM.FDConnection.Params.Database := LDatabaseName;
  DM.FDConnection.Params.UserName := LUserName;
  DM.FDConnection.Params.Password := LPassword;

  {
  DM.FDConnection.Params.Add('ODBCAdvanced=Trusted_Connection=No;' +
    'APP=Professional;' +
    'WSID='+LServerName+';' +
    'TrustServerCertificate=Yes;' +
    'ColumnEncryption=Enabled');
  }

  LODBCAdvanced := 'ODBCAdvanced=APP=Professional;WSID='+LServerName+';';

  // FireDAC connection configured to encrypt/decrypt data before letting SQL Server
  // or Azure SQL manage it. Enable both parameter encryption and result set
  // encrypted column decryption is by setting the value of the ColumnEncryption
  // connection string keyword to Enabled

  if FMainSimplifiedView.GetTrustServerCertificate then
    LODBCAdvanced := LODBCAdvanced + 'TrustServerCertificate=yes;';

  if FMainSimplifiedView.GetColumnEncryption then
    LODBCAdvanced := LODBCAdvanced + 'ColumnEncryption=Enabled;';

  DM.FDConnection.Params.Add(LODBCAdvanced);

  DM.FDConnection.Connected := True;

  if DM.FDConnection.Connected then
    FMainSimplifiedView.DisplayMessage('Connected!')
  else
    FMainSimplifiedView.DisplayMessage('Not connected, see the previous error!');
end;

constructor TAlwaysEncryptedMainSimplifiedPresenter.Create(
  AMainSimplifiedView: IMainSimplifiedView);
begin
  FMainSimplifiedView := AMainSimplifiedView;
end;

procedure TAlwaysEncryptedMainSimplifiedPresenter.DisplayPerson;
var
  LPersonAR: TPersonActiveRecord;
begin
  LPersonAR := TPersonActiveRecord.Get(
    FMainSimplifiedView.GetdsQueryEncryptedData.DataSet.FieldByName('ID').AsInteger);

  FMainSimplifiedView.DisplayFirstName(LPersonAR.FirstName);
  FMainSimplifiedView.DisplayLastName(LPersonAR.LastName);
  FMainSimplifiedView.DisplaySocialSecurityNumber(LPersonAR.SocialSecurityNumber);
  FMainSimplifiedView.DisplayCreditCardNumber(LPersonAR.CreditCardNumber);
  FMainSimplifiedView.DisplaySalary(LPersonAR.Salary);
end;

procedure TAlwaysEncryptedMainSimplifiedPresenter.OpenQuery;
var
  LSQL: string;
  LDataSource: TDataSource;
begin
  LSQL := FMainSimplifiedView.GetSELECTSQLText;

  if (LSQL <> '') then
  begin
    LDataSource := FMainSimplifiedView.GetdsQueryEncryptedData;
    LDataSource.DataSet := DM.FDQrySelectEncryptedData;
    DM.FDQrySelectEncryptedData.Close;
    DM.FDQrySelectEncryptedData.SQL.Text := LSQL;
    DM.FDQrySelectEncryptedData.Open;
  end
  else
    FMainSimplifiedView.DisplayMessage('SQL query text is empty!');
end;

procedure TAlwaysEncryptedMainSimplifiedPresenter.Update;
var
  LPersonAR: TPersonActiveRecord;
begin
  TPersonActiveRecord.Connection := DM.FDConnection;
  LPersonAR := TPersonActiveRecord.Get(
    FMainSimplifiedView.GetdsQueryEncryptedData.DataSet.FieldByName('ID').AsInteger);

  try
    LPersonAR.FirstName := FMainSimplifiedView.GetFirstName;
    LPersonAR.LastName := FMainSimplifiedView.GetLastName;
    LPersonAR.SocialSecurityNumber := FMainSimplifiedView.GetSocialSecurityNumber;
    LPersonAR.CreditCardNumber := FMainSimplifiedView.GetCreditCardNumber;
    LPersonAR.Salary := FMainSimplifiedView.GetSalary;
    LPersonAR.Update;
  finally
    LPersonAR.Free;
  end;
end;

end.
