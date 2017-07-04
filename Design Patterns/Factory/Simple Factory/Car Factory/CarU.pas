unit CarU;

interface

uses
  CarIntf;

type

  TCar = class(TInterfacedObject, ICar)
  public
    procedure TurnOn; virtual; abstract;
    procedure TurnOff; virtual; abstract;
  end;

  TBMW = class(TCar, ICar)
  public
    procedure TurnOn; override;
    procedure TurnOff; override;
  end;

  TMini = class(TCar, ICar)
  public
    procedure TurnOn; override;
    procedure TurnOff; override;
  end;

  TFIAT = class(TCar, ICar)
  public
    procedure TurnOn; override;
    procedure TurnOff; override;
  end;

  TReplacementCar = class(TCar, ICar)
  public
    procedure TurnOn; override;
    procedure TurnOff; override;
  end;

implementation

{ TBMW }

procedure TBMW.TurnOff;
begin
  WriteLn('BMW is turned off!');
end;

procedure TBMW.TurnOn;
begin
  WriteLn('BMW X1 is turned on and running!');
  WriteLn('go go go!');
end;

{ TMini }

procedure TMini.TurnOff;
begin
  WriteLn('Mini Cooper S is turned off!');
end;

procedure TMini.TurnOn;
begin
  WriteLn('Mini Cooper S is turned on and running!');
end;

{ TFIAT }

procedure TFIAT.TurnOff;
begin
  WriteLn('FIAT 500L is turned off!');
end;

procedure TFIAT.TurnOn;
begin
  WriteLn('FIAT 500L is turned on and running!');
end;

{ TReplacementCar }

procedure TReplacementCar.TurnOff;
begin
  WriteLn('The replacement car is turned off!');
end;

procedure TReplacementCar.TurnOn;
begin
  WriteLn('The replacement car is turned on and running!');
end;

end.
