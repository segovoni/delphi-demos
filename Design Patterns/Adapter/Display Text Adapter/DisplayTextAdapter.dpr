program DisplayTextAdapter;

uses
  Vcl.Forms,
  ComponentAdaptersU in 'ComponentAdapters\ComponentAdaptersU.pas',
  ComponentAdaptersIntf in 'ComponentAdapters\ComponentAdaptersIntf.pas',
  FAdapter in 'View\FAdapter.pas' {frmAdapter};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAdapter, frmAdapter);
  Application.Run;
end.
