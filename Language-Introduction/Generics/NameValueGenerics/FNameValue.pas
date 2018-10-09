unit FNameValue;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TfrmNameValueGenerics = class(TForm)
    btnNameValueInteger: TButton;
    btnNameValueEdit: TButton;
    procedure btnNameValueIntegerClick(Sender: TObject);
    procedure btnNameValueEditClick(Sender: TObject);
  private
  public
  end;

var
  frmNameValueGenerics: TfrmNameValueGenerics;

implementation

uses
  UNameValue;

{$R *.dfm}

procedure TfrmNameValueGenerics.btnNameValueEditClick(Sender: TObject);
var
  LNameValueEdit: TNameValue<TEdit>;
begin
  LNameValueEdit := TNameValue<TEdit>.Create;
  try
    LNameValueEdit.Name := 'I''m a TEdit';
    LNameValueEdit.Value := TEdit.Create(nil);

    LNameValueEdit.Value.Visible := False;
    LNameValueEdit.Value.Parent := Self;
    LNameValueEdit.Value.Top := Self.btnNameValueEdit.Top;
    LNameValueEdit.Value.Left := Self.btnNameValueEdit.Left + Self.btnNameValueEdit.Width + 10;
    LNameValueEdit.Value.Width := Self.btnNameValueEdit.Width;
    LNameValueEdit.Value.Height := Self.btnNameValueEdit.Height;
    LNameValueEdit.Value.Font := Self.btnNameValueEdit.Font;
    LNameValueEdit.Value.Text := LNameValueEdit.Name;
    LNameValueEdit.Value.Visible := True;
  finally
    LNameValueEdit.Free;
  end;

end;

procedure TfrmNameValueGenerics.btnNameValueIntegerClick(Sender: TObject);
var
  LNameValueInteger: TNameValue<Integer>;
begin
  LNameValueInteger := TNameValue<Integer>.Create;
  try
    LNameValueInteger.Name := 'I''m an Integer';
    LNameValueInteger.Value := 6102018;
    Application.MessageBox(PChar(LNameValueInteger.Name + ': ' + LNameValueInteger.Value.ToString),
                           PChar(Self.Caption));
  finally
    LNameValueInteger.Free;
  end;
end;

end.
