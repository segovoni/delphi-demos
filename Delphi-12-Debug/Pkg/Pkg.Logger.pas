unit Pkg.Logger;

interface

uses
  System.IOUtils;

type
  TSampleLog = class(TObject)
  public
    procedure Log;
  end;

implementation

uses
  System.SysUtils;

{ TSampleLog }

procedure TSampleLog.Log;
begin
  TFile.AppendAllText('AppLog.log', FormatDateTime('c t', Now));
end;

end.
