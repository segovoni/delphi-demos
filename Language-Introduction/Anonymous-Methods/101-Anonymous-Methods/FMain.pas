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
  /// <remarks>
  ///   The anonymous method can extract knowledge from the assignment, see the
  ///   conditional directive "ANONYMOUS_METHOD_CAN_EXTRACT_KNOWLEDGE"
  /// </remarks>
  TStringAnonymousMethod = reference to function (const AValue: string): string;

  TfrmMain = class(TForm)
    btnScrableAndDuplicateV2: TButton;
    procedure btnScrableAndDuplicateV2Click(Sender: TObject);
  published
    lbledtInputString: TLabeledEdit;
    btnScramble: TButton;
    lbledtOutputString: TLabeledEdit;
    btnDuplicate: TButton;
    btnScrableAndDuplicate: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnScrambleClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnScrambleAndDuplicateClick(Sender: TObject);
  private
    FStringScrambler: TStringFunction;
    FStringDuplicator: TStringMethod;
    FStringAnonymousMethod: TStringAnonymousMethod;
    function StringDuplicate(const AValue: string): string;
    procedure ScrambleAndDuplicate(AAnonymousMethod: TStringAnonymousMethod);
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

procedure TfrmMain.btnScrableAndDuplicateV2Click(Sender: TObject);
begin
  ScrambleAndDuplicate(function (const AValue: string): string
    begin
      // "abcd" --> "dbca dbca"
      Result := ReverseString(AValue);
    end);
end;

procedure TfrmMain.btnScrambleAndDuplicateClick(Sender: TObject);
begin
  lbledtOutputString.Text := FStringAnonymousMethod(lbledtInputString.Text);
end;

procedure TfrmMain.btnScrambleClick(Sender: TObject);
begin
  lbledtOutputString.Text := FStringScrambler(lbledtInputString.Text);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
{$IFDEF ANONYMOUS_METHOD_CAN_EXTRACT_KNOWLEDGE}
var
  LSeparator: string;
{$ENDIF}
begin
  FStringScrambler := @StringScrambler;
  FStringDuplicator := StringDuplicate;

  {$IFDEF ANONYMOUS_METHOD_CAN_EXTRACT_KNOWLEDGE}
  LSeparator := '';
  {$ENDIF}

  // The anonymous method can extract knowledge from the assignment
  FStringAnonymousMethod := function (const AValue: string): string
    begin
      // "abcd" --> "dbca dbca"
      {$IFDEF ANONYMOUS_METHOD_CAN_EXTRACT_KNOWLEDGE}
      LSeparator := LSeparator + '|';
      Result := StringDuplicate(StringScrambler(AValue + LSeparator));
      {$ELSE}
      Result := StringDuplicate(StringScrambler(AValue));
      {$ENDIF}
    end;
end;

procedure TfrmMain.ScrambleAndDuplicate(AAnonymousMethod: TStringAnonymousMethod);
var
  LTmp: string;
begin
  LTmp := 'I''m an Anonymous Method!';
  lbledtOutputString.Text := AAnonymousMethod(LTmp);
end;

function TfrmMain.StringDuplicate(const AValue: string): string;
begin
  Result := AValue + ' ' + AValue;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

finalization

end.
