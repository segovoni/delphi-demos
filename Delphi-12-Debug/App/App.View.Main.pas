unit App.View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnLog: TButton;
    procedure btnLogClick(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

uses
  Pkg.Logger;

{$R *.dfm}

procedure TForm1.btnLogClick(Sender: TObject);
begin
  var LLoger := TSampleLog.Create;
  try
    LLoger.Log;
  finally
    LLoger.Free;
  end;
end;

end.
