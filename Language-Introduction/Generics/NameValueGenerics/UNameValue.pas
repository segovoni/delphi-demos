unit UNameValue;

interface

type
  TNameValue<T> = class
  private
    FName: string;
    FData: T;
    function GetName: string;
    procedure SetName(const Value: string);
    function GetValue: T;
    procedure SetValue(const Value: T);
  public
    property Name: string read GetName write SetName;
    property Value: T read GetValue write SetValue;
  end;

implementation

{ TNameValue<T> }

function TNameValue<T>.GetName: string;
begin
  result := FName;
end;

function TNameValue<T>.GetValue: T;
begin
  result := FData;
end;

procedure TNameValue<T>.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TNameValue<T>.SetValue(const Value: T);
begin
  FData := Value;
end;

end.
