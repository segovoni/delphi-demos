unit UDMConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, Data.DB, FireDAC.Comp.Client;

type
  TDMConnection = class(TDataModule)
    FDConnection: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConnection: TDMConnection;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
