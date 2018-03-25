unit WordCalculatorView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  WordCalculatorViewIntf, WordCalculatorPresenter, WordCalculatorPresenterIntf, WordCalculatorTypes,
  Data.DB, Data.Win.ADODB;

type
  TfrmWordCalculator = class(TForm, IViewWordCalculator)
    lbledtResourcePath: TLabeledEdit;
    btnOpenResource: TButton;
    memResourceContent: TMemo;
    btnWordCalculator: TButton;
    edtResult: TEdit;
    rgSources: TRadioGroup;
    OpenDialog: TOpenDialog;
    lbledtWordToSearch: TLabeledEdit;
    procedure btnOpenResourceClick(Sender: TObject);
    procedure btnWordCalculatorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPresenterWordCalculator: IPresenterWordCalculator;
  public
    // Input
    function GetResourcePath: string;
    function GetResourceType: Integer;
    function GetWordToSearch: string;
    // Output
    procedure ClearResourceContent;
    procedure SetResourceContent(AValue: TStrings);
    procedure SetResult(const AValue: string);
    procedure DisplayMessage(const AValue: string);
    // Questions to the operator
    function AskForConfirmation(const AValue: string): TModalResult;

    procedure PerformCalculation;
  end;

var
  frmWordCalculator: TfrmWordCalculator;

implementation

const
  APPTITLE = 'Word Occurence Calculator';

{$R *.dfm}

{ TfrmWordCalculator }

function TfrmWordCalculator.AskForConfirmation(const AValue: string): TModalResult;
begin
  result := Application.MessageBox(PChar(AValue), PChar(APPTITLE), MB_YESNO);
end;

procedure TfrmWordCalculator.btnWordCalculatorClick(Sender: TObject);
begin
  FPresenterWordCalculator.PerformCalculation
end;

procedure TfrmWordCalculator.btnOpenResourceClick(Sender: TObject);
begin
  if rgSources.ItemIndex = 0 then
  begin
    OpenDialog.Filter := 'Unit Delphi (*.pas; *.dfm)|*.pas; *.dfm';
    OpenDialog.FilterIndex := 2;
    if OpenDialog.Execute then
      lbledtResourcePath.Text := OpenDialog.FileName;
  end
  else begin
    lbledtResourcePath.Text := 'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=<user_name>;Password=<Password>;Initial Catalog=<database_name>;Data Source=<server_name>;Initial File Name="";Server SPN=""';
  end;
end;

procedure TfrmWordCalculator.ClearResourceContent;
begin
  memResourceContent.Lines.Clear;
end;

procedure TfrmWordCalculator.DisplayMessage(const AValue: string);
begin
  Application.MessageBox(PChar(AValue), PChar(APPTITLE), MB_OK);
end;

procedure TfrmWordCalculator.FormCreate(Sender: TObject);
begin
  FPresenterWordCalculator := TPresenterWordCalculator.Create(Self);
end;

function TfrmWordCalculator.GetResourcePath: string;
begin
  Result := lbledtResourcePath.Text;
end;

function TfrmWordCalculator.GetResourceType: Integer;
begin
  Result := rgSources.ItemIndex;
end;

function TfrmWordCalculator.GetWordToSearch: string;
begin
  Result := lbledtWordToSearch.Text;
end;

procedure TfrmWordCalculator.PerformCalculation;
begin
  FPresenterWordCalculator.PerformCalculation;
end;

procedure TfrmWordCalculator.SetResourceContent(AValue: TStrings);
begin
  memResourceContent.Lines := AValue;
end;

procedure TfrmWordCalculator.SetResult(const AValue: string);
begin
  edtResult.Text := AValue;
end;

end.
