unit Executor.Classes;

interface

uses
  System.Generics.Collections, Command.Classes;

type
  TCommandExecutor = class(TObject)
  private
    FCommandsList: TObjectList<TCommand>;
  public
    constructor Create(ACommandsList: TObjectList<TCommand>);
    destructor Destroy; override;
    function Execute(const AValue: string): string;
    procedure Add(ACommand: TCommand);
  end;

implementation

{ TCommandExecutor }

procedure TCommandExecutor.Add(ACommand: TCommand);
begin
  FCommandsList.Add(ACommand);
end;

constructor TCommandExecutor.Create(ACommandsList: TObjectList<TCommand>);
begin
  FCommandsList := ACommandsList;
end;

destructor TCommandExecutor.Destroy;
begin
  FCommandsList.Free;
  inherited;
end;

function TCommandExecutor.Execute(const AValue: string): string;
var
  LCommand: TCommand;
begin
  Result := AValue;
  for LCommand in FCommandsList do
    Result := LCommand.Execute(Result);
end;

end.
