unit MSSQLAlwaysEncrypted.Interfaces;

interface

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
    // output (procedure)
    procedure Connect;
    procedure DisplayMessage(AValue: string);
    // input/output
    function AskConfirmation(AValue: string): Boolean;
  end;

implementation

end.
