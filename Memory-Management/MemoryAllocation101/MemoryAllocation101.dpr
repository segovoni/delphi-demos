program MemoryAllocation101;

uses
  Vcl.Forms,
  FMemoryAllocation in 'FMemoryAllocation.pas' {frmMemoryAllocation};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMemoryAllocation, frmMemoryAllocation);
  Application.Run;
end.
