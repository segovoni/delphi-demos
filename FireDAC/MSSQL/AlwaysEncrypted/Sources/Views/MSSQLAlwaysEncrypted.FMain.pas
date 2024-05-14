unit MSSQLAlwaysEncrypted.FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  MSSQLAlwaysEncrypted.Interfaces, MSSQLAlwaysEncrypted.MainPresenter,
  Vcl.WinXCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.ODBCDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.ODBC,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, Data.Win.ADODB, Vcl.Mask;

type
  TfrmAlwaysEncryptedMain = class(TForm, IMainView)
    pnlQueryEncryptedData: TRelativePanel;
    dbgQueryEncryptedData: TDBGrid;
    memoSELECT: TMemo;
    btnOpenQuery: TButton;
    dsQueryEncryptedData: TDataSource;
    pnlConnection: TPanel;
    lbledtDriverID: TLabeledEdit;
    lbledtDataSource: TLabeledEdit;
    lbledtServerName: TLabeledEdit;
    lbledtDatabaseName: TLabeledEdit;
    lbledtUserName: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    btnConnect: TButton;
    pnlUpdate: TPanel;
    lbledtUpdateStmt: TLabeledEdit;
    lbledtEncryptedTableName: TLabeledEdit;
    lbledtSet: TLabeledEdit;
    lbledtEncryptedColumnName: TLabeledEdit;
    lbledtEqualTo: TLabeledEdit;
    lbledtNonEncryptedValue: TLabeledEdit;
    btnUpdate: TButton;
    lbledtWhereClause: TLabeledEdit;
    lbledtColumnNameWhere: TLabeledEdit;
    lbledtEqualToWhere: TLabeledEdit;
    lbledtColumnValueWhere: TLabeledEdit;
    DBGrid1: TDBGrid;
    dsQueryEncryptedDataTEST: TDataSource;
    FDQueryTEST: TFDQuery;
    FDConnectionTEST: TFDConnection;
    ADOConnectionTEST: TADOConnection;
    DBGrid2: TDBGrid;
    ADOQueryTEST: TADOQuery;
    DataSourceTEST: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnOpenQueryClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FAlwaysEncryptedMainPresenter: TAlwaysEncryptedMainPresenter;
    // View utility
    procedure SetConnection;
  public
    // Input (function)
    function GetDriverID: string;
    function GetDataSource: string;
    function GetServerName: string;
    function GetDatabaseName: string;
    function GetUserName: string;
    function GetPassword: string;
    function GetSELECTSQLText: string;
    function GetdsQueryEncryptedData: TDataSource;
    function GetEncryptedTableName: string;
    function GetEncryptedColumnName: string;
    function GetNonEncryptedValue: string;
    function GetColumnNameWhere: string;
    function GetColumnValueWhere: string;
    // Output (procedure)
    procedure Connect;
    procedure OpenQuery;
    procedure ExecUpdate;
    procedure DisplayMessage(AValue: string);
    // Input/Output (function with params)
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
  Connect;
end;

procedure TfrmAlwaysEncryptedMain.btnOpenQueryClick(Sender: TObject);
begin
  OpenQuery;
end;

procedure TfrmAlwaysEncryptedMain.btnUpdateClick(Sender: TObject);
begin
  ExecUpdate;
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

procedure TfrmAlwaysEncryptedMain.FormShow(Sender: TObject);
begin
  SetConnection;
end;

function TfrmAlwaysEncryptedMain.GetColumnNameWhere: string;
begin
  result := lbledtColumnNameWhere.Text;
end;

function TfrmAlwaysEncryptedMain.GetColumnValueWhere: string;
begin
  result := lbledtColumnValueWhere.Text;
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

function TfrmAlwaysEncryptedMain.GetdsQueryEncryptedData: TDataSource;
begin
  result := dsQueryEncryptedData;
end;

function TfrmAlwaysEncryptedMain.GetEncryptedColumnName: string;
begin
  result := lbledtEncryptedColumnName.Text;
end;

function TfrmAlwaysEncryptedMain.GetEncryptedTableName: string;
begin
  result := lbledtEncryptedTableName.Text;
end;

function TfrmAlwaysEncryptedMain.GetNonEncryptedValue: string;
begin
  result := lbledtNonEncryptedValue.Text;
end;

function TfrmAlwaysEncryptedMain.GetPassword: string;
begin
  result := lbledtPassword.Text;
end;

function TfrmAlwaysEncryptedMain.GetSELECTSQLText: string;
begin
  result := memoSELECT.Text;
end;

function TfrmAlwaysEncryptedMain.GetServerName: string;
begin
  result := lbledtServerName.Text;
end;

function TfrmAlwaysEncryptedMain.GetUserName: string;
begin
  result := lbledtUserName.Text;
end;

procedure TfrmAlwaysEncryptedMain.OpenQuery;
begin
  FAlwaysEncryptedMainPresenter.OpenQuery;
end;

procedure TfrmAlwaysEncryptedMain.SetConnection;
begin
  lbledtDriverID.Text := 'ODBC';
  lbledtDataSource.Text := 'AlwaysEncryptedDB';
  lbledtServerName.Text := 'decision-making';
  lbledtDatabaseName.Text := 'AlwaysEncryptedDB';
  lbledtUserName.Text := 'Delphi_User';
  lbledtPassword.Text := 'DelphiDay2024!';
end;

procedure TfrmAlwaysEncryptedMain.ExecUpdate;
begin
  FAlwaysEncryptedMainPresenter.Update;
end;

end.
