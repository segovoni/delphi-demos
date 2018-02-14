unit Command.Classes;

interface

type
  TCommand = class abstract
  public
    function Execute(const AValue: string): string; virtual; abstract;
  end;

  TFrom5To10CharsCommand = class(TCommand)
  public
    function Execute(const AValue: string): string; override;
  end;

  TTrimLeftCommand = class(TCommand)
  public
    function Execute(const AValue: string): string; override;
  end;

  TUpperCaseCommand = class(TCommand)
  public
    function Execute(const AValue: string): string; override;
  end;

implementation

uses
  System.SysUtils;

{ TFrom5To7CharsCommand }

function TFrom5To10CharsCommand.Execute(const AValue: string): string;
begin
  if (Length(AValue) >= 7) then
    Result := Copy(AValue, 5, 5);
end;

{ TTrimCommand }

function TTrimLeftCommand.Execute(const AValue: string): string;
begin
  Result := AValue.TrimLeft;
end;

{ TUpperCaseCommand }

function TUpperCaseCommand.Execute(const AValue: string): string;
begin
  Result := UpperCase(AValue);
end;

end.
