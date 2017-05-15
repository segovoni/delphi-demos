unit ComponentAdaptersU;

interface

uses
  Vcl.StdCtrls,
  Vcl.Graphics,
  Vcl.Forms,
  ComponentAdaptersIntf;

type

  TLabelColorAdapter = class(TInterfacedObject, ISetColor)
  private
    FLabel: TLabel;
  public
    constructor Create(ALabel: TLabel);
    procedure SetColor(AValue: TColor);
  end;

  TEditColorAdapter = class(TInterfacedObject, ISetColor)
  private
    FEdit: TEdit;
  public
    constructor Create(AEdit: TEdit);
    procedure SetColor(AValue: TColor);
  end;

  TButtonColorAdapter = class(TInterfacedObject, ISetColor)
  private
    FButton: TButton;
  public
    constructor Create(AButton: TButton);
    procedure SetColor(AValue: TColor);
  end;

  TCheckBoxColorAdapter = class(TInterfacedObject, ISetColor)
  private
    FCheckBox: TCheckBox;
  public
    constructor Create(ACheckBox: TCheckBox);
    procedure SetColor(AValue: TColor);
  end;

  TFormColorAdapter = class(TInterfacedObject, ISetColor)
  private
    FForm: TForm;
  public
    constructor Create(AForm: TForm);
    procedure SetColor(AValue: TColor);
  end;

implementation

{ TEditColorAdapter }

constructor TEditColorAdapter.Create(AEdit: TEdit);
begin
  inherited Create;
  FEdit := AEdit;
end;

procedure TEditColorAdapter.SetColor(AValue: TColor);
begin
  if (AValue <> clWhite) then
    FEdit.Font.Color := clWhite
  else
    FEdit.Font.Color := clBlack;

  FEdit.Color := AValue;
end;

{ TButtonColorAdapter }

constructor TButtonColorAdapter.Create(AButton: TButton);
begin
  inherited Create;
  FButton := AButton;
end;

procedure TButtonColorAdapter.SetColor(AValue: TColor);
begin
  FButton.Caption := 'Colored button';
  FButton.Font.Color := AValue;
end;

{ TCheckBoxColorAdapter }

constructor TCheckBoxColorAdapter.Create(ACheckBox: TCheckBox);
begin
  inherited Create;
  FCheckBox := ACheckBox;
end;

procedure TCheckBoxColorAdapter.SetColor(AValue: TColor);
begin
  FCheckBox.Caption := 'Coloring checkbox..';
  FCheckBox.Font.Color := AValue;
end;

{ TFormColorAdapter }

constructor TFormColorAdapter.Create(AForm: TForm);
begin
  inherited Create;
  FForm := AForm;
end;

procedure TFormColorAdapter.SetColor(AValue: TColor);
begin
  FForm.Color := AValue;
end;

{ TLabelColorAdapter }

constructor TLabelColorAdapter.Create(ALabel: TLabel);
begin
  inherited Create;
  FLabel := ALabel;
end;

procedure TLabelColorAdapter.SetColor(AValue: TColor);
begin
  FLabel.Caption := 'Colored label';
  FLabel.Font.Color := AValue;
end;

end.
