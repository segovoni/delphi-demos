unit WordCalculatorServiceIntf;

interface

uses
  System.Classes;

type
  IServiceWordCalculator = interface
  ['{ECBF13AA-1C22-4B7E-A5C0-BD2445C7E585}']
    function GetWordOccurrence(const AWordSearch: string; out AFileContent: TStringList): Integer;
    procedure SetResourcePath(const AValue: string);
  end;

implementation

end.
