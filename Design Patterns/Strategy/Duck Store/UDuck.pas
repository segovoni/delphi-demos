unit UDuck;

interface

type
  /// <summary>
  ///   This interface defines a Fly procedure that is implemented in a
  ///   different way depending on the implemented class
  /// </summary>
  IFlyBehavior = interface
  ['{9F7396E3-FAC6-4B4D-9586-49617A092058}']
    procedure Fly;
  end;

  TFlyWithWings = class(TInterfacedObject, IFlyBehavior)
  public
    procedure Fly;
  end;

  TFlyNoWayAtAll = class(TInterfacedObject, IFlyBehavior)
  public
    procedure Fly;
  end;

  TFlyRocketPowered = class(TInterfacedObject, IFlyBehavior)
  public
    procedure Fly;
  end;

  /// <summary>
  ///   This interface defines a Quack procedure that is implemented in a
  ///   different way depending on the implemented class
  /// </summary>
  IQuackBehavior = interface
  ['{E733AF66-3172-4302-857F-DFA12FDA71EA}']
    procedure Quack;
  end;

  TQuack = class(TInterfacedObject, IQuackBehavior)
  public
    procedure Quack;
  end;

  TSqueak = class(TInterfacedObject, IQuackBehavior)
  public
    procedure Quack;
  end;

  TMuteQuack = class(TInterfacedObject, IQuackBehavior)
  public
    procedure Quack;
  end;

  /// <summary>
  ///   TDuck class have two instance variables called FFlyBehavior and
  ///   FQuackBehavior, that are declared as the interface type (not a concrete
  ///   class implementation type). Each duck object will set there variables
  ///   polymorphically to reference the specific behavior type.
  /// </summary>
  TDuck = class abstract
  protected
    /// <summary>
    ///   Each Duck has a reference to something that implements the FlyBehavior interface
    /// </summary>
    FFlyBehavior: IFlyBehavior;
    /// <summary>
    ///   Each Duck has a reference to something that implements the QuackBehavior interface
    /// </summary>
    FQuackBehavior: IQuackBehavior;
  public
    procedure PerformQuack;
    procedure Swim;
    procedure Display; virtual; abstract;
    procedure PerformFly;
    procedure SetFlyBehavior(AValue: IFlyBehavior);
    procedure SetQuackBehavior(AValue: IQuackBehavior);
  end;

  /// <summary>
  ///   Mallard duck is a real live duck that quacks and not squeak and it is
  ///   not a mute duck.
  /// </summary>
  TMallardDuck = class(TDuck)
  public
    /// <summary>
    ///   When a MallardDuck is instantiated its contructor initializes the
    ///   MallardDuck's inherited FQuackBehavior instance variable to a new
    ///   instance of type Quack (a Quack Behavior concrete implementation
    ///   class). The same is true for the Flying Behavior.
    /// </summary>
    constructor Create;
    procedure Display; override;
  end;

  TModelDuck = class(TDuck)
  public
    constructor Create;
    procedure Display; override;
  end;

implementation

{ TMuteQuack }

procedure TMuteQuack.Quack;
begin
  WriteLn('Sorry, I''m a mute Quack :(');
end;

{ TFlyWithWings }

procedure TFlyWithWings.Fly;
begin
  WriteLn('I''m flying');
end;

{ TFlyNoWayAtAll }

procedure TFlyNoWayAtAll.Fly;
begin
  WriteLn('Sorry, I can not fly :(');
end;

{ TQuack }

procedure TQuack.Quack;
begin
  WriteLn('Quack quack quack.. quack..');
end;

{ TSqueak }

procedure TSqueak.Quack;
begin
  WriteLn('Squeak squeak squeak.. squeak squeak');
end;

{ TDuck }

procedure TDuck.PerformFly;
begin
  FFlyBehavior.Fly;
end;

procedure TDuck.PerformQuack;
begin
  FQuackBehavior.Quack;
end;

procedure TDuck.SetFlyBehavior(AValue: IFlyBehavior);
begin
  FFlyBehavior := AValue;
end;

procedure TDuck.SetQuackBehavior(AValue: IQuackBehavior);
begin
  FQuackBehavior := AValue;
end;

procedure TDuck.Swim;
begin
  WriteLn('All duck float');
end;

{ TMallardDuck }

constructor TMallardDuck.Create;
begin
  FQuackBehavior := TQuack.Create;
  FFlyBehavior := TFlyWithWings.Create;
end;

procedure TMallardDuck.Display;
begin
  WriteLn('I''m a real Mallard Duck!!');
end;

{ TModelDuck }

constructor TModelDuck.Create;
begin
  FFlyBehavior := TFlyNoWayAtAll.Create;
  FQuackBehavior := TQuack.Create;
end;

procedure TModelDuck.Display;
begin
  WriteLn('I''m a Model Duck!');
end;

{ TFlyRocketPowered }

procedure TFlyRocketPowered.Fly;
begin
  WriteLn('I''m fly with Rocket!!');
end;

end.
