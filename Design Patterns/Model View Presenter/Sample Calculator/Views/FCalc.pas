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
    btnPerformOperation1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPerformOperationClick(Sender: TObject);
    procedure btnPerformOperation1Click(Sender: TObject);
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

procedure TFCalculator.FormDestroy(Sender: TObject);
begin
  FCalcPresenter.Free;
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

procedure TFCalculator.btnPerformOperation1Click(Sender: TObject);
begin
  if Application.MessageBox(PChar('Do you want to proceed with the complex operation: ' +
                            ComboBox1.Text +
                            ' between ' +
                            lbledtValue1.Text + ' e ' +
                            lbledtValue2.Text + ' ?'), PChar(Self.Caption), MB_YESNO) = IDYES then
  begin
    if (ComboBox1.Text = '+') then
      lbledtResult.Text :=
        IntToStr(StrToInt(lbledtValue1.Text) + StrToInt(lbledtValue2.Text))
    else
      lbledtResult.Text :=
        IntToStr(StrToInt(lbledtValue1.Text) - StrToInt(lbledtValue2.Text));
  end;
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
