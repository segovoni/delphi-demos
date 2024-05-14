unit MSSQLAlwaysEncrypted.Interfaces;

interface

uses
  Data.DB;

type
  IMainView = interface
    ['{60C0203E-A043-4751-B2E7-6E7CEC418C43}']
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

  IMainSimplifiedView = interface
    ['{B7A593AC-A9D2-4E28-9260-4B00D097E3E3}']
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
    procedure Update;
    procedure DisplayFirstName(AValue: string);
    procedure DisplayLastName(AValue: string);
    procedure DisplayGender(AValue: string);
    procedure DisplaySocialSecurityNumber(AValue: string);
    procedure DisplayCreditCardNumber(AValue: string);
    procedure DisplaySalary(AValue: Currency);
    procedure DisplayMessage(AValue: string);
  end;

implementation

end.
