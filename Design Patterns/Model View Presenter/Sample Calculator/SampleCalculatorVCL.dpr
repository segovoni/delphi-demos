program SampleCalculatorVCL;

uses
  Vcl.Forms,
  PCalc in 'Presenters\PCalc.pas',
  FCalc in 'Views\FCalc.pas' {FCalculator},
  ICalc in 'Views\ICalc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFCalculator, FCalculator);
  Application.Run;
end.
