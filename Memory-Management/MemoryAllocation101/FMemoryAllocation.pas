unit FMemoryAllocation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMemoryAllocation = class(TForm)
    btnExample1: TButton;
    btnExample2: TButton;
    btnExample3: TButton;
    btnExample4: TButton;
    btnExample5: TButton;
    procedure btnExample1Click(Sender: TObject);
    procedure btnExample2Click(Sender: TObject);
    procedure btnExample3Click(Sender: TObject);
    procedure btnExample4Click(Sender: TObject);
    procedure btnExample5Click(Sender: TObject);
  protected
    type
      TMyStringList = class(TStringList)
      protected
        function GetZero: Integer;
      public
        constructor Create;
        destructor Destroy; override;
    end;
    function GetStringList: TStringList;
    procedure FillStringList(AList: TStringList);
  end;

var
  frmMemoryAllocation: TfrmMemoryAllocation;

implementation

{$R *.dfm}

procedure TfrmMemoryAllocation.btnExample1Click(Sender: TObject);
var
  LList: TStringList;
begin
  // Example 1
  LList := TStringList.Create;
  // ...
  // Some operations on LList
  // ...
  LList.Free;
end;

procedure TfrmMemoryAllocation.btnExample2Click(Sender: TObject);
var
  LList: TStringList;
begin
  // Example 2
  /// Supposing that TStringList.Create fails
  /// What happens if I call the Free method on a nil object?
  ///
  /// If the TStringList.Create method fails, LList variable will not be
  /// initialized and it will contain the original uninitialized memory address
  ///
  /// What happens if I call the Free method on an uninitializedobject?
  /// An exception on the Create method will be reflectedon the finally block
  /// where another exception will occur
  ///
  try
    LList := TStringList.Create;
    //LList := TMyStringList.Create;
    // ...
    // Some operations on LList
    // ...
  finally
    LList.Free;
  end;
end;

procedure TfrmMemoryAllocation.btnExample3Click(Sender: TObject);
var
  LList: TStringList;
begin
  // Example 3
  /// This case is tipically used when a method is used to returns an object
  ///
  LList := TStringList.Create;
  try
    // ...
    // Some operations on LList
    // ...
  except
    LList.Free;
  end;
end;

procedure TfrmMemoryAllocation.btnExample4Click(Sender: TObject);
var
  LList: TStringList;
begin
  // Example 4
  LList := TStringList.Create;
  try
    // ...
    // Some operations on LList
    // ...
  finally
    LList.Free;
  end;
end;

procedure TfrmMemoryAllocation.btnExample5Click(Sender: TObject);
var
  LList: TStringList;
begin
  // Example 5
  /// This case is similar to the previous one, it's correct!
  ///
  /// If the Factory Method returns an inizialized object the try..finally block
  /// will be executed, at the contrary, an exception will stop the program execution
  ///
  /// If an exception occurs inside the GetStringList, the result of the function
  /// is not initialized and the try..finally block is not executed
  ///
  /// This is a typical example of ownership changing! During the GetStringList
  /// execution the local variable is in the heap of the method, but when the
  /// execution of GetStringList ends the local variable is returned to the caller
  /// and the ownership of the memory changes!
  LList := GetStringList;
  try
    // ...
    // Some operations on LList
    // ...
  finally
    LList.Free;
  end;
end;

procedure TfrmMemoryAllocation.FillStringList(AList: TStringList);
begin
  AList.Add('Hi I''m an element of a string list!');
end;

function TfrmMemoryAllocation.GetStringList: TStringList;
begin
  Result := TStringList.Create;
  try
    // Some initializations
    FillStringList(Result);
  except
    on E: Exception do
    begin
      Result.Free;
      // What would happen to the caller if the exception was not raised again?
      //raise
    end;
  end;
end;

function TfrmMemoryAllocation.TMyStringList.GetZero: Integer;
begin
  Result := 0;
end;

{ TfrmMemoryAllocation.TMyStringList }

constructor TfrmMemoryAllocation.TMyStringList.Create;
var
  i: Integer;
begin
  inherited Create;

  i := 1 div GetZero;
  //raise Exception.Create('Custom error!!');
end;

destructor TfrmMemoryAllocation.TMyStringList.Destroy;
begin
  inherited;
end;

end.
