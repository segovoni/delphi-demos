unit WordCalculatorPresenter;

interface

uses
  WordCalculatorViewIntf
  ,WordCalculatorPresenterIntf
  ,WordCalculatorServiceIntf;

type

  TPresenterWordCalculator = class(TInterfacedObject, IPresenterWordCalculator)
  protected
    FViewWordCalculator: IViewWordCalculator;
  public
    constructor Create(AViewWordCalculator: IViewWordCalculator); overload;
    procedure PerformCalculation;
  end;

implementation

uses
  System.Classes
  ,System.SysUtils
  ,Data.Win.ADODB
  ,WordCalculatorService;

{ TPresenterWordCalculator }

constructor TPresenterWordCalculator.Create(AViewWordCalculator: IViewWordCalculator);
begin
  FViewWordCalculator := AViewWordCalculator;
end;

procedure TPresenterWordCalculator.PerformCalculation;
var
  LWordOccurrence: Integer;
  LFileContent: TStringList;
  LWordToSearch: string;
  LServiceWordCalculator: IServiceWordCalculator;
begin
  // It retrieves the resource type from the view
  if (FViewWordCalculator.GetResourceType = 0) then
    LServiceWordCalculator := TFileWordCalculatorService.Create
  else if (FViewWordCalculator.GetResourceType = 1) then
    LServiceWordCalculator := TDBWordCalculatorService.Create;

  LWordToSearch := FViewWordCalculator.GetWordToSearch;

  LServiceWordCalculator.SetResourcePath(FViewWordCalculator.GetResourcePath);

  // Implement the operation
  LWordOccurrence := LServiceWordCalculator.GetWordOccurrence(LWordToSearch, LFileContent);

  // Set outputs to the view
  FViewWordCalculator.SetResourceContent(TStrings(LFileContent));
  FViewWordCalculator.SetResult(IntToStr(LWordOccurrence));
end;

end.
