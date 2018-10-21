unit FlyBehavior.Classes;

interface

uses
  FlyBehavior.Interfaces;

type
  TFlyWithWings = class(TInterfacedObject, IFlyBehavior)
  private
    FPosition: Integer;
  public
    constructor Create;
    procedure Fly;
    property Position: Integer read FPosition;
  end;

  TFlyNoWayAtAll = class(TInterfacedObject, IFlyBehavior)
  public
    procedure Fly;
  end;

implementation

uses
  System.SysUtils, Vcl.Forms;

{ TFlyWithWings }

constructor TFlyWithWings.Create;
begin
  FPosition := 0;
end;

procedure TFlyWithWings.Fly;
begin
  Inc(FPosition);
  Application.MessageBox(PChar('I''m flying.. I''m here: ' + FPosition.ToString), PChar('FlyBehavior'));
end;

{ TFlyNoWayAtAll }

procedure TFlyNoWayAtAll.Fly;
begin
  Application.MessageBox(PChar('I can not fly - Sorry!'), PChar('FlyBehavior'));
end;

end.
