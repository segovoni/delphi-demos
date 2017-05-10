program WordOccurenceCalculator;

uses
  Vcl.Forms,
  WordCalculatorView in 'Views\WordCalculatorView.pas' {frmWordCalculator},
  WordCalculatorViewIntf in 'Views\WordCalculatorViewIntf.pas',
  WordCalculatorPresenter in 'Presenters\WordCalculatorPresenter.pas',
  WordCalculatorPresenterIntf in 'Presenters\WordCalculatorPresenterIntf.pas',
  WordCalculatorService in 'Services\WordCalculatorService.pas',
  WordCalculatorServiceIntf in 'Services\WordCalculatorServiceIntf.pas',
  WordCalculatorTypes in 'Types\WordCalculatorTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmWordCalculator, frmWordCalculator);
  Application.Run;
end.
