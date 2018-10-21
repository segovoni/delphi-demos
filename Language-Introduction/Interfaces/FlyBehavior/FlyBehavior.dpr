program FlyBehavior;

uses
  Vcl.Forms,
  FFlyBehavior in 'FFlyBehavior.pas' {frmFlyBehavior},
  FlyBehavior.Interfaces in 'FlyBehavior.Interfaces.pas',
  FlyBehavior.Classes in 'FlyBehavior.Classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFlyBehavior, frmFlyBehavior);
  Application.Run;
end.
