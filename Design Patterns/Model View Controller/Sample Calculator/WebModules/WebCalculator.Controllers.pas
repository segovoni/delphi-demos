unit WebCalculator.Controllers;

interface

uses
  MVCFramework, MVCFramework.Commons;

type
  /// <summary>
  ///   The Calculator Controller exposes all operations available in the
  ///   sample calculator.
  /// </summary>
  // MVCPath at the controller level
  [MVCPath('/Calculator')]
  TCalculatorController = class(TMVCController)
  public
    constructor Create;
    // MVCPath at the action level
    [MVCPath('/')]
    [MVCHTTPMethod([httpGET])]
    procedure Index;

    // MVCPath at the action level
    [MVCPath('/PerformOperation/($AValueOne)/($AValueTwo)/($AOperation)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCalculation(const AValueOne, AValueTwo, AOperation: string);
  protected
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;
  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, WebCalculator.OperationLogic;

procedure TCalculatorController.Index;
begin
  // use Context property to access to the HTTP request and response
  Render('Hello, I''m a sample calculator based on DelphiMVCFramework !!');
end;

constructor TCalculatorController.Create;
begin
  inherited Create;
end;

procedure TCalculatorController.GetCalculation(const AValueOne, AValueTwo,
  AOperation: string);
var
  LCalculator: ICalculator;
begin
  LCalculator := TCalculatorFactory.GetCalculator;
  Render('The result is: ' + LCalculator.PerformOperation(AValueOne, AValueTwo, AOperation).ToString);
end;

procedure TCalculatorController.OnAfterAction(Context: TWebContext; const AActionName: string);
begin
  { Executed after each action }
  inherited;
end;

procedure TCalculatorController.OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean);
begin
  { Executed before each action
    if handled is true (or an exception is raised) the actual
    action will not be called }
  inherited;
end;

end.
