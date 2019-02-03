unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmRTTI101 = class(TForm)
    btnReadFormProperties: TButton;
    lstbFormProperties: TListBox;
    btnReadThisProperty: TButton;
    lstbPropertyValue: TListBox;
    procedure btnReadFormPropertiesClick(Sender: TObject);
    procedure btnReadThisPropertyClick(Sender: TObject);
  protected
    function GetFormCaption: string;
  public
    property FormCaption: string read GetFormCaption;
  end;

var
  frmRTTI101: TfrmRTTI101;

implementation

uses
  System.Rtti;

{$R *.dfm}

procedure TfrmRTTI101.btnReadFormPropertiesClick(Sender: TObject);
var
  LRTTIContext: TRttiContext;
  LRTTIProperties: TArray<TRttiProperty>;
  LRttiProperty: TRttiProperty;
begin
  lstbFormProperties.Clear;
  lstbPropertyValue.Clear;

  LRTTIProperties := LRTTIContext.GetType(TfrmRTTI101).GetProperties;
  for LRttiProperty in LRTTIProperties do
    lstbFormProperties.Items.Add(LRttiProperty.Name);

  //lstbFormProperties.Sorted := True;
  lstbFormProperties.Selected[0] := True;
end;

procedure TfrmRTTI101.btnReadThisPropertyClick(Sender: TObject);
var
  LRTTIContext: TRttiContext;
  i: integer;
begin
  lstbPropertyValue.Clear;

  for i := 0 to lstbFormProperties.Count - 1 do
  begin
    if lstbFormProperties.Items[i] = 'ComObject' then
      lstbPropertyValue.Items.Add('(' + lstbFormProperties.Items[i] + ') Non available!')
    else
      lstbPropertyValue.Items.Add('(' + lstbFormProperties.Items[i] + ') ' +
                                      LRTTIContext.GetType(TfrmRTTI101)
                                        .GetProperty(lstbFormProperties.Items[i])
                                        .GetValue(Self).ToString);
  end;

//  Application.MessageBox(PChar(LRTTIContext.GetType(TfrmRTTI101)
//                                 .GetProperty(lstbFormProperties.Items[lstbFormProperties.ItemIndex])
//                                 .GetValue(Self).ToString),
//                         PChar(Self.Caption));
end;

function TfrmRTTI101.GetFormCaption: string;
begin
  Result := Caption;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;


end.
