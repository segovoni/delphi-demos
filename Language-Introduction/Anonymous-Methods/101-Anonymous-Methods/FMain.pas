unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  /// <summary>
  ///   Pointer to a global function type
  /// </summary>
  TStringFunction = function (const AValue: string): string;

  /// <summary>
  ///   Pointer to a global method type
  /// </summary>
  TStringMethod = function (const AValue: string): string of object;

  /// <summary>
  ///   Pointer to a global anonymous method type
  /// </summary>
  TStringAnonymous = reference to function (const AValue: string): string;

  TfrmMain = class(TForm)
  published
    lbledtInputString: TLabeledEdit;
    btnScramble: TButton;
    lbledtOutputString: TLabeledEdit;
    btnDuplicate: TButton;
    btnScrableAndDuplicate: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnScrambleClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnScrableAndDuplicateClick(Sender: TObject);
  private
    FStringScrambler: TStringFunction;
    FStringDuplicator: TStringMethod;
    FStringAnonymous: TStringAnonymous;
    function StringDuplicate(const AValue: string): string;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  System.StrUtils;

//type
//  TStringScramblerAddress = class
//  public
//    class function StringScrambler(const AValue: string): string;
//  end;

{$R *.dfm}

{ TStringScramblerAddress }

function StringScrambler(const AValue: string): string;
begin
  // "abcd" --> "dbca"
  if (Length(AValue) > 2) then
    Result := RightStr(AValue, 1) + Copy(AValue, 2, Length(AValue)-2) + LeftStr(AValue, 1)
  else if (Length(AValue) = 2) then
    Result := ReverseString(AValue)
  else
    Result := AValue;
end;

procedure TfrmMain.btnDuplicateClick(Sender: TObject);
begin
  lbledtOutputString.Text := FStringDuplicator(lbledtInputString.Text);
end;

procedure TfrmMain.btnScrableAndDuplicateClick(Sender: TObject);
begin
  lbledtOutputString.Text := FStringAnonymous(lbledtInputString.Text);
end;

procedure TfrmMain.btnScrambleClick(Sender: TObject);
begin
  lbledtOutputString.Text := FStringScrambler(lbledtInputString.Text);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FStringScrambler := @StringScrambler;
  FStringDuplicator := StringDuplicate;

  FStringAnonymous := function (const AValue: string): string
    begin
      // "abcd" --> "dbca dbca"
      Result := StringDuplicate(StringScrambler(AValue));
    end;
end;

function TfrmMain.StringDuplicate(const AValue: string): string;
begin
  Result := AValue + ' ' + AValue;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

finalization

end.
