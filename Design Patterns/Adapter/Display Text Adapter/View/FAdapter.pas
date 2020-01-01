unit FAdapter;

interface // = Public

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, ComponentAdaptersU, System.Generics.collections;

type
  TfrmAdapter = class(TForm)
    edtSource: TEdit;
    grbTarget: TGroupBox;
    lblTarget: TLabel;
    btnTarget: TButton;
    edtTarget: TEdit;
    lblTargetOne: TLabel;
    chbTarger: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure edtSourceChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    // Adapters
    FLabelAdapter: TLabelAdapter;
    FLabelOneAdapter: TLabelAdapter;
    FButtonAdapter: TButtonAdapter;
    FEditAdapter: TEditAdapter;
    FCheckAdapter: TCheckBoxAdapter;
  end;

var
  frmAdapter: TfrmAdapter;

implementation  // = Private

{$R *.dfm}

procedure TfrmAdapter.edtSourceChange(Sender: TObject);
begin
  FLabelAdapter.DisplayText(edtSource.Text);
  FLabelOneAdapter.DisplayText(edtSource.Text);
  FButtonAdapter.DisplayText(edtSource.Text);
  FEditAdapter.DisplayText(edtSource.Text);
  FCheckAdapter.DisplayText(edtSource.Text);
end;

procedure TfrmAdapter.FormCreate(Sender: TObject);
begin
  FLabelAdapter := TLabelAdapter.Create(lblTarget);
  FLabelOneAdapter := TLabelAdapter.Create(lblTargetOne);
  FButtonAdapter := TButtonAdapter.Create(btnTarget);
  FEditAdapter := TEditAdapter.Create(edtTarget);
  FCheckAdapter := TCheckBoxAdapter.Create(chbTarger);
end;

procedure TfrmAdapter.FormDestroy(Sender: TObject);
begin
  FLabelAdapter.Free;
  FLabelOneAdapter.Free;
  FButtonAdapter.Free;
  FEditAdapter.Free;
  FCheckAdapter.Free;
end;

end.
