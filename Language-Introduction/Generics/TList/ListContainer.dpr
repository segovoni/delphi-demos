program ListContainer;

uses
  Vcl.Forms,
  UListContainer in 'UListContainer.pas' {Form1},
  UTypes in 'UTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
