unit seriell;

{$mode objfpc}

interface

uses
  Classes, SysUtils, synaser;


procedure RS232_connect;

implementation



procedure RS232_connect;
  var
     ser: TBlockSerial;
  begin
       ser:=TBlockSerial.Create;
       try
          //ser.Connect('/dev/ttyUSB0');
          ser.Connect('COM1');
          Sleep(1000);
          ser.config(1200, 7, 'N', SB1, False, False);
          Write('Device: ' + ser.Device + '   Status: ' + ser.LastErrorDesc +' '+
          Inttostr(ser.LastError));
          Sleep(1000);
          //repeat
          //      FormMain.MemoText.Lines.Add(IntToHex(ser.RecvByte(10000), 2));
          //until keypressed;
       finally
              FormMain.MemoText.Lines.Add('Serielle Schnittstelle wird freigegeben...');
              ser.free;
              FormMain.MemoText.Lines.Add('Serielle Schnittstelle erfolgreich freigegeben!');
       end;
  end;

end.

