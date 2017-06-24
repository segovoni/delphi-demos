/// <summary>
///   <b>Strategy</b> Pattern defines a family of algorithms, encapsulates each
///   one, and makes them interchangeable. Strategy lets the algorithm vary
///   independently from clients that use it.
/// </summary>
/// <remarks>
///   <para>
///     Design Principle: Favor composition over inheritance. Considering the
///     TDuck class with the two interfaces FlyBehavior and QuackBehavior,
///     when you put two classes together like this you are using <b>
///     composition</b>. Instead of inheriting their behavior, the ducks
///     class get their behavior by being composed with the right behavior
///     object.
///   </para>
///   <para>
///     Creating system using composition gives you a lot more flexibility.
///     Not only does it let you encapsulate a family of algorithms into
///     their own set of classes, bit it also let you <b>change behavior at
///     runtime</b> as long as the object you are composing with implements
///     the correct behavior interface.
///   </para>
/// </remarks>
program DuckStore;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UDuck in 'UDuck.pas';

var
  LMallardDuck: TMallardDuck;
  LModelDuck: TModelDuck;

begin
  try
    LMallardDuck := TMallardDuck.Create;
    LMallardDuck.PerformQuack;
    LMallardDuck.PerformFly;
    WriteLn('===========================================');

    LModelDuck := TModelDuck.Create;
    LModelDuck.PerformQuack;
    LModelDuck.PerformFly;
    LModelDuck.SetFlyBehavior(TFlyRocketPowered.Create);
    LModelDuck.PerformFly;
    WriteLn('===========================================');


    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
