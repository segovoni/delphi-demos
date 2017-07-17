unit UBancomat;

interface

uses
  UBanconote;

type

  /// <summary>
  ///   Classe che gestisce l'ATM ovvero il contesto in cui vengono generate le
  ///   richieste
  /// </summary>
  TSuperATM = class
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

constructor TSuperATM.Create;
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

function TSuperATM.Preleva: string;
begin
  Result := F100.HandleRequest(FImportoDaPrelevare);
  if CompareText(Copy(Result, Length(Result) - 1, 2), ', ') = 0 then
    Delete(Result, Length(Result) - 1, 2);
end;

end.
