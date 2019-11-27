unit UCalc;

interface

uses
  ICalc, PCalc;

type

  TViewCalcSimulator = class(TInterfacedObject, ICalcView)
  private
    FCalcPresenter: TCalcPresenter;
  public
    constructor Create(ACaclView: ICalcView); reintroduce;
    // input (function)
    function GetValueOne: Integer;
    function GetValueTwo: Integer;
    function GetOperator: string;
    // output (procedure)
    procedure SetResult(AValue: Integer);
    procedure DisplayMessage(AValue: string);
    // input/output
    function AskConfirmation(AValue: string): Boolean;
    procedure Execute;
  end;

implementation

uses
  System.SysUtils;

{ TViewCalcSimulator }

function TViewCalcSimulator.AskConfirmation(AValue: string): Boolean;
var
  LAnswer: string;
begin
  while True do
  begin
    WriteLn(AValue + ' (y/n)');
    ReadLn(LAnswer);
    if CompareText(LAnswer, 'y') = 0 then
    begin
      result := True;
      break;
    end
    else if CompareText(LAnswer, 'n') = 0 then
    begin
      result := False;
      break;
    end
    else begin
      WriteLn('Unrecognized response, specify "y" for Yes, "n" for No!');
    end;
  end;
end;

constructor TViewCalcSimulator.Create(ACaclView: ICalcView);
begin
  FCalcPresenter := TCalcPresenter.Create(Self);
end;

procedure TViewCalcSimulator.DisplayMessage(AValue: string);
begin
  WriteLn(AValue);
end;

procedure TViewCalcSimulator.Execute;
begin
  FCalcPresenter.PerformOperation;
end;

function TViewCalcSimulator.GetOperator: string;
begin
  WriteLn('Operator: ');
  ReadLn(result);
end;

function TViewCalcSimulator.GetValueOne: Integer;
begin
  WriteLn('Value 1: ');
  ReadLn(result);
end;

function TViewCalcSimulator.GetValueTwo: Integer;
begin
  WriteLn('Value 2: ');
  ReadLn(result);
end;

procedure TViewCalcSimulator.SetResult(AValue: Integer);
begin
  WriteLn(AValue);
end;

end.
