/// <summary>
///   Questo è un esempio del Design Pattern Comportamentale noto con il nome
///   di Chain of Responsability
/// </summary>
/// <remarks>
///   <b>Quando viene utilizzato</b>Viene utilizzato quando non conosciamo
///   quale oggetto può gestire la richiesta, specialmente a run-time. Viene
///   utilizzato quando serve implementare un meccanismo che ti risponda a
///   scalare. Implementa un processo decisionale in cui i decisori sono noti a
///   run-time.<br /><b>Come viene implementato</b><br />Ci sono degli elementi
///   che processano l'item, il numero e il tipo dei processi non è conosciuto
///   a monte, il Processing Element può essere lui stesso oppure una catena. <br />
///   Questo Design Pattern è molto simile ad una lista di Command, a
///   differenza, il pattern Chain of Responsability ha come scopo quello di
///   sapere se c'è qualcuno che si applica per soddisfare la richiesta. Deve
///   essere implementato il concetto di catena. <br /><br />Costruisco la
///   catena, la gestione della richiesta verrà fatta dalla catena, non
///   sappiamo chi risponderà alla richiesta. Ogni elemento della catena tranne
///   l'ultimo definisce il suo successore.
/// </remarks>
/// <seealso cref="Design Pattern">
///   Command
/// </seealso>
unit UATM;

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

  /// <summary>
  ///   Classe che gestisce l'ATM ovvero il contesto in cui vengono generate le
  ///   richieste
  /// </summary>
  TATM = class
  protected
    FImportoDaPrelevare: Integer;
  private
    F100: THandlerCento;
    F50: THandlerCinquanta;
    F20: THandlerVenti;
    F10: THandlerDieci;
    F5: THandlerCinque;
  public
    constructor Create;
    property ImportoDaPrelevare: Integer read FImportoDaPrelevare write FImportoDaPrelevare;
    function Preleva: string;
  end;

implementation

uses
  System.SysUtils;


{ TATM }

constructor TATM.Create;
begin
  F100 := THandlerCento.Create;
  F50 := THandlerCinquanta.Create;
  F20 := THandlerVenti.Create;
  F10 := THandlerDieci.Create;
  F5 := THandlerCinque.Create;

  // Build the chain
  F100.Successor := F50;
  F50.Successor := F20;
  F20.Successor := F10;
  F10.Successor := F5;
  F5.Successor := nil;
end;

function TATM.Preleva: string;
begin
  Result := F100.HandleRequest(FImportoDaPrelevare);
  if CompareText(Copy(Result, Length(Result) - 1, 2), ', ') = 0 then
    Delete(Result, Length(Result) - 1, 2);
end;

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
