library ISAPISampleWebCalculator;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  WebModuleU in 'WebModules\WebModuleU.pas' {WebModule1: TWebModule},
  WebCalculator.Classes in 'WebModules\WebCalculator.Classes.pas' {WebCalculator: TWebModule},
  WebCalculator.Controllers in 'WebModules\WebCalculator.Controllers.pas',
  WebCalculator.OperationLogic in 'WebModules\WebCalculator.OperationLogic.pas';

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.
