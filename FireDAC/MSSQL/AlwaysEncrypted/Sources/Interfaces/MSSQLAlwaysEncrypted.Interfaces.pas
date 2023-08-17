unit MSSQLAlwaysEncrypted.Interfaces;

interface

uses
  Data.DB;

type
  IMainView = interface
    ['{60C0203E-A043-4751-B2E7-6E7CEC418C43}']
    // input (function)
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
    // output (procedure)
    procedure Connect;
    procedure OpenQuery;
    procedure ExecUpdate;
    procedure DisplayMessage(AValue: string);
    // input/output (function with params)
    function AskConfirmation(AValue: string): Boolean;
  end;

implementation

end.
