unit UListContainer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnListOfPointers: TButton;
    MemoOutput: TMemo;
    btnListOfT: TButton;
    procedure btnListOfPointersClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnListOfTClick(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

uses
  UTypes;

{$R *.dfm}

procedure TForm1.btnListOfPointersClick(Sender: TObject);
var
  LPointerListElement: TPointerListElement;
  LListOfPointers: TList;
  I: Integer;
  //LComponent: TComponent;
begin

  LListOfPointers := TList.Create;
  try
    New(LPointerListElement);
    LPointerListElement^.FirstName := 'FirstName1';
    LPointerListElement^.LastName := 'LastName1';
    LPointerListElement.Age := 27;

    I := LListOfPointers.Add(LPointerListElement);
    LListOfPointers.Items[I] := LPointerListElement;

    New(LPointerListElement);
    LPointerListElement^.FirstName := 'FirstName2';
    LPointerListElement^.LastName := 'LastName2';
    LPointerListElement.Age := 34;

    I := LListOfPointers.Add(LPointerListElement);
    LListOfPointers.Items[I] := LPointerListElement;

    //LComponent := TComponent.Create(nil);
    //I := LListOfPointers.Add(LComponent);
    //LListOfPointers.Items[I] := LComponent;

    for I := 0 to (LListOfPointers.Count - 1) do
      MemoOutput.Lines.Add(TPointerListElement(LListOfPointers.Items[I])^.FirstName + ' ' +
                           TPointerListElement(LListOfPointers.Items[I])^.LastName + ' ' +
                           TPointerListElement(LListOfPointers.Items[I])^.Age.ToString);
  finally
    // Libera memoria lista
    for I := 0 to (LListOfPointers.Count - 1) do
      Dispose(TPointerListElement(LListOfPointers.Items[I]));
    LListOfPointers.Clear;
    LListOfPointers.Free;
  end;

end;

procedure TForm1.btnListOfTClick(Sender: TObject);
var
  LList: TListGenerics;
  LListElement: TListElement;
begin
  LList := TListGenerics.Create;
  try
    LListElement.FirstName := 'FirstName3';
    LListElement.LastName := 'LastName3';
    LListElement.Age := 36;
    LList.Add(LListElement);

    LListElement.FirstName := 'FirstName4';
    LListElement.LastName := 'LastName4';
    LListElement.Age := 46;
    LList.Add(LListElement);

    //LList.Add(TComponent.Create(nil));

    for LListElement in LList do
      MemoOutput.Lines.Add(LListElement.FirstName + '' + LListElement.LastName + ' ' +
                           LListElement.Age.ToString);
  finally
    LList.Free;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  MemoOutput.Clear;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

finalization

end.
