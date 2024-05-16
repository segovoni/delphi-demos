unit MSSQLAlwaysEncrypted.FMainSimplified;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.CategoryButtons,
  MSSQLAlwaysEncrypted.Interfaces, MSSQLAlwaysEncrypted.MainSimplifiedPresenter,
  Vcl.CheckLst, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TfrmAlwaysEncryptedMainSimplified = class(TForm, IMainSimplifiedView)
    cpgAlwaysEncrypted: TCategoryPanelGroup;
    cpConnection: TCategoryPanel;
    lbledtDriverID: TLabeledEdit;
    lbledtServerName: TLabeledEdit;
    lbledtDatabaseName: TLabeledEdit;
    lbledtUserName: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    chkTrustServerCertificate: TCheckBox;
    chkColumnEncryption: TCheckBox;
    btnConnect: TButton;
    cpQueryEncryptedData: TCategoryPanel;
    pnlQueryEncryptedDataButtons: TPanel;
    dbgQueryEncryptedData: TDBGrid;
    memoSELECT: TMemo;
    dsQueryEncryptedData: TDataSource;
    btnOpenQuery: TButton;
    cpUpdatePerson: TCategoryPanel;
    btnUpdate: TButton;
    lbledtFirstName: TLabeledEdit;
    lbledtLastName: TLabeledEdit;
    lbledtCreditCardNumber: TLabeledEdit;
    lbledtSalary: TLabeledEdit;
    lbledtSocialSecurityNumber: TLabeledEdit;
    lbledtGender: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure dsQueryEncryptedDataDataChange(Sender: TObject; Field: TField);
  private
    FAlwaysEncryptedMainSimplifiedPresenter: TAlwaysEncryptedMainSimplifiedPresenter;
    // View utility
    procedure SetConnection;
  public
    // Input (function)
    function GetDriverID: string;
    function GetServerName: string;
    function GetDatabaseName: string;
    function GetUserName: string;
    function GetPassword: string;
    function GetTrustServerCertificate: Boolean;
    function GetColumnEncryption: Boolean;
    function GetSELECTSQLText: string;
    function GetdsQueryEncryptedData: TDataSource;
    function GetFirstName: string;
    function GetLastName: string;
    function GetGender: string;
    function GetSocialSecurityNumber: string;
    function GetCreditCardNumber: string;
    function GetSalary: Currency;
    // Output (procedure)
    procedure Connect;
    procedure OpenQuery;
    procedure UpdatePerson;
    procedure DisplayFirstName(AValue: string);
    procedure DisplayLastName(AValue: string);
    procedure DisplayGender(AValue: string);
    procedure DisplaySocialSecurityNumber(AValue: string);
    procedure DisplayCreditCardNumber(AValue: string);
    procedure DisplaySalary(AValue: Currency);
    procedure DisplayMessage(AValue: string);
  end;

var
  frmAlwaysEncryptedMainSimplified: TfrmAlwaysEncryptedMainSimplified;

implementation

{$R *.dfm}

const
  APPTITLE = 'SQL Server Always Encrypted';

{ TfrmAlwaysEncryptedMainSimplified }

procedure TfrmAlwaysEncryptedMainSimplified.btnConnectClick(Sender: TObject);
begin
  Connect;
end;

procedure TfrmAlwaysEncryptedMainSimplified.btnOpenQueryClick(Sender: TObject);
begin
  OpenQuery;
end;

procedure TfrmAlwaysEncryptedMainSimplified.btnUpdateClick(Sender: TObject);
begin
  UpdatePerson;
end;

procedure TfrmAlwaysEncryptedMainSimplified.Connect;
begin
  FAlwaysEncryptedMainSimplifiedPresenter.Connect;
end;

procedure TfrmAlwaysEncryptedMainSimplified.DisplayCreditCardNumber(
  AValue: string);
begin
  lbledtCreditCardNumber.Text := AValue;
end;

procedure TfrmAlwaysEncryptedMainSimplified.DisplayFirstName(AValue: string);
begin
  lbledtFirstName.Text := AValue;
end;

procedure TfrmAlwaysEncryptedMainSimplified.DisplayGender(AValue: string);
begin
  lbledtGender.Text := AValue;
end;

procedure TfrmAlwaysEncryptedMainSimplified.DisplayLastName(AValue: string);
begin
  lbledtLastName.Text := AValue;
end;

procedure TfrmAlwaysEncryptedMainSimplified.DisplayMessage(AValue: string);
begin
  Application.MessageBox(PChar(AValue), APPTITLE, MB_OK);
end;

procedure TfrmAlwaysEncryptedMainSimplified.DisplaySalary(AValue: Currency);
begin
  lbledtSalary.Text := AValue.ToString();
end;

procedure TfrmAlwaysEncryptedMainSimplified.DisplaySocialSecurityNumber(
  AValue: string);
begin
  lbledtSocialSecurityNumber.Text := AValue
end;

procedure TfrmAlwaysEncryptedMainSimplified.dsQueryEncryptedDataDataChange(
  Sender: TObject; Field: TField);
begin
  FAlwaysEncryptedMainSimplifiedPresenter.DisplayPerson;
end;

procedure TfrmAlwaysEncryptedMainSimplified.FormCreate(Sender: TObject);
begin
  FAlwaysEncryptedMainSimplifiedPresenter :=
    TAlwaysEncryptedMainSimplifiedPresenter.Create(Self);
end;

procedure TfrmAlwaysEncryptedMainSimplified.FormShow(Sender: TObject);
begin
  SetConnection;
end;

function TfrmAlwaysEncryptedMainSimplified.GetColumnEncryption: Boolean;
begin
  result := chkColumnEncryption.Checked;
end;

function TfrmAlwaysEncryptedMainSimplified.GetCreditCardNumber: string;
begin
  result := lbledtCreditCardNumber.Text;
end;

function TfrmAlwaysEncryptedMainSimplified.GetDatabaseName: string;
begin
  result := lbledtDatabaseName.Text;
end;

function TfrmAlwaysEncryptedMainSimplified.GetDriverID: string;
begin
  result := lbledtDriverID.Text;
end;

function TfrmAlwaysEncryptedMainSimplified.GetdsQueryEncryptedData: TDataSource;
begin
  result := dsQueryEncryptedData;
end;

function TfrmAlwaysEncryptedMainSimplified.GetFirstName: string;
begin
  result := lbledtFirstName.Text;
end;

function TfrmAlwaysEncryptedMainSimplified.GetGender: string;
begin
  result := lbledtGender.Text;
end;

function TfrmAlwaysEncryptedMainSimplified.GetLastName: string;
begin
  result := lbledtLastName.Text;
end;

function TfrmAlwaysEncryptedMainSimplified.GetPassword: string;
begin
  result := lbledtPassword.Text;
end;

function TfrmAlwaysEncryptedMainSimplified.GetSalary: Currency;
begin
  result := StrToFloat(lbledtSalary.Text);
end;

function TfrmAlwaysEncryptedMainSimplified.GetSELECTSQLText: string;
begin
  result := memoSELECT.Text;
end;

function TfrmAlwaysEncryptedMainSimplified.GetServerName: string;
begin
  result := lbledtServerName.Text;
end;

function TfrmAlwaysEncryptedMainSimplified.GetSocialSecurityNumber: string;
begin
  result := lbledtSocialSecurityNumber.Text;
end;

function TfrmAlwaysEncryptedMainSimplified.GetTrustServerCertificate: Boolean;
begin
  result := chkTrustServerCertificate.Checked;
end;

function TfrmAlwaysEncryptedMainSimplified.GetUserName: string;
begin
  result := lbledtUserName.Text;
end;

procedure TfrmAlwaysEncryptedMainSimplified.OpenQuery;
begin
  FAlwaysEncryptedMainSimplifiedPresenter.OpenQuery;
end;

procedure TfrmAlwaysEncryptedMainSimplified.SetConnection;
begin
  lbledtDriverID.Text := 'MSSQL';
  lbledtServerName.Text := 'decision-making';
  lbledtDatabaseName.Text := 'AlwaysEncryptedDB';
  lbledtUserName.Text := 'Delphi_User';
  lbledtPassword.Text := 'DelphiDay2024!';
end;

procedure TfrmAlwaysEncryptedMainSimplified.UpdatePerson;
begin
  FAlwaysEncryptedMainSimplifiedPresenter.UpdatePerson;
end;

end.
