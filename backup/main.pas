unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, lNetComponents, lNet, ExtCtrls, Menus, ComCtrls, Grids, Inifiles, synaser,
  LCLIntf, types;
var
  ser:TBlockSerial;

type

  { TFormMain }

  TFormMain = class(TForm)
    box1: TButton;
    Button2: TButton;
    b_webconfig: TButton;
    B_save_log: TButton;
    Button_lock: TButton;
    Button_Poll: TButton;
    Button_terminal: TButton;
    ButtonSend: TButton;
    b_close: TButton;
    b_set_default: TButton;
    b_get_ip: TButton;
    b_set_ip: TButton;
    ButtonDiconnect: TButton;
    ButtonConnect: TButton;
    Chb_ttysend: TCheckBox;
    chk_out1: TCheckBox;
    chk_in2: TCheckBox;
    chk_in3: TCheckBox;
    chk_in4: TCheckBox;
    chk_in5: TCheckBox;
    chk_in6: TCheckBox;
    chk_in7: TCheckBox;
    chk_in8: TCheckBox;
    chk_out2: TCheckBox;
    chk_out3: TCheckBox;
    chk_out4: TCheckBox;
    chk_out5: TCheckBox;
    chk_out6: TCheckBox;
    chk_out7: TCheckBox;
    chk_out8: TCheckBox;
    chk_in1: TCheckBox;
    ComboBox_comport: TComboBox;
    Combo_baudTTYS: TComboBox;
    Edit_TTYS_receivemsg: TEdit;
    EditPort2: TEdit;
    Edit_TTYS_sendmsg: TEdit;
    Edit_version: TEdit;
    Edit_box: TEdit;
    EditSend: TEdit;
    Edit_IP_1: TEdit;
    Edit_IP_2: TEdit;
    Edit_IP_3: TEdit;
    Edit_IP_4: TEdit;
    Edit_IP_gw2: TEdit;
    Edit_IP_gw3: TEdit;
    Edit_IP_gw4: TEdit;
    Edit_IP_mac6: TEdit;
    Edit_IP_sn1: TEdit;
    Edit_IP_sn2: TEdit;
    Edit_IP_sn3: TEdit;
    Edit_IP_sn4: TEdit;
    Edit_IP_mac2: TEdit;
    Edit_IP_mac3: TEdit;
    Edit_IP_mac4: TEdit;
    Edit_IP_mac5: TEdit;
    Edit_IP_port0: TEdit;
    Edit_IP_mac1: TEdit;
    Edit_IP_gw1: TEdit;
    Edit_IP_port1: TEdit;
    GroupBox1: TGroupBox;
    GroupBox_EE: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    l_errorcount: TLabel;
    LabelHostName1: TLabel;
    LTCP1: TLTCPComponent;
    l_sendcount: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LTCP: TLTCPComponent;
    EditPort: TEdit;
    EditIP: TEdit;
    LabelPort: TLabel;
    LabelHostName: TLabel;
    MainMenu1: TMainMenu;
    Memo_log_common: TMemo;
    MemoText: TMemo;
    MenuItemExit: TMenuItem;
    MenuItemAbout: TMenuItem;
    MenuItemHelp: TMenuItem;
    MenuItemFile: TMenuItem;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel_bsNoAnswer: TPanel;
    Panel_terminal: TPanel;
    ProgressBar1: TProgressBar;
    rg_BsAdr: TRadioGroup;
    send_method: TRadioGroup;
    StringGrid1: TStringGrid;
    Tab_TTYS: TTabSheet;
    Tab_EEProm: TTabSheet;
    Tab_Boxes: TTabSheet;
    Timer_ttysend: TTimer;
    Timer_poll: TTimer;
    TimerQuit: TTimer;
    TB_sequence: TToggleBox;
    TB_perm_rel: TToggleBox;
    procedure box1Click(Sender: TObject);
    procedure Chb_ttysendChange(Sender: TObject);
    procedure connectTTY;
    procedure Button2Click(Sender: TObject);

    procedure Button_lockClick(Sender: TObject);
    procedure Button_PollClick(Sender: TObject);
    procedure Button_terminalClick(Sender: TObject);
    procedure b_closeClick(Sender: TObject);
    procedure B_save_logClick(Sender: TObject);
    procedure b_set_defaultClick(Sender: TObject);
    procedure b_set_ipClick(Sender: TObject);
    procedure b_webconfigClick(Sender: TObject);
    procedure chk_out1Change(Sender: TObject);

    procedure Edit_boxChange(Sender: TObject);

    procedure LTCP1Connect(aSocket: TLSocket);
    procedure LTCP1Disconnect(aSocket: TLSocket);
    procedure LTCP1Error(const msg: string; aSocket: TLSocket);
    procedure LTCP1Receive(aSocket: TLSocket);
    procedure MemoTextChange(Sender: TObject);
    procedure Memo_log_commonChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Panel_bsNoAnswerClick(Sender: TObject);
    procedure rg_BsAdrClick(Sender: TObject);
    procedure send_command(log:boolean = true);
    procedure get_ip();
    procedure get_brdversion();
    procedure send_methodClick(Sender: TObject);
    procedure set_ip();
    procedure filter_msg(const aMsg: string);
    procedure filter_bs(const bs_string: string);

    procedure b_get_ipClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure LTCPComponentConnect(aSocket: TLSocket);
    //procedure ListenButtonClick(Sender: TObject);
    procedure ConnectButtonClick(Sender: TObject);
    procedure DiconnectButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LTCPComponentError(const msg: string; aSocket: TLSocket);
    procedure LTCPComponentAccept(aSocket: TLSocket);
    procedure LTCPComponentReceive(aSocket: TLSocket);
    procedure LTcpComponentDisconnect(aSocket: TLSocket);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure show_Terminal(term_state:boolean);

    procedure SendButtonClick(Sender: TObject);
    procedure SendEditKeyPress(Sender: TObject; var Key: char);
    procedure StringGrid1Click(Sender: TObject);

    procedure StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure Tab_EEPromContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TimerQuitTimer(Sender: TObject);
    procedure set_IO();
    procedure get_IO(s_io: string);

    function Ini_Read(section: string; key: string): string;
    procedure Ini_Write(section: string; key: string; Value: string);
    procedure setdefault;
    procedure send_CB(s:string);
    procedure get_boxinfo(aMsg:string);
    procedure Timer_pollTimer(Sender: TObject);
    procedure poll_bs;
    procedure log_terminal(s:string);
    procedure log_common(s:string);
    procedure selectCell(nr:integer; selected:boolean);
    procedure init_StringGrid;
    procedure TB_sequenceChange(Sender: TObject);
    procedure releaseBox(boxnr:integer);
    procedure lockBox(boxnr:integer);
    procedure serialConnect;
    procedure serialDisconnect;
    procedure serialTransmit(s:string);
    procedure serialReceive;
    procedure Timer_ttysendTimer(Sender: TObject);


  private

    FNet,FNet1: TLConnection;
    FIsserer, b_iswritten, terminal_log, connected_com : boolean;
    command_stack,command_stack1, command_stack_bs: TStringList;
    temp_string, Ini_File, s_last_number, s_mac_vendor, brd_version, port2 : string;
    arr_boxes : array[0..499]of boolean;
    request_cb, request_bs, current_box , ActiveBox, bs_errorcounter, act_linenr: integer;



  const FORMHEIGHT = 800;
  VERSION = '1.4.0.0';
  CurrentOS = {$I %FPCTARGETOS };

    procedure SendToAll(const aMsg: string);


  public
    { public declarations }

  end;

var
  FormMain: TFormMain;


implementation

uses
  lCommon, Unit_BS;

{ TFormMain }


Procedure WriteLog(s, LogFile : String);
Var
F1 : TextFile;
begin
 DateSeparator := '.';
 ShortDateFormat := 'dd/mm/yy';
 ShortTimeFormat := 'hh/mm/ss';
 //LogFile := Log;
 If Not FileExists(LogFile) then
 begin
  try
   AssignFile(F1,LogFile);
   ReWrite(F1);
   WriteLn(F1,DateToStr(now)+'-'+TimeToStr(now)+';'+ #$9 + s);
   CloseFile(F1);
  finally
   //CloseFile(F1);
  end;
 end else
 begin
   try
        AssignFile(F1,LogFile);
        Append(F1);

        WriteLn(F1,DateToStr(now)+'-'+TimeToStr(now)+';'+ #$9 + s);
        CloseFile(F1);
   except
     on E:Exception do ShowMessage(E.Message) ;
   end
 end;
end;

// neutrale Funktionen

procedure TFormMain.FormCreate(Sender: TObject);
var
  myicon: TIcon;
  s, os : string;
begin
  myicon := TIcon.Create;
  myicon.LoadFromLazarusResource('network-wired');

  MemoText.color := clBlack;
  MemoText.Font.color:= clLime;
  FNet := LTCP;
  FNet1 := LTCP1;
  FIsserer := False;
  b_iswritten := False;
  ActiveBox := -1;
  terminal_log := true;
  s := '0';
  request_cb := 0;
  request_bs := 0;
  bs_errorcounter := 0;
  current_box := 0;
  act_linenr := 0;
  brd_version := '';
  //current_adr := 1;
  command_stack := TStringList.Create; // Port5000
  command_stack1 := TStringList.Create; // Port5001
  command_stack_bs := TStringList.Create;

  PageControl1.PageIndex:= 0;
  os := CurrentOS;
  FormMain.Caption:= 'cb config tool ('+os+') ' + VERSION;



  if(os = 'Linux')then
  Ini_File := ExtractFileDir(Application.ExeName) + '/cb_config.ini' else
  Ini_File := ExtractFileDir(Application.ExeName) + '\cb_config.ini'; // Windows

  if not fileexists(Ini_File) then
  begin
    ini_write('HOST', 'IP', '192.168.1.126');
    ini_write('HOST', 'PORT', '5000');
    ini_write('HOST', 'PORT2', '5001');
    ini_write('EEPROM', 'LAST_MAC_ENUM', '4144');
    // entspricht 0x1030, das müsste die letzte Nummer sein
    ini_write('EEPROM', 'MAC_VENDOR', '0C-0C-11');
    //ini_write('GUI', 'SHOW_TERMINAL', '0');
  end;

  s := ini_read('HOST', 'IP');
  If s = '' then EditIP.Text := '192.168.1.126' else EditIP.Text := s;

  s := ini_read('HOST', 'PORT');
  If s = '' then EditPort.Text := '5000' else EditPort.Text := s;

  s := ini_read('HOST', 'PORT2');
  If s = '' then EditPort2.Text := '5001' else EditPort2.Text := s;
  If s = '' then port2 := '5000' else port2 := s;

  s := ini_read('EEPROM', 'LAST_MAC_ENUM');
  If s = '' then s_last_number := '4144' else s_last_number := s;

  s := ini_read('EEPROM', 'MAC_VENDOR');
  If s = '' then s_mac_vendor := '0C-0C-11' else s_mac_vendor := s;

  // Terminal state merken
  s := ini_read('GUI', 'SHOW_DEBUGTERMINAL');
  if s = '1' then
    show_Terminal(true)
  else
    show_Terminal(false);

  init_StringGrid;
  l_errorcount.Caption := IntToStr(bs_errorcounter);

end;



procedure TFormMain.init_StringGrid;
var i,i1,i3 : integer;
begin
  i3 := 0; // erste Fachnummer
  for i := 0 to 24 do
  begin
    for i1 := 0 to 19 do
    begin
      StringGrid1.Cells[i,i1]:= inTToStr(i3);

      i3 := i3 + 1;
      arr_boxes[i3]:=false;
    end;
  end;
end;

procedure TFormMain.TB_sequenceChange(Sender: TObject);
begin
  if TB_sequence.Checked then
  begin
    TB_sequence.Caption:='Sequence stop';
    log_common('Sequence test started');
  end else
  begin
    TB_sequence.Caption:='Sequence start';
    log_common('Sequence test stopped');
    lockBox(ActiveBox);
  end;
end;

procedure TFormMain.selectCell(nr:integer; selected:boolean);
var col, row : integer;
  myrect : TRect;
  col_open, col_close, mycolor : TColor;
begin
  col := (nr DIV 20) MOD 25;
  row := nr MOD 20;
  col_open := $00FFFFFF;
  col_close := $0000FFFF;
  if selected then
  begin
    mycolor := col_close;
  end else
  begin
    mycolor := col_open;
  end;



  if nr = current_box then
  begin
      mycolor := mycolor xor $00500050;
  end;

  if nr = ActiveBox then
  begin
      mycolor := mycolor xor $00005050;
  end;


  StringGrid1.Canvas.Brush.Color := mycolor;
  myrect := StringGrid1.CellRect(col,row);
  StringGrid1.Canvas.FillRect(myrect);
  //StringGrid1.Canvas.Font.Size:=8;
  StringGrid1.Canvas.TextOut(myrect.Left+3,myrect.top,StringGrid1.Cells[col,row]);
end;

// command über TCP rausschicken
procedure TFormMain.send_command(log : boolean = true);
begin

    if (command_stack.Count > 0) then
    begin
      if FNet.Connected = False then  // Versuche neu zu verbinden
      begin
           if FNet.Connect(EditIP.Text, StrToInt(EditPort.Text)) then
           FIsserer := False;
      end;
      if FNet.Connected then // Nochmal auf Verbindung prüfen
      begin
           FNet.SendMessage(command_stack[0]);
           inc(request_cb);
           if log then log_terminal('Host->CB ('+EditPort.Text+'): ' + #9 + command_stack[0]);
           command_stack.Delete(0); // Wie FIFO: oben drauf und unten weg
           EditPort.Color := clLime;
      end else
      log_common('no connection to ' + EditIP.Text + ':' + EditPort.Text);
    end;


    {
    if (command_stack1.Count > 0) then
    begin
      if FNet1.Connected = False then  // Versuche neu zu verbinden
      begin
           if FNet1.Connect(EditIP.Text, StrToInt(port2)) then
           //FIsserer := False;
      end;
      if FNet1.Connected then // Nochmal auf Verbindung prüfen
      begin
           FNet1.SendMessage(command_stack1[0]);
           inc(request_cb);
           if log then log_terminal('Host->CB ('+port2+'): ' + #9 + command_stack1[0]);
           command_stack1.Delete(0); // Wie FIFO: oben drauf und unten weg
           EditPort2.Color := clLime;
      end else
      log_terminal('no connection to ' + EditIP.Text + ':' + port2);
    end;
    }
end;

procedure TFormMain.send_CB(s:string);
var s1 : string;
begin
  s1 := 'B' + (IntToStr(3 + length(s))) + s;
  command_stack.Add(s1);
  send_command(false);
  log_terminal('Host->CB->BS500 ('+IntToStr(rg_BsAdr.ItemIndex +1)+'): ' + #9 + 'B' + (IntToStr(3 + length(s))) + ' ' + get_HexStr(s)+ #9 +' Stack:'+IntToStr(command_stack_bs.Count)+' #'+IntToStr(request_bs));
end;


procedure TFormMain.b_set_ipClick(Sender: TObject);
begin
  if MessageDlg('Write EEProm', 'Write all data to EEProm?',
    mtConfirmation, [mbYes, mbNo, mbIgnore], 0) = mrYes then
    set_ip();
end;

procedure TFormMain.b_webconfigClick(Sender: TObject);
var ip : string;
begin
  ip := EditIP.Text;
  OpenURL('https://'+ip);
end;

procedure TFormMain.chk_out1Change(Sender: TObject);
begin
  set_io;
end;


procedure TFormMain.Edit_boxChange(Sender: TObject);
begin
  current_box := StrToInt(Edit_box.text);
end;



procedure TFormMain.LTCP1Connect(aSocket: TLSocket);
begin
  log_terminal('Connected Port '+ port2+' to remote host');
  log_common('Connected Port '+ port2+' to remote host');
  EditPort2.Color := clLime;
  //EditPort2.Enabled := false;
  command_stack.Clear;
  command_stack_bs.Clear;
end;

procedure TFormMain.LTCP1Disconnect(aSocket: TLSocket);
begin
  log_terminal('Connection lost: Port' + port2);
  EditPort2.Color := clNone;
  //EditPort2.Enabled := true;
end;

procedure TFormMain.LTCP1Error(const msg: string; aSocket: TLSocket);
begin
  log_terminal(msg+' Port '+port2);
end;

procedure TFormMain.LTCP1Receive(aSocket: TLSocket);
var s: string;
begin
  if aSocket.GetMessage(s) > 0 then
  begin
    request_cb := 0;
    //filter_msg(s);
    Edit_TTYS_receivemsg.Text:= s;
    log_terminal('received on Port '+port2+':'+s);
  end;
end;

procedure TFormMain.MemoTextChange(Sender: TObject);
var
  grenze : Integer;
begin
  // Wie viele Zeilen darf das Memo nicht überschreiten
  grenze := 100;
  if MemoText.Lines.Count > grenze then
    MemoText.Lines.Delete(0);
end;

procedure TFormMain.Memo_log_commonChange(Sender: TObject);
var
  grenze : Integer;
begin
  // Wie viele Zeilen darf das Memo nicht überschreiten
  grenze := 500;
  if Memo_log_common.Lines.Count > grenze then
    Memo_log_common.Lines.Delete(0);
end;

procedure TFormMain.PageControl1Change(Sender: TObject);
begin
  command_stack_bs.Clear;
  request_bs := 0;
end;

procedure TFormMain.Panel_bsNoAnswerClick(Sender: TObject);
begin
  bs_errorcounter := 0;
  l_errorcount.Caption := IntToStr(bs_errorcounter);
end;

procedure TFormMain.rg_BsAdrClick(Sender: TObject);
begin
  command_stack_bs.Clear;
  request_bs := 0;
  //current_adr := rg_BsAdr.ItemIndex + 1;
end;

procedure TFormMain.b_set_defaultClick(Sender: TObject);
begin
  setdefault;
end;

procedure TFormMain.b_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.B_save_logClick(Sender: TObject);
var logfile : string;
begin
  logfile := ExtractFileDir(Application.ExeName) + '\cb_config_'+ FormatDateTime('yy-mm-dd_hh_mm_ss',now)+'.log';
  If MemoText.Lines.Count > 0 then
  begin
    MemoText.Lines.SaveToFile(logfile);
    MemoText.Clear;
    ShowMessage('logfile saved in '+ logfile);
  end;
end;

procedure TFormMain.log_terminal(s:string);
begin
  //if (Panel_terminal.Visible and terminal_log) then MemoText.Append(TimeToStr(Now)+ #9 + s);
  if (terminal_log) then MemoText.Append(FormatDateTime('hh:mm:ss z',now)+ #9 + s);
end;

procedure TFormMain.log_common(s:string);
var s1, logfilename : string;
begin
  inc(act_linenr);
  s1 := intToStr(act_linenr)+ #9 +FormatDateTime('hh:mm:ss z',now)+ #9 + s;
  logfilename := 'cb-config_bs-test_'+FormatDateTime('YYYY-MM-DD',now)+'.log';
  //if (Panel_terminal.Visible and terminal_log) then MemoText.Append(TimeToStr(Now)+ #9 + s);

  Memo_log_common.Append(s1);
  WriteLog(s,logfilename);
end;



procedure TFormMain.releaseBox(boxnr:integer);
var s : string;
begin
  //s1 := 'B11' + #$F0 + #$00 + #$01 + #$02 + #$7C + #$00 + #$F1 + #$A0;

  s := GetBS500FV100SendeString(rg_BsAdr.ItemIndex,boxnr,bsFachfreigabe);
  command_stack_bs.Add(s);
  ActiveBox := boxnr;
  log_common('RELEASE; Adr '+IntToStr(rg_BsAdr.ItemIndex)+'; Box '+ IntToStr(boxnr));
end;

procedure TFormMain.lockBox(boxnr:integer);
var s : string;
begin
  if ((ActiveBox >= 0) and (ActiveBox < 500)) then
    s := GetBS500FV100SendeString(rg_BsAdr.ItemIndex,ActiveBox,bsFachverriegelung) else // letzte aktive Fachnummer verriegeln
    s := GetBS500FV100SendeString(rg_BsAdr.ItemIndex,boxnr,bsFachverriegelung); // sonst aus dem übergebenen Wert
  command_stack_bs.Add(s);
  ActiveBox := -1;
  //log_common('Box '+ IntToStr(boxnr)+' lock');
  log_common('LOCK; Adr '+IntToStr(rg_BsAdr.ItemIndex)+'; Box '+ IntToStr(boxnr));
end;

procedure TFormMain.box1Click(Sender: TObject);
begin
  current_box := StrToInt(Edit_box.Text);
  releaseBox(current_box);
end;

procedure TFormMain.Chb_ttysendChange(Sender: TObject);
begin
  Timer_ttysend.Enabled:= Chb_ttysend.Checked;
end;

procedure TFormMain.Button_lockClick(Sender: TObject);
begin
  current_box := StrToInt(Edit_box.Text);
  lockBox(current_box);
  TB_sequence.Checked := false;
  TB_perm_rel.Checked := false;
end;



procedure TFormMain.Button_PollClick(Sender: TObject);

begin
  //timer_poll.Enabled := NOT timer_poll.Enabled;
  terminal_log := NOT terminal_log;
end;

procedure TFormMain.poll_bs;
var s : string;
begin

  if (command_stack_bs.Count = 0) then // vorrangig den Stack abarbeiten, erst dann Pollen
      begin
        //s := GetBS500FV100SendeString((current_BsAdr -1),StrToInt(Edit_box.Text),bsGetState); // Langer Poll
        s := GetBS500FV100SendeString(rg_BsAdr.ItemIndex,StrToInt(Edit_box.Text),bsGetState); // Langer Poll
        command_stack_bs.Add(s); // hier wird der Pollbefehl reingeschrieben
        //log_terminal('Adr '+ IntToStr(current_BsAdr));
      end;
      inc(request_bs);
      l_sendcount.Caption:= IntToStr(request_bs);
      //l_sendcount.Caption:= IntToStr(command_stack_bs.Count);
      if(send_method.ItemIndex = 0)then  // TCP
      begin
        send_CB(command_stack_bs[0]);
      end else
      if(send_method.ItemIndex = 1)then  // seriell
      begin
        serialTransmit(command_stack_bs[0]);
      end;


      ProgressBar1.Position:=request_bs;

      if(request_bs > 1)then
      begin
        inc(bs_errorcounter);
        l_errorcount.Caption := IntToStr(bs_errorcounter);
      end;

      if(request_bs >= 5)then
      begin
        Panel_bsNoAnswer.Color := clRed;  Panel_bsNoAnswer.Caption:= 'offline';
        if(request_bs = 5) then
        begin
         Init_StringGrid;
         log_common('OFFLINE; Adr '+IntToStr(rg_BsAdr.ItemIndex)+';'); // beim Ersten Offline mitmeißeln
        end;
      end;
      //Panel_bsNoAnswer.Color := clSilver;
end;




procedure TFormMain.get_ip();
begin
  // Befehlskette für alle nötigen Speicherzellen
  // IP
  command_stack.Add('E08R0020');
  command_stack.Add('E08R0021');
  command_stack.Add('E08R0022');
  command_stack.Add('E08R0023');
  // gateway
  command_stack.Add('E08R0024');
  command_stack.Add('E08R0025');
  command_stack.Add('E08R0026');
  command_stack.Add('E08R0027');
  // Port 0
  command_stack.Add('E08R0028');
  command_stack.Add('E08R0029');
  // Port 1
  command_stack.Add('E08R002A');
  command_stack.Add('E08R002B');
  // Subnet mask
  command_stack.Add('E08R002C');
  command_stack.Add('E08R002D');
  command_stack.Add('E08R002E');
  command_stack.Add('E08R002F');
  // MAC adresse
  command_stack.Add('E08R0030');
  command_stack.Add('E08R0031');
  command_stack.Add('E08R0032');
  command_stack.Add('E08R0033');
  command_stack.Add('E08R0034');
  command_stack.Add('E08R0035');

  // firmware version
  command_stack1.Add('V03');

  //FNet1.SendMessage('V03');
  send_command();
  b_iswritten := False;
end;

procedure TFormMain.get_brdversion();
begin
  // firmware version
  command_stack.Add('V03');
  send_command();
end;

procedure TFormMain.send_methodClick(Sender: TObject);
begin

  case send_method.ItemIndex of
  0:begin
    combobox_comport.Enabled:= false;
    EditIP.Enabled:=true;
    EditPort.Enabled:=true;
    EditPort2.Enabled:=true;
    Tab_EEProm.Enabled:=true;
   end;
  1:begin
    combobox_comport.Enabled:= true;
    EditIP.Enabled:=false;
    EditPort.Enabled:=false;
    EditPort2.Enabled:=false;
    Tab_EEProm.Enabled := false;
   end;
 end;


end;

procedure TFormMain.set_ip();
var
  port: string;
begin
  // IP
  command_stack.Add('E10W0020' + IntToHex(StrToInt(Edit_IP_1.Text), 2));
  command_stack.Add('E10W0021' + IntToHex(StrToInt(Edit_IP_2.Text), 2));
  command_stack.Add('E10W0022' + IntToHex(StrToInt(Edit_IP_3.Text), 2));
  command_stack.Add('E10W0023' + IntToHex(StrToInt(Edit_IP_4.Text), 2));
  // Gateway
  command_stack.Add('E10W0024' + IntToHex(StrToInt(Edit_IP_gw1.Text), 2));
  command_stack.Add('E10W0025' + IntToHex(StrToInt(Edit_IP_gw2.Text), 2));
  command_stack.Add('E10W0026' + IntToHex(StrToInt(Edit_IP_gw3.Text), 2));
  command_stack.Add('E10W0027' + IntToHex(StrToInt(Edit_IP_gw4.Text), 2));
  // Port 0
  port := IntToHex(StrToInt(Edit_IP_port0.Text), 4);
  command_stack.Add('E10W0028' + copy(port, 1, 2)); // HSB
  command_stack.Add('E10W0029' + copy(port, 3, 2)); // LSB
  // Port 1
  port := IntToHex(StrToInt(Edit_IP_port1.Text), 4);
  command_stack.Add('E10W002A' + copy(port, 1, 2)); // HSB
  command_stack.Add('E10W002B' + copy(port, 3, 2)); // LSB
  // Subnet Mask
  command_stack.Add('E10W002C' + IntToHex(StrToInt(Edit_IP_sn1.Text), 2));
  command_stack.Add('E10W002D' + IntToHex(StrToInt(Edit_IP_sn2.Text), 2));
  command_stack.Add('E10W002E' + IntToHex(StrToInt(Edit_IP_sn3.Text), 2));
  command_stack.Add('E10W002F' + IntToHex(StrToInt(Edit_IP_sn4.Text), 2));
  // MAC
  command_stack.Add('E10W0030' + Edit_IP_mac1.Text);
  command_stack.Add('E10W0031' + Edit_IP_mac2.Text);
  command_stack.Add('E10W0032' + Edit_IP_mac3.Text);
  command_stack.Add('E10W0033' + Edit_IP_mac4.Text);
  command_stack.Add('E10W0034' + Edit_IP_mac5.Text);
  command_stack.Add('E10W0035' + Edit_IP_mac6.Text);

  send_command();
  b_iswritten := True;
  ini_write('EEPROM', 'LAST_MAC_ENUM', s_last_number);
end;

procedure TFormMain.filter_msg(const aMsg: string);
var
  command, bs_string: string;
begin
  command := copy(aMsg, 0, 1);
  bs_string := '';
  if (command = 'E') then
  begin
    // IP
    log_terminal('CB->Host ('+EditPort.Text+'): ' + #9 + aMsg);
    if (copy(aMsg, 4, 4) = '0020') then
      Edit_IP_1.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    if (copy(aMsg, 4, 4) = '0021') then
      Edit_IP_2.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    if (copy(aMsg, 4, 4) = '0022') then
      Edit_IP_3.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    if (copy(aMsg, 4, 4) = '0023') then
      Edit_IP_4.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    // Gateway
    if (copy(aMsg, 4, 4) = '0024') then
      Edit_IP_gw1.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    if (copy(aMsg, 4, 4) = '0025') then
      Edit_IP_gw2.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    if (copy(aMsg, 4, 4) = '0026') then
      Edit_IP_gw3.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    if (copy(aMsg, 4, 4) = '0027') then
      Edit_IP_gw4.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
      {
      // Port 0
      if (copy(aMsg,4,4) = '0028')then Edit_IP_port0.Text := IntToStr(HexToInt(copy(aMsg,8,2)));
      if (copy(aMsg,4,4) = '0029')then Edit_IP_port0_2.Text := IntToStr(HexToInt(copy(aMsg,8,2)));
      // Port 1
      if (copy(aMsg,4,4) = '002A')then Edit_IP_port1.Text := IntToStr(HexToInt(copy(aMsg,8,2)));
      if (copy(aMsg,4,4) = '002B')then Edit_IP_port1_2.Text := IntToStr(HexToInt(copy(aMsg,8,2)));
      }

    if (copy(aMsg, 4, 4) = '0028') then
      temp_string := copy(aMsg, 8, 2);
    if (copy(aMsg, 4, 4) = '0029') then
    begin
      temp_string := temp_string + copy(aMsg, 8, 2);
      Edit_IP_port0.Text := IntToStr(HexToInt(temp_string));
      temp_string := '';
    end;
    // Port 1
    if (copy(aMsg, 4, 4) = '002A') then
      temp_string := copy(aMsg, 8, 2);
    if (copy(aMsg, 4, 4) = '002B') then
    begin
      temp_string := temp_string + copy(aMsg, 8, 2);
      Edit_IP_port1.Text := IntToStr(HexToInt(temp_string));
      temp_string := '';
    end;

    // Subnet
    if (copy(aMsg, 4, 4) = '002C') then
      Edit_IP_sn1.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    if (copy(aMsg, 4, 4) = '002D') then
      Edit_IP_sn2.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    if (copy(aMsg, 4, 4) = '002E') then
      Edit_IP_sn3.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    if (copy(aMsg, 4, 4) = '002F') then
      Edit_IP_sn4.Text := IntToStr(HexToInt(copy(aMsg, 8, 2)));
    // MAC
    if (copy(aMsg, 4, 4) = '0030') then
      Edit_IP_mac1.Text := copy(aMsg, 8, 2);
    if (copy(aMsg, 4, 4) = '0031') then
      Edit_IP_mac2.Text := copy(aMsg, 8, 2);
    if (copy(aMsg, 4, 4) = '0032') then
      Edit_IP_mac3.Text := copy(aMsg, 8, 2);
    if (copy(aMsg, 4, 4) = '0033') then
      Edit_IP_mac4.Text := copy(aMsg, 8, 2);
    if (copy(aMsg, 4, 4) = '0034') then
      Edit_IP_mac5.Text := copy(aMsg, 8, 2);
    if (copy(aMsg, 4, 4) = '0035') then
      Edit_IP_mac6.Text := copy(aMsg, 8, 2);
    // Firmware Version
  end else
  if (command = 'V') then
  begin
    brd_version := copy(aMsg, 4, 20);
    Edit_version.Text := brd_version;
    log_terminal('CB->Host ('+EditPort.Text+'): ' + #9 + aMsg);
    if (copy(brd_version,0,5) = 'SDLCB')then
    begin
       GroupBox_EE.Enabled:= false;
       b_webconfig.Enabled:= true;
    end else
    begin
       GroupBox_EE.Enabled:= true;
       b_webconfig.Enabled:= false;
    end;
  end else
  if (command = 'B') then
  begin
    bs_string := get_escape(copy(aMsg, 4, length(aMsg)-3));
    //log_terminal('BS->HOST ('+EditPort.Text+'): ' + #9 + copy(aMsg, 0, 3) + ' ' + get_HexStr(bs_string));
    filter_bs(bs_string);
  end else
  if (command = 'I') then
  begin
    // IP
    log_terminal('CB->Host ('+EditPort.Text+'): ' + #9 + aMsg);
    get_IO(copy(aMsg, 4, 8));
  end;
end;

procedure TFormMain.filter_bs(const bs_string: string );
begin
   //
    // bei gültiger Antwort commandstack löschen und counter zurück
      request_bs := 0; // response erhalten, rücksetzen
      if (command_stack_bs.Count > 0) then command_stack_bs.Delete(0); // Wie FIFO: oben drauf und unten weg
      Panel_bsNoAnswer.Color:= clLime; Panel_bsNoAnswer.Caption:= 'online'; Panel_bsNoAnswer.Font.Color:= clBlack;

    //
    log_terminal('BS500 ->HOST '+ #9 + get_HexStr(bs_string));
    l_sendcount.Caption := IntToStr(request_bs);
    //l_sendcount.Caption:= IntToStr(command_stack_bs.Count);
    ProgressBar1.Position:=request_bs;
    get_boxinfo(bs_string);
end;

// Auswerten der Boxinformationen
procedure TFormMain.get_boxinfo(aMsg:string);
var b,box_byte : byte;
  i,i1,boxnr : integer;
begin

  i := 0; i1 := 0;
  boxnr := 0;
  if length(aMsg) > 3 then
  begin

    if(aMsg[3] = #$E7)then  // Long Message
    begin

      for i1 := 0 to 62 do
      begin
        b := $80;
        box_byte := byte(aMsg[i1 + 4]); // Adressierung der Bytes im String: ab Byte 4 gehts los
        for i := 0 to 7 do
        begin
            if boxnr < 500 then
            begin
              if (box_byte and b = b) then
              begin
                // Fach Offen !
                // wenn es zu war, das öffnen protokollieren
                if (arr_boxes[boxnr] = true)then
                begin
                  //log_common('Box '+IntToStr(boxnr) + ' state changed closed => open');
                  log_common('state changed CLOSED => OPEN; Adr '+IntToStr(rg_BsAdr.ItemIndex)+'; Box '+ IntToStr(boxnr));
                end;
                arr_boxes[boxnr] := false;
                //checkGroup_boxes.Checked[boxnr] := false;
                selectCell(boxnr, false);

              end else
              begin
                // Fach geschlossen !
                // wenn es offen war, das schließen protokollieren
                if (arr_boxes[boxnr] = false)then
                begin
                  //log_common('Box '+IntToStr(boxnr) + ' state changed open => closed');
                  log_common('state changed OPEN => CLOSED; Adr '+IntToStr(rg_BsAdr.ItemIndex)+'; Box '+ IntToStr(boxnr));
                end;
                arr_boxes[boxnr] := true;
                //checkGroup_boxes.Checked[boxnr] := true;
                selectCell(boxnr, true);

              end;
              b := b shr 1;
              inc(boxnr);
            end;
        end;
      end;
    end;

  end else
  begin
    //Init_StringGrid;
  end;

  // Wenn ein Fach angesteuert wird, aber dessen Tür offen ist, erlischt die Freigabe wieder auf der BS500
  if (arr_boxes[ActiveBox] = false) then ActiveBox := -1;

  if TB_sequence.Checked then
  begin
    TB_perm_rel.Checked := false;
    if arr_boxes[current_box] then
    begin
      if ActiveBox = -1 then
      begin
        releaseBox(current_box);

      end;
    end else
    begin
      //log_common('Box '+IntToStr(current_box)+' is open');
      if (current_box > 499)then current_box := 0 else inc(current_box);

    end;
  end else
  if TB_perm_rel.Checked then
  begin
    // Sequenztest ausmachen
    TB_sequence.Checked := false;
    // immer current box ansteuern ohne Pause
    releaseBox(current_box);
  end;



  //Edit_TTYS_sendmsg.Text:= IntToStr(length(aMsg));
end;


procedure TFormMain.Timer_pollTimer(Sender: TObject);
begin
  if PageControl1.PageIndex = 1 then
  begin
    poll_bs;
    if TB_sequence.Checked then
    begin

    end;
  end else
  begin

  end;

end;

procedure TFormMain.set_IO();
var
  s_io: string;
begin
  s_io := '00000000';
  if chk_out1.Checked then
    s_io[1] := '1'
  else
    s_io[1] := '0';
  if chk_out2.Checked then
    s_io[2] := '1'
  else
    s_io[2] := '0';
  if chk_out3.Checked then
    s_io[3] := '1'
  else
    s_io[3] := '0';
  if chk_out4.Checked then
    s_io[4] := '1'
  else
    s_io[4] := '0';
  if chk_out5.Checked then
    s_io[5] := '1'
  else
    s_io[5] := '0';
  if chk_out6.Checked then
    s_io[6] := '1'
  else
    s_io[6] := '0';
  if chk_out7.Checked then
    s_io[7] := '1'
  else
    s_io[7] := '0';
  if chk_out8.Checked then
    s_io[8] := '1'
  else
    s_io[8] := '0';
  command_stack.Add('I11' + s_io);
  send_command();
end;


procedure TFormMain.get_IO(s_io: string);
begin

  if s_io[1] = '1' then
    chk_in1.Checked := true
  else
    chk_in1.Checked := false;
  if s_io[2] = '1' then
    chk_in2.Checked := true
  else
    chk_in2.Checked := false;
  if s_io[3] = '1' then
    chk_in3.Checked := true
  else
    chk_in3.Checked := false;
  if s_io[4] = '1' then
    chk_in4.Checked := true
  else
    chk_in4.Checked := false;
  if s_io[5] = '1' then
    chk_in5.Checked := true
  else
    chk_in5.Checked := false;
  if s_io[6] = '1' then
    chk_in6.Checked := true
  else
    chk_in6.Checked := false;
  if s_io[7] = '1' then
    chk_in7.Checked := true
  else
    chk_in7.Checked := false;
  if s_io[8] = '1' then
    chk_in8.Checked := true
  else
    chk_in8.Checked := false;
end;

procedure TFormMain.ConnectButtonClick(Sender: TObject);
begin
 port2 :=  EditPort2.Text;
 Tab_TTYS.Caption:= 'TTYS Port '+port2 ;
 case send_method.ItemIndex of
 0:begin

     if FNet1.Connect(EditIP.Text, StrToInt(port2)) then
     begin
       FIsserer := False;
       connectTTY;
     end;

     if FNet.Connect(EditIP.Text, StrToInt(EditPort.Text)) then
     begin
       FIsserer := False;
     end;
   end;
 1:serialConnect;
 end;
  {sleep(1000) ;
    if FNet.Connected = false then // Nochmal auf Verbindung prüfen
    log_terminal('no connection to ' + EditIP.Text + ':' + EditPort.Text);
  }
end;


procedure TFormMain.LTCPComponentConnect(aSocket: TLSocket);
begin
  log_common('Connected Port '+ EditPort.Text+' to remote host');
  EditPort.Color := clLime;
  EditPort.Enabled := false;
  Timer_poll.Enabled:= true;
  command_stack.Clear;
  command_stack_bs.Clear;
  // if FNet.Connected then get_ip();
  if FNet.Connected then get_brdversion();
end;

procedure TFormMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;

  if FNet.Connected then
  begin
    CloseAction := caNone; // make sure we quit gracefuly
    FNet.Disconnect; // call disconnect (soft)
    FNet1.Disconnect;
    serialDisconnect;
    TimerQuit.Enabled := True; // if time runs out, quit ungracefully
  end;

  ini_write('HOST', 'IP', EditIP.Text);
  ini_write('HOST', 'PORT', EditPort.Text);
  ini_write('HOST', 'PORT2', EditPort2.Text);
end;


procedure TFormMain.b_get_ipClick(Sender: TObject);
begin
  get_ip();
end;


procedure TFormMain.LTCPComponentError(const msg: string; aSocket: TLSocket);
begin
  log_common(msg+' Port '+EditPort.Text);
  MemoText.SelStart := Length(MemoText.Lines.Text);
end;

procedure TFormMain.LTCPComponentAccept(aSocket: TLSocket);
begin
  log_common('Connection accepted');
  //MemoText.SelStart := Length(MemoText.Lines.Text);
end;

// Empfangen über Communication board
procedure TFormMain.LTCPComponentReceive(aSocket: TLSocket);
var
  s: string;
begin
  if aSocket.GetMessage(s) > 0 then
  begin
    request_cb := 0;
    filter_msg(s);
    //MemoText.SelStart := Length(MemoText.Lines.Text);
    // Wenn ein Response kommt, kucken ob weitere befehle anliegen und abarbeiten
    if (command_stack.Count > 0) then send_command;
    //if FNet is TLUdp then begin // echo to sender if UDP
    //  if FIsserer then
    //    FNet.SendMessage(s);
    //end else if FIsserer then // echo to all if TCP

    //if FIsserer then
    //  SendToAll(s);
  end;
end;

procedure TFormMain.LTcpComponentDisconnect(aSocket: TLSocket);
begin
  log_common('Connection lost: Port' + EditPort.Text);
  MemoText.SelStart := Length(MemoText.Lines.Text);
  Timer_poll.Enabled:= false;
  EditPort.Color := clNone;
  EditPort.Enabled := true;
  brd_version := '';
  Edit_version.Text := brd_version;
  b_webconfig.Enabled:= false;
end;

procedure TFormMain.MenuItemAboutClick(Sender: TObject);
begin
  MessageDlg('config tool for setting of communicationboard and test of IO' +
  #13#10 + 'test tool for SDL-Boxes on BS500 over communicationboard or serial connection' +
    #13#10 +#13#10 + VERSION + #13#10 + 'GUNNEBO 2012-2018 Dirk Hanisch',
    mtInformation, [mbOK], 0);
end;

procedure TFormMain.MenuItemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.SendButtonClick(Sender: TObject);
begin
  if Length(EditSend.Text) > 0 then
  begin
      FNet.SendMessage(EditSend.Text);
  end;
end;

procedure TFormMain.DiconnectButtonClick(Sender: TObject);
begin
 case send_method.ItemIndex of
 0:begin
     FNet.Disconnect;
     FNet1.Disconnect;
     log_common('TCP connection Disconnected');
   end;
 1:begin
     serialDisconnect;
   end;

 end;
 command_stack_bs.Clear;
 Panel_bsNoAnswer.Color:= clSilver; Panel_bsNoAnswer.Caption:= 'offline';
 Timer_poll.Enabled:=false;
 Init_StringGrid;
end;




procedure TFormMain.Button_terminalClick(Sender: TObject);
begin
  if Panel_terminal.Visible then
  begin
    ini_write('GUI', 'SHOW_TERMINAL', '0');
    show_Terminal(false);
  end
  else
  begin
    ini_write('GUI', 'SHOW_TERMINAL', '1');
    show_Terminal(true);
  end;
end;

procedure TFormMain.show_Terminal(term_state:boolean);
begin
  if term_state then
  begin
    Panel_terminal.Visible := True;
    //FormMain.Height := FormMain.Height + Panel_terminal.Height + 10;
    FormMain.Height := FORMHEIGHT;

  end
  else
  begin
    Panel_terminal.Visible := False;
    //FormMain.Height := FormMain.Height - Panel_terminal.Height - 10;
    FormMain.Height := FORMHEIGHT - Panel_terminal.Height - 10;
  end;
end;

procedure TFormMain.SendEditKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
    SendButtonClick(Sender);
end;

procedure TFormMain.StringGrid1Click(Sender: TObject);
begin
  Edit_box.Text := IntToStr(current_box);
end;




procedure TFormMain.StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin
  current_box := StrToInt(StringGrid1.Cells[aCol, aRow]);
end;

procedure TFormMain.Tab_EEPromContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;




procedure TFormMain.TimerQuitTimer(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.SendToAll(const aMsg: string);
var
  n: integer;
begin
  if FNet is TLUdp then
  begin // UDP, use broadcast
    n := TLUdp(FNet).SendMessage(aMsg, LADDR_BR);
    if n < Length(aMsg) then
      log_terminal('Error on send [' + IntToStr(n) + ']');
  end
  else
  begin // TCP
    FNet.IterReset; // start at serer socket
    while FNet.IterNext do
    begin // skip serer socket, go to clients only
      n := FNet.SendMessage(aMsg, FNet.Iterator);
      if n < Length(aMsg) then
        log_terminal('Error on send [' + IntToStr(n) + ']');
    end;
  end;
end;

function TFormMain.Ini_Read(section: string; key: string): string;
var
  IniDat: TIniFile; // Initialisierungsdatei
  s: string;
begin
  s := '';
  // Datei öffnen und erstellen
  IniDat := TIniFile.Create(Ini_File);
  with IniDat do
  begin
    s := ReadString(section, key, s);
  end;
  IniDat.Free;
  Result := s;
end;

procedure TFormMain.Ini_Write(section: string; key: string; Value: string);
var
  IniDat: TIniFile; // Initialisierungsdatei
begin
  // Datei öffnen und erstellen
  IniDat := TIniFile.Create(Ini_File);
  with IniDat do
  begin
    WriteString(section, key, Value);
  end;
  IniDat.Free;
end;

procedure TFormMain.setdefault;
var
  hexstring: string;
  i_last_number: integer;

  //maclist : TArrayOfString;
begin

  s_last_number := ini_read('EEPROM', 'LAST_MAC_ENUM');
  i_last_number := StrToInt(s_last_number) + 1;
  s_last_number := IntToStr(i_last_number);

  hexstring := Format('%.06X', [i_last_number]); // grosse Buchstaben A-F in der Hexzahl

  Edit_IP_1.Text := '192';
  Edit_IP_2.Text := '168';
  Edit_IP_3.Text := '1';
  Edit_IP_4.Text := '126';

  Edit_IP_gw1.Text := '192';
  Edit_IP_gw2.Text := '168';
  Edit_IP_gw3.Text := '1';
  Edit_IP_gw4.Text := '1';

  Edit_IP_sn1.Text := '255';
  Edit_IP_sn2.Text := '255';
  Edit_IP_sn3.Text := '255';
  Edit_IP_sn4.Text := '0';

  Edit_IP_port0.Text := '5000';
  Edit_IP_port1.Text := '5001';

  if copy(s_mac_vendor, 1, 2) = '' then
    Edit_IP_mac1.Text := '0C'
  else
    Edit_IP_mac1.Text := copy(s_mac_vendor, 1, 2);
  if copy(s_mac_vendor, 4, 2) = '' then
    Edit_IP_mac2.Text := '0C'
  else
    Edit_IP_mac2.Text := copy(s_mac_vendor, 4, 2);
  if copy(s_mac_vendor, 7, 2) = '' then
    Edit_IP_mac3.Text := '11'
  else
    Edit_IP_mac3.Text := copy(s_mac_vendor, 7, 2);

  Edit_IP_mac4.Text := copy(hexstring, 1, 2); // 1. Teil
  Edit_IP_mac5.Text := copy(hexstring, 3, 2); // 2. Teil
  Edit_IP_mac6.Text := copy(hexstring, 5, 2); // 3. Teil

end;

procedure TFormMain.serialConnect;
var
portnr : string;
parity : char;
baud,bits,stop : integer;
softflow : boolean;
hardflow : boolean;

begin
  if connected_com then
  begin
    log_common('Serial: connection already exists');
    exit;
  end;
  ser:=TBlockSerial.create;
  if(CurrentOS = 'linux')then portnr := 'TTYS'+combobox_comport.Text else portnr := 'COM'+combobox_comport.Text;

  parity := 'N';
  baud := 4096;
  bits := 8;
  stop := SB1;
  softflow := false;
  hardflow := false;
  ser.Connect(portnr);
  //ShowMessage('Device: ' + ser.Device + '   Status: ' + ser.LastErrorDesc +' '+Inttostr(ser.LastError));
  sleep(1000);
  ser.Config(baud, bits, parity, stop, softflow, hardflow);

  sleep(1000);

  if ser.LastError = 0 then
  begin
    connected_com := True;
    log_common('Serial: '+ser.Device +': connection established   Status: ' + ser.LastErrorDesc);
    Timer_poll.Enabled:= true;
  end
  else
  log_common('Serial: no connection possible to '+portnr);
end;

procedure TFormMain.serialDisconnect;
begin
  if (connected_com) then
  ser.CloseSocket();
  connected_com := false;
  log_terminal('serial connection disconnected');
  log_common('serial connection disconnected');
end;

procedure TFormMain.serialReceive;
var
timeout : integer;
signal : string;
begin

 timeout := 500;
 signal := '';
  if ser.CanRead(250) then
  begin
    if ser.LastError <> 0 then
    begin
      memoText.Lines.Add(IntToStr(ser.LastError));
    end else
    begin
      signal := ser.RecvPacket(Timeout);

      //MemoText.Lines.add(signal);
      request_cb := 0;
      //MemoText.Lines.add(get_HexStr(signal));
      //filter_bs(signal);
      //bs_string := get_escape(copy(aMsg, 4, length(aMsg)-3));
      signal := get_escape(signal);
      filter_bs(signal);
    // Wenn ein Response kommt, kucken ob weitere befehle anliegen und abarbeiten
    if (command_stack_BS.Count > 0) then serialTransmit(command_stack_BS[0]);
    end;
  end;

end;

procedure TFormMain.Timer_ttysendTimer(Sender: TObject);
begin
  Edit_TTYS_receivemsg.Text:= '';
  FNet1.SendMessage(Edit_TTYS_sendmsg.Text);
end;



procedure TFormMain.serialTransmit(s:string);
var
befehl, data, signal : string;
begin
  //data   := s+#13#10;
  data   := s;
  log_terminal('Host->BS500 ('+intToStr(rg_BsAdr.ItemIndex +1)+'): ' + #9 + get_HexStr(s));
  ser.SendString(data);
  serialReceive;
end;

// Testfunktion
procedure TFormMain.connectTTY;
var ttys_header , msg : string;
i1 : integer;
conn_abort:boolean;
begin
 conn_abort := false;
 i1 := 0;
 //ttys_header := '{"Speed":9600,"DataBits":8,"StopBits":1,"Parity":"NONE","FlowControl": "NONE","HalfDuplex": false}'+ #10;
 ttys_header := '{"Speed":9600,"FlowControl": "NONE","HalfDuplex": false,"Parity":"NONE"}'+ #10;
 //ttys_header := '{"Speed" : '+ Combo_baudTTYS.Text +'}'+ #13#10;
  msg := ttys_header;

  repeat
    i1 := i1 + 1;
    sleep(100);
    // 100 mal probieren
    if i1 > 100 then
    begin
     log_terminal('TTY Connection not ready' + #9 + ' trials: ' + intToStr(i1));
     log_common('TTY Connection not ready' + #9 + ' trials: ' + intToStr(i1));
     conn_abort := true;
    end;
    Application.ProcessMessages;
  until FNet1.Connected or conn_abort = true;



  if conn_abort = false then
  begin

    FNet1.SendMessage(msg);
    log_terminal('Host->CB ('+port2+'): ' + #9 + msg + ' trials: ' + intToStr(i1));
    log_common('TTY Connection to '+port2+' ready' + #9);
  end;
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
 Edit_TTYS_receivemsg.Text:= '';
 FNet1.SendMessage(Edit_TTYS_sendmsg.Text);
end;


initialization
  {$I main.lrs}
  {$I cb_config.lrs}

end.
