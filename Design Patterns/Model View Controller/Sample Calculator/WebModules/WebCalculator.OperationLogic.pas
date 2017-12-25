unit WebCalculator.OperationLogic;

interface

type
  ICalculator = interface
    ['{6E0EDE80-9A41-4F79-A1F6-74BB0E5BAD74}']
    function PerformOperation(const AValueOne, AValueTwo, AOperation: string): Integer;
  end;

  TCalculator = class(TInterfacedObject, ICalculator)
  public
    function PerformOperation(const AValueOne, AValueTwo, AOperation: string): Integer;
  end;

  TCalculatorFactory = class sealed
    class function GetCalculator: ICalculator;
  end;

implementation

uses
  System.SysUtils;

{ TCalcPresenter }

function TCalculator.PerformOperation(const AValueOne, AValueTwo,
  AOperation: string): Integer;
begin
  //FWebContext.Request.Params['ValueOne'].ToInteger
  case AOperation[1] of
    '+': Result := (AValueOne.ToInteger + AValueTwo.ToInteger);
    '-': Result := (AValueOne.ToInteger - AValueTwo.ToInteger);
  else
    raise Exception.Create('Operation not supported!');
  end;
end;

{ TCalculatorFactory }

class function TCalculatorFactory.GetCalculator: ICalculator;
begin
  Result := TCalculator.Create;
end;

end.
