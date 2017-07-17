unit UBanconote;

interface

type
  /// <summary>
  ///   Classe astratta da cui derivare le classi specifiche che implementano
  ///   gli anelli della catena
  /// </summary>
  THandler = class abstract
  public
    function HandleRequest(const AValue: Integer): string; virtual; abstract;
  end;

  /// <summary>
  ///   Classe che gestisce le banconote da 100 Euro
  /// </summary>
  THandlerCento = class(THandler)
  private
    FHandler: THandler;
  public
    property Successor: THandler read FHandler write FHandler;
    function HandleRequest(const AValue: Integer): string; override;
  end;

  /// <summary>
  ///   Classe che gestisce le banconote da 50 Euro
  /// </summary>
  THandlerCinquanta = class(THandler)
  private
    FHandler: THandler;
  public
    property Successor: THandler read FHandler write FHandler;
    function HandleRequest(const AValue: Integer): string; override;
  end;

  /// <summary>
  ///   Classe che gestisce le banconote da 20 Euro
  /// </summary>
  THandlerVenti = class(THandler)
  protected
    FHandler: THandler;
  public
    property Successor: THandler read FHandler write FHandler;
    function HandleRequest(const AValue: Integer): string; override;
  end;

  /// <summary>
  ///   Classe che gestisce le banconote da 10 Euro
  /// </summary>
  THandlerDieci = class(THandler)
  protected
    FHandler: THandler;
  public
    property Successor: THandler read FHandler write FHandler;
    function HandleRequest(const AValue: Integer): string; override;
  end;

  /// <summary>
  ///   Classe che gestisce le banconote da 5 Euro
  /// </summary>
  THandlerCinque = class(THandler)
  protected
    FHandler: THandler;
  public
    property Successor: THandler read FHandler write FHandler;
    function HandleRequest(const AValue: Integer): string; override;
  end;

implementation

uses
  System.SysUtils;

{ THandlerCento }

function THandlerCento.HandleRequest(const AValue: Integer): string;
begin
  if (AValue >= 100) then
    result := '100, ' + {?? FHandler.}HandleRequest(AValue - 100)
  else
    if Assigned(Successor) then
      result := Successor.HandleRequest(AValue);
end;

{ THandlerCinquanta }

function THandlerCinquanta.HandleRequest(const AValue: Integer): string;
var
  LValue: Integer;
begin
  LValue := AValue;

  if (LValue >= 50) then
  begin
    result := '50, ' + HandleRequest(LValue - 50);
  end
  else
    if Assigned(Successor) then
      result := Successor.HandleRequest(AValue);
end;

{ THandlerVenti }

function THandlerVenti.HandleRequest(const AValue: Integer): string;
var
  LValue: Integer;
begin
  LValue := AValue;

  if (LValue >= 20) then
    result := '20, ' + HandleRequest(LValue - 20)
  else
    if Assigned(Successor) then
      result := Successor.HandleRequest(AValue);
end;

{ THandlerDieci }

function THandlerDieci.HandleRequest(const AValue: Integer): string;
var
  LValue: Integer;
begin
  LValue := AValue;

  if (LValue >= 10) then
    result := '10, ' + HandleRequest(LValue - 10)
  else
    if Assigned(Successor) then
      result := Successor.HandleRequest(AValue);
end;

{ THandlerCinque }

function THandlerCinque.HandleRequest(const AValue: Integer): string;
var
  LValue: Integer;
begin
  LValue := AValue;

  if (LValue >= 5) then
    result := '5, ' + HandleRequest(LValue - 5)
  else
    if Assigned(Successor) then
      result := Successor.HandleRequest(AValue);
end;

end.
