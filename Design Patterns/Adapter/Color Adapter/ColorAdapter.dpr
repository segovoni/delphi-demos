program ColorAdapter;

uses
  Vcl.Forms,
  ColorAdapterView in 'View\ColorAdapterView.pas' {frmColoring},
  ComponentAdaptersU in 'ComponentAdapters\ComponentAdaptersU.pas',
  ComponentAdaptersIntf in 'ComponentAdapters\ComponentAdaptersIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmColoring, frmColoring);
  Application.Run;
end.
