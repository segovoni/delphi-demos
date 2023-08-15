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
  end;

implementation

uses
  MSSQLAlwaysEncrypted.DataModule;

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
    FMainView.DisplayMessage('Connected!!');
end;

constructor TAlwaysEncryptedMainPresenter.Create(AMainView: IMainView);
begin
  FMainView := AMainView
end;

end.
