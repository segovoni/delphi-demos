program App;

uses
  Vcl.Forms,
  App.View.Main in 'App.View.Main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
