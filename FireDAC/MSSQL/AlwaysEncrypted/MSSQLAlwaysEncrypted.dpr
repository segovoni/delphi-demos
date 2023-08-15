program MSSQLAlwaysEncrypted;

uses
  Vcl.Forms,
  MSSQLAlwaysEncrypted.FMain in 'Sources\Views\MSSQLAlwaysEncrypted.FMain.pas' {frmAlwaysEncryptedMain},
  MSSQLAlwaysEncrypted.Interfaces in 'Sources\Interfaces\MSSQLAlwaysEncrypted.Interfaces.pas',
  MSSQLAlwaysEncrypted.DataModule in 'Sources\DataModules\MSSQLAlwaysEncrypted.DataModule.pas' {DM: TDataModule},
  MSSQLAlwaysEncrypted.MainPresenter in 'Sources\Presenters\MSSQLAlwaysEncrypted.MainPresenter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAlwaysEncryptedMain, frmAlwaysEncryptedMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
