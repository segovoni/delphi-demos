/// <summary>
///   <para>
///     This unit-test is based on DUnit - Xtreme testing for Delphi.
///   </para>
///   <para>
///     More details are available here: <see href="http://dunit.sourceforge.net/README.html" />
///   </para>
/// </summary>
unit WordOccurenceCalculator_TestCases;

interface

uses
  System.Classes
  ,Vcl.Controls
  ,TestFramework
  ,WordCalculatorPresenter
  ,WordCalculatorViewIntf;

type

  TViewSimulator = class(TInterfacedObject, IViewWordCalculator)
  private
    FResourcePath: string;
    FResourceType: Integer;
    FWordToSearch: string;
    FResourceContent: TStringList;
    FResult: Integer;
  public
    constructor Create(const AResourceType: Integer; const AWordToSearch: string; const AResourcePath: string);
    // Input
    function GetResourcePath: string;
    function GetResourceType: Integer;
    function GetResult: Integer;
    function GetWordToSearch: string;
    // Output
    procedure SetResourceContent(AValue: TStrings);
    procedure ClearResourceContent;
    procedure SetResult(const AValue: string);
    procedure DisplayMessage(const AValue: string);
    // Questions to the operator
    function AskForConfirmation(const AValue: string): TModalResult;
  end;

  TTestCaseWordCalculator = class(TTestCase)
  private
    LPresenterWordCalculator: TPresenterWordCalculator;
    LIViewWordCalculator: IViewWordCalculator;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestWordCalculator;
  end;

implementation

uses
  System.SysUtils;

{ TViewSimulator }

function TViewSimulator.AskForConfirmation(const AValue: string): TModalResult;
begin
  // Always OK
  Result := mrOk;
end;

procedure TViewSimulator.ClearResourceContent;
begin
  FResourceContent.Text := '';
end;

constructor TViewSimulator.Create(const AResourceType: Integer; const AWordToSearch: string; const AResourcePath: string);
begin
  FResourceType := AResourceType;
  FWordToSearch := AWordToSearch;
  FResourcePath := AResourcePath;
  FResult := -1;
  FResourceContent := TStringList.Create;
end;

procedure TViewSimulator.DisplayMessage(const AValue: string);
begin
  raise Exception.Create(AValue);
end;

function TViewSimulator.GetResourcePath: string;
begin
  Result := FResourcePath
end;

function TViewSimulator.GetResourceType: Integer;
begin
  Result := FResourceType;
end;

function TViewSimulator.GetResult: Integer;
begin
  Result := FResult;
end;

function TViewSimulator.GetWordToSearch: string;
begin
  Result := FWordToSearch;
end;

procedure TViewSimulator.SetResourceContent(AValue: TStrings);
begin
  TStrings(FResourceContent) := AValue;
end;

procedure TViewSimulator.SetResult(const AValue: string);
begin
  FResult := StrToInt(AValue);
end;

{ TTestCaseWordCalculator }

procedure TTestCaseWordCalculator.SetUp;
begin
  inherited;
  LIViewWordCalculator := TViewSimulator.Create(0, ' if ', 'C:\Temp\WordCalculatorView.pas');
  LPresenterWordCalculator := TPresenterWordCalculator.Create(LIViewWordCalculator);
end;

procedure TTestCaseWordCalculator.TearDown;
begin
  inherited;
  LPresenterWordCalculator.Free;
end;

procedure TTestCaseWordCalculator.TestWordCalculator;
begin
  LPresenterWordCalculator.PerformCalculation;

  Check(TViewSimulator(LIViewWordCalculator).GetResult <> -1 , 'Calculation executed with errors');
end;

initialization
  TestFramework.RegisterTest(TTestCaseWordCalculator.Suite);

end.
