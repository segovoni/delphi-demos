unit FFlyBehavior;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmFlyBehavior = class(TForm)
    btnFlyInterface: TButton;
    btnFlyClass: TButton;
    btnNoFly: TButton;
    procedure btnFlyInterfaceClick(Sender: TObject);
    procedure btnFlyClassClick(Sender: TObject);
    procedure btnNoFlyClick(Sender: TObject);
  private
  public
  end;

var
  frmFlyBehavior: TfrmFlyBehavior;

implementation

uses
  FlyBehavior.Interfaces, FlyBehavior.Classes;

{$R *.dfm}

procedure TfrmFlyBehavior.btnFlyClassClick(Sender: TObject);
var
  LFlyWithWings: TFlyWithWings;
begin
  LFlyWithWings := TFlyWithWings.Create;
  try
    LFlyWithWings.Fly;
  finally
    LFlyWithWings.Free
  end;
end;

procedure TfrmFlyBehavior.btnFlyInterfaceClick(Sender: TObject);
var
  LFly: IFlyBehavior;
begin
  LFly := TFlyWithWings.Create;
  LFly.Fly;
end;

procedure TfrmFlyBehavior.btnNoFlyClick(Sender: TObject);
var
  LFly: IFlyBehavior;
begin
  LFly := TFlyNoWayAtAll.Create;
  LFly.Fly;
end;

end.
