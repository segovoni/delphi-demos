/// <summary>
///   <para>
///     Adapters are already around you, in the real world.
///   </para>
///   <para>
///     You have got an existing software system that you need to work a new
///     vendor class library into, but the new vendor designed their
///     interfaces differently than the last vendor. You don't want to solve
///     the problem by changing your existing code, and you CAN'T change the
///     vendor's code. To solve this problem, you have to write a class that
///     adapts the new vendor interface into the one you are expecting.
///   </para>
///   <para>
///     OO Adapters take an interface and adapt it to one that a client
///     expecting.
///   </para>
///   <list type="number">
///     <item>
///       Implement the interface of the type you are adapting to
///     </item>
///     <item>
///       Get a reference to the object that you are adapting. You can do
///       that through the constructor method
///     </item>
///     <item>
///       Implement all the method in the interface
///     </item>
///   </list>
///   The Adapter Pattern's role is to convert one interface into another.
/// </summary>
unit ComponentAdaptersU;

interface

uses
  VCL.StdCtrls, ComponentAdaptersIntf;

type
  TLabelAdapter = class(TInterfacedObject, ITextDisplay)
  private
    FLabel: TLabel;
  public
    constructor Create(ALabel: TLabel);
    procedure DisplayText(const AText: string);
  end;

  TButtonAdapter = class(TInterfacedObject, ITextDisplay)
  private
    FButton: TButton;
  public
    constructor Create(AButton: TButton);
    procedure DisplayText(const AText: string);
  end;

  TEditAdapter = class(TInterfacedObject, ITextDisplay)
  private
    FEdit: TEdit;
  public
    constructor Create(AEdit: TEdit);
    procedure DisplayText(const AText: string);
  end;

  TCheckBoxAdapter = class(TInterfacedObject, ITextDisplay)
  private
    FCheckBox: TCheckBox;
  public
    constructor Create(ACheckBox: TCheckBox);
    procedure DisplayText(const AText: string);
  end;

implementation

{ TLabelAdapter }

constructor TLabelAdapter.Create(ALabel: TLabel);
begin
  FLabel := ALabel;
end;

procedure TLabelAdapter.DisplayText(const AText: string);
begin
  FLabel.Caption := AText;
end;

{ TButtonAdapter }

constructor TButtonAdapter.Create(AButton: TButton);
begin
  FButton := AButton;
end;

procedure TButtonAdapter.DisplayText(const AText: string);
begin
  FButton.Caption := AText;
end;

{ TEditAdapter }

constructor TEditAdapter.Create(AEdit: TEdit);
begin
  FEdit := AEdit;
end;

procedure TEditAdapter.DisplayText(const AText: string);
begin
  FEdit.Text := AText;
end;

{ TCheckBoxAdapter }

constructor TCheckBoxAdapter.Create(ACheckBox: TCheckBox);
begin
  FCheckBox := ACheckBox;
end;

procedure TCheckBoxAdapter.DisplayText(const AText: string);
begin
  FCheckBox.Caption := 'I''m a beautiful CheckBox.. ' + AText;
end;

end.
