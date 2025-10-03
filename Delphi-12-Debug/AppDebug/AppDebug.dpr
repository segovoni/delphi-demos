program AppDebug;

uses
  Vcl.Forms,
  AppDebug.View.Main in 'AppDebug.View.Main.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
