program Command;

uses
  Vcl.Forms,
  Command.Form in 'Command.Form.pas' {Form2},
  Command.Classes in 'Command.Classes.pas',
  Executor.Classes in 'Executor.Classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
