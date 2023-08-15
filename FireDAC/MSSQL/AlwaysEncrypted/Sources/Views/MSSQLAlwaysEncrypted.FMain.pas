unit MSSQLAlwaysEncrypted.FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  MSSQLAlwaysEncrypted.Interfaces, MSSQLAlwaysEncrypted.MainPresenter;

type
  TfrmAlwaysEncryptedMain = class(TForm, IMainView)
    lbledtServerName: TLabeledEdit;
    lbledtUserName: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    btnConnect: TButton;
    lbledtDatabaseName: TLabeledEdit;
    lbledtDriverID: TLabeledEdit;
    lbledtDataSource: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
  private
    FAlwaysEncryptedMainPresenter: TAlwaysEncryptedMainPresenter;
  public
    // input (function)
    function GetDriverID: string;
    function GetDataSource: string;
    function GetServerName: string;
    function GetDatabaseName: string;
    function GetUserName: string;
    function GetPassword: string;
    // output (procedure)
    procedure Connect;
    procedure DisplayMessage(AValue: string);
    // input/output
    function AskConfirmation(AValue: string): Boolean;
  end;

var
  frmAlwaysEncryptedMain: TfrmAlwaysEncryptedMain;

implementation

const
  APPTITLE = 'SQL Server Always Encrypted - Sample Application';

{$R *.dfm}

{ TfrmAlwaysEncryptedMain }

function TfrmAlwaysEncryptedMain.AskConfirmation(AValue: string): Boolean;
begin
  result := (Application.MessageBox(PChar(AValue), APPTITLE, MB_YESNO) = IDYES);
end;

procedure TfrmAlwaysEncryptedMain.btnConnectClick(Sender: TObject);
begin
  FAlwaysEncryptedMainPresenter.Connect;
end;

procedure TfrmAlwaysEncryptedMain.Connect;
begin
  FAlwaysEncryptedMainPresenter.Connect;
end;

procedure TfrmAlwaysEncryptedMain.DisplayMessage(AValue: string);
begin
  Application.MessageBox(PChar(AValue), APPTITLE, MB_OK);
end;

procedure TfrmAlwaysEncryptedMain.FormCreate(Sender: TObject);
begin
  FAlwaysEncryptedMainPresenter := TAlwaysEncryptedMainPresenter.Create(Self);
end;

procedure TfrmAlwaysEncryptedMain.FormDestroy(Sender: TObject);
begin
  FAlwaysEncryptedMainPresenter.Free;
end;

function TfrmAlwaysEncryptedMain.GetDatabaseName: string;
begin
  result := lbledtDatabaseName.Text;
end;

function TfrmAlwaysEncryptedMain.GetDataSource: string;
begin
  result := lbledtDataSource.Text;
end;

function TfrmAlwaysEncryptedMain.GetDriverID: string;
begin
  result := lbledtDriverID.Text;
end;

function TfrmAlwaysEncryptedMain.GetPassword: string;
begin
  result := lbledtPassword.Text;
end;

function TfrmAlwaysEncryptedMain.GetServerName: string;
begin
  result := lbledtServerName.Text;
end;

function TfrmAlwaysEncryptedMain.GetUserName: string;
begin
  result := lbledtUserName.Text;
end;

end.
