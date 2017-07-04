program CarFactoryConsoleApp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  AutoFactoryU in 'AutoFactoryU.pas',
  CarU in 'CarU.pas',
  CarIntf in 'CarIntf.pas';


var
  LCarType: string;
  LCar: ICar;
  LAutoFactory: TAutoFactory;

begin
  LAutoFactory := TAutoFactory.Create;

  try
    try
      while True do
      begin
        WriteLn('Which car do you want today baby?');
        WriteLn('Press "BMW" for a BMW, press "MINI" for a Mini Cooper S, press "FIAT" for a FIAT 500L..');

        Read(LCarType);

        if (CompareText(LCarType, 'q') = 0) then
          exit;

        LCar := LAutoFactory.CreateInstance(LCarType);
        LCar.TurnOn;
        LCar.TurnOff;

        WriteLn('Press "q" to quit..');
        WriteLn('=========================================');
        WriteLn('');
        ReadLn;
      end;

    except on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
    end;

  finally
    LAutoFactory.Free;
  end;

end.
