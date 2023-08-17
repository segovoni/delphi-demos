unit MSSQLAlwaysEncrypted.MainPresenter;

interface

uses
  MSSQLAlwaysEncrypted.Interfaces;

type

  TAlwaysEncryptedMainPresenter = class
  protected
    FMainView: IMainView;
  public
    constructor Create(AMainView: IMainView);
    procedure Connect;
    procedure OpenQuery;
  end;

implementation

uses
  MSSQLAlwaysEncrypted.DataModule, Data.DB;

{ TAlwaysEncryptedMainPresenter }

procedure TAlwaysEncryptedMainPresenter.Connect;
var
  LDriverID: string;
  LDataSource: string;
  LServerName: string;
  LDatabaseName: string;
  LUserName: string;
  LPassword: string;
begin
  LDriverID := FMainView.GetDriverID;
  LDataSource := FMainView.GetDataSource;
  LServerName := FMainView.GetServerName;
  LDatabaseName := FMainView.GetDatabaseName;
  LUserName := FMainView.GetUserName;
  LPassword := FMainView.GetPassword;

  DM.FDConnection.Connected := False;
  DM.FDConnection.Params.Clear;

  DM.FDConnection.Params.DriverID := LDriverID;
  DM.FDConnection.Params.Add('DataSource='+LDataSource);
  DM.FDConnection.Params.Database := LDatabaseName;
  DM.FDConnection.Params.UserName := LUserName;
  DM.FDConnection.Params.Password := LPassword;
  DM.FDConnection.Params.Add('ODBCAdvanced=Trusted_Connection=No;' +
    'APP=Professional;' +
    'WSID='+LServerName+';' +
    'TrustServerCertificate=Yes;' +
    'ColumnEncryption=Enabled');

  DM.FDConnection.Connected := True;

  if DM.FDConnection.Connected then
    FMainView.DisplayMessage('Connected!')
  else
    FMainView.DisplayMessage('Not connected, see the previous error!');

end;

constructor TAlwaysEncryptedMainPresenter.Create(AMainView: IMainView);
begin
  FMainView := AMainView
end;

procedure TAlwaysEncryptedMainPresenter.OpenQuery;
var
  LSQL: string;
  LDataSource: TDataSource;
begin
  LSQL := FMainView.GetSELECTSQLText;

  if (LSQL <> '') then
  begin
    LDataSource := FMainView.GetdsQueryEncryptedData;
    LDataSource.DataSet := DM.FDQrySelectEncryptedData;
    DM.FDQrySelectEncryptedData.Close;
    DM.FDQrySelectEncryptedData.SQL.Text := LSQL;
    DM.FDQrySelectEncryptedData.Open;
  end
  else
    FMainView.DisplayMessage('SQL query text is empty!');
end;

end.
