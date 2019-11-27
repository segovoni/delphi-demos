unit UTypes;

interface

uses
  Generics.Collections;

type

  TListElement = record
    FirstName: string;
    LastName: string;
    Age: Integer;
  end;
  TPointerListElement = ^TListElement;

  TListGenerics = TList<TListElement>;

implementation

end.
