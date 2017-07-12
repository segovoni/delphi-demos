program ATM_VCL;

uses
  Vcl.Forms,
  FMain in 'Source\FMain.pas' {frmATM};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmATM, frmATM);
  Application.Run;
end.
