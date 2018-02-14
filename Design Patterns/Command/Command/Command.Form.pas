unit Command.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Executor.Classes;

type
  TForm2 = class(TForm)
    edtTextCommand: TLabeledEdit;
    btnExecute: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
  private
    FCommandsExecutor: TCommandExecutor;
  public
  end;

var
  Form2: TForm2;

implementation

uses
  System.Generics.Collections, Command.Classes;

{$R *.dfm}

procedure TForm2.btnExecuteClick(Sender: TObject);
begin
  edtTextCommand.Text := FCommandsExecutor.Execute(edtTextCommand.Text);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FCommandsExecutor := TCommandExecutor.Create(TObjectList<TCommand>.Create());

  // Add the commands
  FCommandsExecutor.Add(TTrimLeftCommand.Create);
  FCommandsExecutor.Add(TFrom5To10CharsCommand.Create);
  FCommandsExecutor.Add(TUpperCaseCommand.Create);
end;

end.
