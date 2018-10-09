program NameValueGenerics;

uses
  Vcl.Forms,
  FNameValue in 'FNameValue.pas' {frmNameValueGenerics},
  UNameValue in 'UNameValue.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmNameValueGenerics, frmNameValueGenerics);
  Application.Run;
end.
