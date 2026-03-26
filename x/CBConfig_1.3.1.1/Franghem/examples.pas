function ByteToBCDChar(b:byte):char;
var temp : byte;
    res : byte;
begin
  b := b mod 100;  //Das Byte auf 99 beschränken
  temp := (b div 10) shl 4;
  res := (b mod 10) + temp;
  result := char(res);
end;

function BCDCharToByte(c:char):byte;
begin
  result := ((byte(c) and $F0) shr 4) *10 + (byte(c) and $0F); 
end;

function BS500Checksum(s:string):byte;
var b,i : integer;
begin
  b := 0;
  for i := 1 to length(s) do
    b := b + byte(s[i]);
  result := not ((b - 1) and $ff); //die unteren 8Bits sind die Checksumme end;

{*******************************************************************************************function GetAdrLenString(s:string):string; Erzeugen der Adresse für die Kommunikatin mit dem FV100
*******************************************************************************************}
function GetAdrLenString(adr:integer):string;
var sl: string;
begin
  sl := IntToStr(adr);
  if length(sl) < 2 then
    sl := '0' + sl;
  result := sl;
end;

{*******************************************************************************************
function GetBS500FV100SendeString(SCTyp:TSCTyp; SC,Platz:integer;
TCByte1,TCByte2: char; TelegrammType:TBS500Telgrammtype):string;
Je nach BS-Typ und TelegrammType wird der Sendestring generiert
*******************************************************************************************}
function GetBS500FV100SendeString(SCTyp:TSCTyp; SC,Platz:integer; TCByte1,TCByte2: char; TelegrammType:TBS500Telgrammtype):string;
var adressbyte,byte2,temp : byte;
begin
  if SCTyp=RG_FV100 then
  begin
    //*****************************************************************
    //FV100
    //
    //Format   <STX><2ADRESSBYTE><PLATZ><COMMAND><ETX><BCC>
    //
    //PLATZ wird nur bei Fachfreigaben/verriegelungen bnötigt (ansonsten $FF)
    //*****************************************************************

    //Startkennung setzen
    result := '' + FV100_S_STX;

    //Die SC-Adresse im BCD-Format übergeben
    result := result + ByteToBCDChar(SC);

    case TelegrammType of
      bsFachfreigabe,
      bsFachverriegelung : begin
          //Bei Freigaben/Verriegelungen den Platz übernehmen
          result := result + ByteToBCDChar(Platz);

          //Das Command übernehmen
          if TelegrammType = bsFachfreigabe then
            result := result + cmdBoxOrder
          else
            result := result + cmdCloseBox;
        end;
      bsPoll : begin
          result := result + #$ff + cmdPoll;
        end;
      bsReset : begin
          result := result + #$ff + cmdReset;
        end;
      bsGetState : begin
          result := result + #$00 + cmdGetState;
        end;
    end;
    result := result + FV100_S_ETX;
    result := result + char(BS500Checksum(result));
  end else
  begin
    //*****************************************************************
    //BS500
    //
    //Format   <STX><ADRESSBYTE><FACHNR><COMMAND><TC1><TC2><ETX><BCC>
    //
    //*****************************************************************
    result := '' + BS500_S_STX;
    adressbyte := SC shl 3;  //Bits F8 des adressbyte sind die SC-Nummer
    case TelegrammType of
      bsFachfreigabe,
      bsFachverriegelung : begin
          temp  := (platz div 100) and $07; //die 100er-Stelle muss ins adressbyte rein
          adressbyte := adressbyte or temp;
          platz := platz mod 100;  //die 100er-Stelle abschneiden
          temp  := (platz div 10) shl 4;
          byte2 := platz mod 10;
          byte2 := byte2 or temp; //in byte2 wird 00..99 im BCD-Format gespeichert.
          result := result + char(adressbyte) + char(byte2);
          if TelegrammType = bsFachfreigabe then
            result := result + cmdBoxOrder
          else
            result := result + cmdCloseBox;
          result := result + TCByte1 + TCByte2;
        end;
      bsPoll : begin
          result := result + char(adressbyte) + #$ff + cmdPoll + TCByte1 + TCByte2;
        end;
      bsReset : begin
          result := result + char(adressbyte) + #$ff + cmdReset + TCByte1 + TCByte2;
        end;
      bsGetState : begin
          result := result + char(adressbyte) + #$ff + cmdGetState + TCByte1 + TCByte2;
        end;
    end;
    result := result + BS500_S_ETX;
    result := result + char(BS500Checksum(result));
  end;
end;  
