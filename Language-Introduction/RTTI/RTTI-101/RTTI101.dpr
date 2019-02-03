program RTTI101;

uses
  Vcl.Forms,
  FMain in 'FMain.pas' {frmRTTI101};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRTTI101, frmRTTI101);
  Application.Run;
end.
