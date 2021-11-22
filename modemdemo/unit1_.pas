unit unit1_;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, synaser;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  ser:TBlockSerial;
begin
  ser:=TBlockSerial.Create;
  ser.RaiseExcept:=True;
  try
    ser.Connect(Edit1.Text, StrToIntDef(Edit2.Text, 9600),8,'N',0,false,false);
    memo1.lines.text:=ser.ATCommand(Edit3.Text);
  finally
    ser.free;
  end;
end;


end.

