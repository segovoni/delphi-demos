program SampleCalculatorConsole;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  PCalc in 'Presenters\PCalc.pas',
  ICalc in 'Views\ICalc.pas',
  UCalc in 'Views\UCalc.pas';

var
  LViewCalcSimulator: TViewCalcSimulator;

begin
  LViewCalcSimulator := TViewCalcSimulator.Create(nil);
  try
    try

      while True do
      begin
        LViewCalcSimulator.PerformOperation;
        WriteLn('================================');
        ReadLn;
      end;

    except
      on E: Exception do begin
        Writeln(E.ClassName, ': ', E.Message);
      end;
    end;
  finally
    LViewCalcSimulator.Free;
  end;

end.
