unit WordCalculatorViewIntf;

interface

uses
  System.Classes
  ,Vcl.Controls;

type

  IViewWordCalculator = interface
  ['{3CDAA395-4E59-4DD4-82AE-1DE364EBF78F}']
    // Input
    function GetResourcePath: string;
    function GetResourceType: Integer;
    function GetWordToSearch: string;
    // Output
    procedure SetResourceContent(AValue: TStrings);
    procedure SetResult(const AValue: string);
    procedure ClearResourceContent;
    procedure DisplayMessage(const AValue: string);
    // Questions to the operator
    function AskForConfirmation(const AValue: string): TModalResult;
  end;

implementation

end.
