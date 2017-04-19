unit PCalc;

interface

uses
  ICalc;

type
  /// <summary>
  ///   This class implements the Presenter in the Model View Presenter design
  ///   pattern.
  /// </summary>
  /// <remarks>
  ///   In the Model View Presenter design pattern, the Presenter is used to
  ///   manage and communicate with the View, retrieve values, set results. The
  ///   Presenter contains the business logic.
  /// </remarks>
  TCalcPresenter = class
  protected
    FCalcView: ICalcView;
  public
    constructor Create(ACalcView: ICalcView);
    procedure PerformOperation;
  end;

implementation

uses
  System.SysUtils;

{ TCalcPresenter }

constructor TCalcPresenter.Create(ACalcView: ICalcView);
begin
  FCalcView := ACalcView;
end;

procedure TCalcPresenter.PerformOperation;
var
  LValore1, LValore2: Integer;
  LOperazione: string;
begin
  LOperazione := Trim(FCalcView.GetOperator);
  LValore1 := FCalcView.GetValueOne;
  LValore2 := FCalcView.GetValueTwo;

  if FCalcView.AskConfirmation('Do you want to proceed with the complex operation : ' +
                               LOperazione +
                               ' between ' +
                               IntToStr(LValore1) + ' e ' +
                               IntToStr(LValore2) + ' ?') then
  begin
    case LOperazione[1] of
      '+': FCalcView.SetResult(LValore1 + LValore2);
      '-': FCalcView.SetResult(LValore1 - LValore2);
    else
      FCalcView.DisplayMessage('Operation not supported!');
    end;
  end
  else
    FCalcView.DisplayMessage('The operation has been canceled!');
end;

end.
