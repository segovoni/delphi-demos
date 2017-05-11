program WordOccurenceCalculator_Test_VCL;

uses
  Vcl.Forms,
  TestFramework,
  GUITestRunner,
  WordCalculatorPresenter in 'Presenters\WordCalculatorPresenter.pas',
  WordCalculatorPresenterIntf in 'Presenters\WordCalculatorPresenterIntf.pas',
  WordCalculatorService in 'Services\WordCalculatorService.pas',
  WordCalculatorServiceIntf in 'Services\WordCalculatorServiceIntf.pas',
  WordCalculatorTypes in 'Types\WordCalculatorTypes.pas',
  WordCalculatorView in 'Views\WordCalculatorView.pas' {frmWordCalculator},
  WordCalculatorViewIntf in 'Views\WordCalculatorViewIntf.pas',
  WordOccurenceCalculator_TestCases in 'UnitTest\WordOccurenceCalculator_TestCases.pas';

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  //Application.CreateForm(TForm1, Form1);
  //Application.Run;
  GUITestRunner.RunRegisteredTests;
end.
