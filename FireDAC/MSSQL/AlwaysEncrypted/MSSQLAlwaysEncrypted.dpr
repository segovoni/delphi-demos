program MSSQLAlwaysEncrypted;

uses
  Vcl.Forms,
  MSSQLAlwaysEncrypted.FMain in 'Sources\Views\MSSQLAlwaysEncrypted.FMain.pas' {frmAlwaysEncryptedMain},
  MSSQLAlwaysEncrypted.Interfaces in 'Sources\Interfaces\MSSQLAlwaysEncrypted.Interfaces.pas',
  MSSQLAlwaysEncrypted.DataModule in 'Sources\DataModules\MSSQLAlwaysEncrypted.DataModule.pas' {DM: TDataModule},
  MSSQLAlwaysEncrypted.MainPresenter in 'Sources\Presenters\MSSQLAlwaysEncrypted.MainPresenter.pas',
  MSSQLAlwaysEncrypted.FMainSimplified in 'Sources\Views\MSSQLAlwaysEncrypted.FMainSimplified.pas' {frmAlwaysEncryptedMainSimplified},
  MSSQLAlwaysEncrypted.MainSimplifiedPresenter in 'Sources\Presenters\MSSQLAlwaysEncrypted.MainSimplifiedPresenter.pas',
  MSSQLAlwaysEncrypted.Base.ActiveRecord in 'Sources\Models\MSSQLAlwaysEncrypted.Base.ActiveRecord.pas',
  MSSQLAlwaysEncrypted.Person.ActiveRecord in 'Sources\Models\MSSQLAlwaysEncrypted.Person.ActiveRecord.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAlwaysEncryptedMainSimplified, frmAlwaysEncryptedMainSimplified);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
