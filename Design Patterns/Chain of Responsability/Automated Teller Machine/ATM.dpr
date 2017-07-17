program ATM;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UATM in 'Source\UATM.pas';

procedure MainATM;
var
  LATM: TATM;
  LImporto, LBanconote: string;
begin
  WriteLn('Digita l''importo che vuoi prelevare:');
  ReadLn(LImporto);

  LATM := TATM.Create;

  try
    LATM.ImportoDaPrelevare := LImporto.ToInteger;
    LBanconote := LATM.Preleva;
  finally
    LATM.Free;
  end;

  if (LBanconote <> '') then
    WriteLn('Banconote erogate... ' + LBanconote)
  else
    WriteLn('Nessuna banconota erogata!!');
end;

begin
  try
    while True do
      MainATM
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
