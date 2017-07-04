unit AutoFactoryU;

interface

uses
  System.Generics.Collections, System.SysUtils, CarU, CarIntf;

type

  TAutoFactory = class(TInterfacedObject)
  private
    FAutos: TDictionary<string, TCar>;
  protected
    procedure LoadTypesICanReturn();
  public
    constructor Create();
    function CreateInstance(ACar: string): ICar;
  end;

implementation

{ TAutoFactory }

constructor TAutoFactory.Create;
begin
  LoadTypesICanReturn;
end;

function TAutoFactory.CreateInstance(ACar: string): ICar;
var
  LCar: string;
begin
  Result := nil;

  for LCar in FAutos.Keys do
  begin
    if (CompareText(LCar, ACar) = 0) then
    begin
      Result := FAutos.Items[LCar];
      exit;
    end;
  end;

  if (not Assigned(Result)) then
  begin
    WriteLn(ACar + ' is not available today! Sorry!');
    WriteLn('We have created a replacement car for you..');
    Result := FAutos.Items['ReplacementCar'];
  end;
end;

procedure TAutoFactory.LoadTypesICanReturn;
begin
  FAutos := TDictionary<string, TCar>.Create();
  FAutos.Add('BMW', TBMW.Create);
  FAutos.Add('MINI', TMini.Create);
  FAutos.Add('FIAT', TFIAT.Create);
  FAutos.Add('ReplacementCar', TReplacementCar.Create);
end;

end.
