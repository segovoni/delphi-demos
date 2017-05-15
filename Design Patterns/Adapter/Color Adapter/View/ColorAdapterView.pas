unit ColorAdapterView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, ComponentAdaptersU;

type
  TfrmColoring = class(TForm)
    clbSource: TColorBox;
    grbColoringComponents: TGroupBox;
    edtColoring: TEdit;
    cbxColoring: TCheckBox;
    lblColoring: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure clbSourceChange(Sender: TObject);
  private
    FCheckBoxColorAdapter: TCheckBoxColorAdapter;
    FEditColorAdapter: TEditColorAdapter;
    FLabelColorAdapter: TLabelColorAdapter;
    FFormColorAdapter: TFormColorAdapter;
  public
  end;

var
  frmColoring: TfrmColoring;

implementation

{$R *.dfm}

procedure TfrmColoring.clbSourceChange(Sender: TObject);
begin
  FEditColorAdapter.SetColor(clbSource.Selected);
  FCheckBoxColorAdapter.SetColor(clbSource.Selected);
  FLabelColorAdapter.SetColor(clbSource.Selected);
  FFormColorAdapter.SetColor(clbSource.Selected);
end;

procedure TfrmColoring.FormCreate(Sender: TObject);
begin
  FCheckBoxColorAdapter := TCheckBoxColorAdapter.Create(cbxColoring);
  FEditColorAdapter := TEditColorAdapter.Create(edtColoring);
  FLabelColorAdapter := TLabelColorAdapter.Create(lblColoring);
  FFormColorAdapter := TFormColorAdapter.Create(Self);
end;

end.
