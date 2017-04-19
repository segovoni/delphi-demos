unit FCalc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  PCalc, ICalc;

type
  TFCalculator = class(TForm, ICalcView)
    lbledtValue1: TLabeledEdit;
    lbledtValue2: TLabeledEdit;
    btnPerformOperation: TButton;
    lbledtResult: TLabeledEdit;
    ComboBox1: TComboBox;
    lblOperation: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnPerformOperationClick(Sender: TObject);
  private
    FCalcPresenter: TCalcPresenter;
  public
    // input (function)
    function GetValueOne: Integer;
    function GetValueTwo: Integer;
    function GetOperator: string;
    // output (procedure)
    procedure SetResult(AValue: Integer);
    procedure DisplayMessage(AValue: string);
    // input/output
    function AskConfirmation(AValue: string): Boolean;
  end;

var
  FCalculator: TFCalculator;

implementation

const
  APPTITLE = 'Model View Presenter - Calculator';

{$R *.dfm}

{ TForm1 }

procedure TFCalculator.FormCreate(Sender: TObject);
begin
  FCalcPresenter := TCalcPresenter.Create(self);
end;

function TFCalculator.GetOperator: string;
begin
  result := ComboBox1.Text;
end;

function TFCalculator.GetValueOne: Integer;
begin
  result := StrToInt(lbledtValue1.Text);
end;

function TFCalculator.GetValueTwo: Integer;
begin
  result := StrToInt(lbledtValue2.Text);
end;

function TFCalculator.AskConfirmation(AValue: string): Boolean;
begin
  result := (Application.MessageBox(PChar(AValue), APPTITLE, MB_YESNO) = IDYES);
end;

procedure TFCalculator.btnPerformOperationClick(Sender: TObject);
begin
  FCalcPresenter.PerformOperation;
end;

procedure TFCalculator.DisplayMessage(AValue: string);
begin
  Application.MessageBox(PChar(AValue), APPTITLE, MB_OK);
end;

procedure TFCalculator.SetResult(AValue: Integer);
begin
  lbledtResult.Text := AValue.ToString;
end;

end.
