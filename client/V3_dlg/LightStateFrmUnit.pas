unit LightStateFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, CarUnit, uGloabVar, GatewayServerUnit,
  CmdStructUnit, Menus;

type
  TLightStateFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn_List100: TBitBtn;
    BitBtn_Clr: TBitBtn;
    Panel3: TPanel;
    EventListView: TListView;
    Panel4: TPanel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel6: TPanel;
    LEDListView: TListView;
    Panel7: TPanel;
    Panel8: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel9: TPanel;
    LCDListView: TListView;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel12: TPanel;
    TSMListView: TListView;
    Panel13: TPanel;
    Panel14: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel15: TPanel;
    metersListView: TListView;
    TabSheet6: TTabSheet;
    Panel16: TPanel;
    Panel17: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Panel18: TPanel;
    MCUListView: TListView;
    TabSheet7: TTabSheet;
    Panel19: TPanel;
    Panel20: TPanel;
    PollingListView: TListView;
    Memo1: TMemo;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N101: TMenuItem;
    Panel21: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    procedure BitBtn_ClrClick(Sender: TObject);
    procedure BitBtn_List100Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EventListViewColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure LEDListViewColumnClick(Sender: TObject; Column: TListColumn);
    procedure LCDListViewColumnClick(Sender: TObject; Column: TListColumn);
    procedure TSMListViewColumnClick(Sender: TObject; Column: TListColumn);
    procedure metersListViewColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure MCUListViewColumnClick(Sender: TObject; Column: TListColumn);
    procedure PollingListViewClick(Sender: TObject);
    procedure PollingListViewColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure N1Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure PollingListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    { Private declarations }

  public
    { Public declarations }
    MCU: string;
    LED: string;
    LCD: string;
    TSM: string;
    METER: string;
    MCU2: string;
    procedure OnRcvLightStateListupLoad(QueryType: Byte; ADev: TObject; Buf: PByte);
    function PtrAdd(p: pointer; offset: integer): pointer;
    procedure DisplayMCU(ADev: TObject; Buf: PByte);    // 顶灯
    procedure DisplayLED(ADev: TObject; Buf: PByte);
    procedure DisplayLCD(ADev: TObject; Buf: PByte);
    procedure DisplayTSM(ADev: TObject; Buf: PByte);
    procedure DisplayMeter(ADev: TObject; Buf: PByte);
    procedure DisplayMCU2(ADev: TObject; Buf: PByte);   // MCU
    procedure DisplayPolling_MCU(ADev: TObject; Buf: PByte);

    procedure DisplayMCU_Polling(ADev: TObject; Buf: PByte; len: Integer);   // 顶灯
    procedure DisplayLED_Polling(ADev: TObject; Buf: PByte;  len: Integer);
    procedure DisplayLCD_Polling(ADev: TObject; Buf: PByte; len: Integer);
    procedure DisplayTSM_Polling(ADev: TObject; Buf: PByte; len: Integer);
    procedure DisplayMeter_Polling(ADev: TObject; Buf: PByte; len: Integer);
    procedure DisplayMCU2_Polling(ADev: TObject; Buf: PByte; len: Integer);  // MCU

    function isAllZero(ABuff: Pointer; len: Integer): Boolean;

  end;

var
  LightStateFrm: TLightStateFrm;

implementation
uses umainf;
{$R *.dfm}

function TLightStateFrm.isAllZero(ABuff: Pointer; len: Integer): Boolean;
var
  i: Integer;
  offset: Integer;
begin
  Result := False;
  offset := 0;
  for i:=0 to len - 1 do
  begin
    if PByte(ABuff)^ = 0 then
      offset := offset + 1;
    inc(PByte(ABuff));
  end;
  if offset = len then
    Result := True;
end;

function TLightStateFrm.PtrAdd(p: pointer; offset: integer): pointer;
begin
  Result := Pointer(Integer(p) + offset);
end;

procedure TLightStateFrm.DisplayMCU(ADev: TObject; Buf: PByte);
var
  node: TListItem ;
  temp: string;
begin
  if EventListView.Items.Count =0 then
  begin
    with EventListView.Items.Add  do
    begin
      Caption:=TDevice(ADev).IdStr;
      SubItems.Add(TDevice(ADev).Car.No);

      SubItems.Add(BCDToStr1(Buf, 5));
      Buf := PtrAdd(Buf, 5);

      SubItems.Add(IntToHex(Buf^, 2));
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);
      SubItems.Add(temp);

      Buf := PtrAdd(Buf, 1);
      case Buf^ of
        $00: SubItems.Add('设备正常');
        $10..$1F: SubItems.Add('工作异常，需进行复位');
      else
        begin
          SubItems.Add('RFU');
        end;
      end;

      Buf := PtrAdd(Buf, 1);
      case Buf^ of
        $00: SubItems.Add('空车');
        $01: SubItems.Add('重车');
        $02: SubItems.Add('停运');
        $03: SubItems.Add('电招');
        $04: SubItems.Add('报警');
        $05: SubItems.Add('显示防伪标志');
      else
        begin
          SubItems.Add('未知');
        end;
      end;

      Buf := PtrAdd(Buf, 1);
      case Buf^ of
        $00: SubItems.Add('一般模式');
        $01: SubItems.Add('夜间模式');
      else
        begin
          SubItems.Add('未知');
        end;
      end;

      SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));


      Data:=ADev;
    end;
 end
 else
 begin
    node := EventListView.Items.Insert(0);
    node.Caption:=TDevice(ADev).IdStr;
    node.SubItems.Add(TDevice(ADev).Car.No);

    node.SubItems.Add(BCDToStr1(Buf, 5));
    Buf := PtrAdd(Buf, 5);

    node.SubItems.Add(IntToHex(Buf^, 2));
    Buf := PtrAdd(Buf, 1);

    temp := '';
    temp := IntToHex(Buf^, 2) + '.';
    Buf := PtrAdd(Buf, 1);
    temp := temp + IntToHex(Buf^, 2);
    node.SubItems.Add(temp);

    Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00: node.SubItems.Add('设备正常');
      $10..$1F: node.SubItems.Add('工作异常，需进行复位');
    else
      begin
        node.SubItems.Add('RFU');
      end;
    end;

    Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00: node.SubItems.Add('空车');
      $01: node.SubItems.Add('重车');
      $02: node.SubItems.Add('停运');
      $03: node.SubItems.Add('电招');
      $04: node.SubItems.Add('报警');
      $05: node.SubItems.Add('显示防伪标志');
    else
      begin
        node.SubItems.Add('未知');
      end;
    end;

    Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00: node.SubItems.Add('一般模式');
      $01: node.SubItems.Add('夜间模式');
    else
      begin
        node.SubItems.Add('未知');
      end;
    end;

    node.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

    node.Data:=ADev;
 end;
 PageControl1.TabIndex := 0;
end;

procedure TLightStateFrm.DisplayLED(ADev: TObject; Buf: PByte);
var
  node: TListItem ;
  temp: string;
begin
  if LEDListView.Items.Count =0 then
  begin
    with LEDListView.Items.Add  do
    begin
      Caption:=TDevice(ADev).IdStr;
      SubItems.Add(TDevice(ADev).Car.No);

      SubItems.Add(BCDToStr1(Buf, 5));
      Buf := PtrAdd(Buf, 5);

      SubItems.Add(IntToHex(Buf^, 2));
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);
      SubItems.Add(temp);

      Buf := PtrAdd(Buf, 1);

      case Buf^ of
        $01: SubItems.Add('16*128');
        $02: SubItems.Add('32*192');
      else
        begin
          SubItems.Add('RFU');
        end;
      end;

      Buf := PtrAdd(Buf, 1);

      case Buf^ of
        $00: SubItems.Add('运行正常');
        $10..$1F: SubItems.Add('工作异常，需进行复位');
        $20..$2F: SubItems.Add('设备异常，无法恢复，需修复');
        $30..$3F: SubItems.Add('LED显示设备工作不正常');
      else
        begin
          SubItems.Add('RFU');
        end;
      end;

      Buf := PtrAdd(Buf, 1);
      case Buf^ of
        $00: SubItems.Add('LED屏开启');
        $01: SubItems.Add('LED屏关闭');
      else
        begin
          SubItems.Add('未知');
        end;
      end;

      SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

      Data:=ADev;
    end;
 end
 else
 begin
    node := LEDListView.Items.Insert(0);
    node.Caption:=TDevice(ADev).IdStr;
    node.SubItems.Add(TDevice(ADev).Car.No);

    node.SubItems.Add(BCDToStr1(Buf, 5));
    Buf := PtrAdd(Buf, 5);

    node.SubItems.Add(IntToHex(Buf^, 2));
    Buf := PtrAdd(Buf, 1);

    temp := '';
    temp := IntToHex(Buf^, 2) + '.';
    Buf := PtrAdd(Buf, 1);
    temp := temp + IntToHex(Buf^, 2);
    node.SubItems.Add(temp);

    Buf := PtrAdd(Buf, 1);

    case Buf^ of
      $01: node.SubItems.Add('16*128');
      $02: node.SubItems.Add('32*192');
    else
      begin
        node.SubItems.Add('RFU');
      end;
    end;

    Buf := PtrAdd(Buf, 1);

    case Buf^ of
      $00: node.SubItems.Add('运行正常');
      $10..$1F: node.SubItems.Add('工作异常，需进行复位');
      $20..$2F: node.SubItems.Add('设备异常，无法恢复，需修复');
      $30..$3F: node.SubItems.Add('LED显示设备工作不正常');
    else
      begin
        node.SubItems.Add('RFU');
      end;
    end;

    Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00: node.SubItems.Add('LED屏开启');
      $01: node.SubItems.Add('LED屏关闭');
    else
      begin
        node.SubItems.Add('未知');
      end;
    end;

    {Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00: node.SubItems.Add('LED屏设备正常');
    else
      begin
        node.SubItems.Add('LED平故障');
      end;
    end;    }

    node.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

    node.Data:=ADev;
 end;
 PageControl1.TabIndex := 1;
end;

procedure TLightStateFrm.DisplayLCD(ADev: TObject; Buf: PByte);
var
  node: TListItem ;
  temp: string;
begin
  if LCDListView.Items.Count =0 then
  begin
    with LCDListView.Items.Add  do
    begin
      Caption:=TDevice(ADev).IdStr;
      SubItems.Add(TDevice(ADev).Car.No);

      SubItems.Add(BCDToStr1(Buf, 5));
      Buf := PtrAdd(Buf, 5);

      SubItems.Add(IntToHex(Buf^, 2));
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);
      SubItems.Add(temp);

      Buf := PtrAdd(Buf, 1);

      case Buf^ of
        $00: SubItems.Add('运行正常');
        $10..$1F:
          begin
            {$IFDEF HrbUser}
              SubItems.Add('运行正常');
            {$ELSE}
              SubItems.Add('工作异常，需进行复位');
            {$ENDIF}
          end;
        $20..$2F: SubItems.Add('设备异常，无法恢复，需修复');
      else
        begin
          SubItems.Add('RFU');
        end;
      end;

      Buf := PtrAdd(Buf, 1);
      case Buf^ of
        $00: SubItems.Add('LCD屏开启');
        $01: SubItems.Add('LCD屏关闭');
      else
        begin
          SubItems.Add('未知');
        end;
      end;

      SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

      Data:=ADev;
    end;
 end
 else
 begin
    node := LCDListView.Items.Insert(0);
    node.Caption:=TDevice(ADev).IdStr;
    node.SubItems.Add(TDevice(ADev).Car.No);
    
    node.SubItems.Add(BCDToStr1(Buf, 5));
    Buf := PtrAdd(Buf, 5);

    node.SubItems.Add(IntToHex(Buf^, 2));
    Buf := PtrAdd(Buf, 1);

    temp := '';
    temp := IntToHex(Buf^, 2) + '.';
    Buf := PtrAdd(Buf, 1);
    temp := temp + IntToHex(Buf^, 2);
    node.SubItems.Add(temp);

    Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00: node.SubItems.Add('运行正常');
      $10..$1F:
        begin
          {$IFDEF HrbUser}
            node.SubItems.Add('运行正常');
          {$ELSE}
            node.SubItems.Add('工作异常，需进行复位');
          {$ENDIF}
        end;
      $20..$2F: node.SubItems.Add('设备异常，无法恢复，需修复');
    else
      begin
        node.SubItems.Add('RFU');
      end;
    end;

    Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00: node.SubItems.Add('LCD屏开启');
      $01: node.SubItems.Add('LCD屏关闭');
    else
      begin
        node.SubItems.Add('未知');
      end;
    end;

    node.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

    node.Data:=ADev;
 end;
 PageControl1.TabIndex := 2;
end;

procedure TLightStateFrm.OnRcvLightStateListupLoad(QueryType: Byte; ADev: TObject; Buf: PByte);
begin
  try
    case QueryType of
      0: DisplayMCU(ADev, Buf);
      1: DisplayLED(ADev, Buf);
      2: DisplayLCD(ADev, Buf);
      3: DisplayTSM(ADev, Buf);
      4: DisplayMeter(ADev, Buf);
      10: DisplayPolling_MCU(ADev, Buf); // 设备巡检
    else
      begin
        PopMsg('状态信息', TDevice(ADev).IdStr + ' 无设备状态信息');    
      end;
    end;
  except
    on e: Exception do
    begin
      MessageBox(Handle, PChar('设备状态数据存在问题，请重新对车辆进行巡检'), '提示', mb_ok + mb_iconinformation)
    end;
  end;
end;



procedure TLightStateFrm.BitBtn_ClrClick(Sender: TObject);
begin
  EventListView.Clear;
end;

procedure TLightStateFrm.BitBtn_List100Click(Sender: TObject);
begin
  while EventListView.Items.Count > 10 do
  begin
    EventListView.Items.Delete(EventListView.Items.Count-1);
  end;
end;

procedure TLightStateFrm.BitBtn2Click(Sender: TObject);
begin
  LEDListView.Clear;
end;

procedure TLightStateFrm.BitBtn1Click(Sender: TObject);
begin
  while LEDListView.Items.Count > 10 do
  begin
    LEDListView.Items.Delete(LEDListView.Items.Count-1);
  end;
end;

procedure TLightStateFrm.BitBtn4Click(Sender: TObject);
begin
  LCDListView.Clear;
end;

procedure TLightStateFrm.BitBtn3Click(Sender: TObject);
begin
  while LCDListView.Items.Count > 10 do
  begin
    LCDListView.Items.Delete(LCDListView.Items.Count-1);
  end;
end;

procedure TLightStateFrm.DisplayMeter(ADev: TObject; Buf: PByte);
var
  node: TListItem ;
  temp: string;
begin
  if metersListView.Items.Count =0 then
  begin
    with metersListView.Items.Add  do
    begin
      Caption:=TDevice(ADev).IdStr;
      SubItems.Add(TDevice(ADev).Car.No);

      SubItems.Add(BCDToStr1(Buf, 5));
      Buf := PtrAdd(Buf, 5);

      SubItems.Add(IntToHex(Buf^, 2));
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);
      SubItems.Add(temp);

      Buf := PtrAdd(Buf, 6);
      case Buf^ of
        $00: SubItems.Add('设备正常');
        $01: SubItems.Add('设备限制使用(次数限制)');
        $02: SubItems.Add('设备限制使用(日期限制)');
        $04: SubItems.Add('营运数据存储满');
        $08: SubItems.Add('上下班签到签退信息满');
      else
        begin
          SubItems.Add('设备异常');
        end;
      end;

      Buf := PtrAdd(Buf, 1);
      case Buf^ of
        $00: SubItems.Add('签到，已开机');
        $01: SubItems.Add('签退，已关机');
        $10: SubItems.Add('签到，强制开机');
        $11: SubItems.Add('签退，强制关机');
      else
        begin
          SubItems.Add('未知');
        end;
      end;

      SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

      Data:=ADev;
    end;
 end
 else
 begin
    node := metersListView.Items.Insert(0);
    node.Caption:=TDevice(ADev).IdStr;
    node.SubItems.Add(TDevice(ADev).Car.No);

    node.SubItems.Add(BCDToStr1(Buf, 5));
    Buf := PtrAdd(Buf, 5);

    node.SubItems.Add(IntToHex(Buf^, 2));
    Buf := PtrAdd(Buf, 1);

    temp := '';
    temp := IntToHex(Buf^, 2) + '.';
    Buf := PtrAdd(Buf, 1);
    temp := temp + IntToHex(Buf^, 2);
    node.SubItems.Add(temp);

    Buf := PtrAdd(Buf, 6);
    case Buf^ of
      $00: node.SubItems.Add('设备正常');
      $01: node.SubItems.Add('设备限制使用(次数限制)');
      $02: node.SubItems.Add('设备限制使用(日期限制)');
      $04: node.SubItems.Add('营运数据存储满');
      $08: node.SubItems.Add('上下班签到签退信息满');
    else
      begin
        node.SubItems.Add('设备异常');
      end;
    end;

    Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00: node.SubItems.Add('签到，已开机');
      $01: node.SubItems.Add('签退，已关机');
      $10: node.SubItems.Add('签到，强制开机');
      $11: node.SubItems.Add('签退，强制关机');
    else
      begin
        node.SubItems.Add('未知');
      end;
    end;

    node.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

    node.Data:=ADev;
 end;
 PageControl1.TabIndex := 4;
end;

procedure TLightStateFrm.DisplayMCU2(ADev: TObject; Buf: PByte);
var
  node: TListItem ;
  temp: string;
begin
  if MCUListView.Items.Count =0 then
  begin
    with MCUListView.Items.Add  do
    begin
      Caption:=TDevice(ADev).IdStr;
      SubItems.Add(TDevice(ADev).Car.No);
      //Buf := PtrAdd(Buf, 5);

      SubItems.Add(IntToHex(Buf^, 2));
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);
      SubItems.Add(temp);

      SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

      Data:=ADev;
    end;
 end
 else
 begin
    node := MCUListView.Items.Insert(0);
    node.Caption:=TDevice(ADev).IdStr;
    node.SubItems.Add(TDevice(ADev).Car.No);
    //Buf := PtrAdd(Buf, 5);

    node.SubItems.Add(IntToHex(Buf^, 2));
    Buf := PtrAdd(Buf, 1);

    temp := '';
    temp := IntToHex(Buf^, 2) + '.';
    Buf := PtrAdd(Buf, 1);
    temp := temp + IntToHex(Buf^, 2);
    node.SubItems.Add(temp);

    node.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

    node.Data:=ADev;
 end;
 PageControl1.TabIndex := 5;
end;

procedure TLightStateFrm.DisplayTSM(ADev: TObject; Buf: PByte);
var
  node: TListItem ;
  temp: string;
begin
  if TSMListView.Items.Count =0 then
  begin
    with TSMListView.Items.Add  do
    begin
      Caption:=TDevice(ADev).IdStr;
      SubItems.Add(TDevice(ADev).Car.No);

      SubItems.Add(BCDToStr1(Buf, 5));
      Buf := PtrAdd(Buf, 5);

      SubItems.Add(IntToHex(Buf^, 2));
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);
      SubItems.Add(temp);

      Buf := PtrAdd(Buf, 4);
      case Buf^ of
        $00: SubItems.Add('设备正常');
        $01: SubItems.Add('系统存储异常');
      else
        begin
          SubItems.Add('其他异常');
        end;
      end;

      // 1个字节的ESAM卡类型是什么
      // 5个字节的POS机编号是BCD码?

      SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

      Data:=ADev;
    end;
 end
 else
 begin
    node := TSMListView.Items.Insert(0);
    node.Caption:=TDevice(ADev).IdStr;
    node.SubItems.Add(TDevice(ADev).Car.No);

    node.SubItems.Add(BCDToStr1(Buf, 5));
    Buf := PtrAdd(Buf, 5);

    node.SubItems.Add(IntToHex(Buf^, 2));
    Buf := PtrAdd(Buf, 1);

    temp := '';
    temp := IntToHex(Buf^, 2) + '.';
    Buf := PtrAdd(Buf, 1);
    temp := temp + IntToHex(Buf^, 2);
    node.SubItems.Add(temp);

    Buf := PtrAdd(Buf, 4);
    case Buf^ of
      $00: node.SubItems.Add('设备正常');
      $01: node.SubItems.Add('系统存储异常');
    else
      begin
        node.SubItems.Add('其他异常');
      end;
    end;

    node.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

    node.Data:=ADev;
 end;
 PageControl1.TabIndex := 3;
end;

procedure TLightStateFrm.BitBtn6Click(Sender: TObject);
begin
  TSMListView.Clear;
end;

procedure TLightStateFrm.BitBtn5Click(Sender: TObject);
begin
  while TSMListView.Items.Count > 10 do
  begin
    TSMListView.Items.Delete(TSMListView.Items.Count-1);
  end;
end;

procedure TLightStateFrm.BitBtn8Click(Sender: TObject);
begin
  metersListView.Clear;
end;

procedure TLightStateFrm.BitBtn7Click(Sender: TObject);
begin
  while metersListView.Items.Count > 10 do
  begin
    metersListView.Items.Delete(metersListView.Items.Count-1);
  end;
end;

procedure TLightStateFrm.DisplayPolling_MCU(ADev: TObject; Buf: PByte);
var
  node: TListItem ;
  temp: string;

  QueryType: Byte;
  size: Word;
  i: Byte;

  State: string;

  Len: Byte;  // 设备状态的长度
  offset: Word; // 循环过程中的偏移长度
  stateBuf: PByte;  // 状态信息
begin

  try
    MCU := '无顶灯信息';
    LED := '无LED信息';
    LCD := '无LCD信息';
    TSM := '无TSM安全模块信息';
    METER := '无计价器信息';
    MCU2 := '无MCU信息';


    size := PCmdSerTErmPolling_MCU_V3(Buf)^.Size;
    Inc(Buf, 11);
    size := size - 11;  // 得到整个状态数据内容的长度

    offset := 0;
    try
      try
        //New(stateBuf);
        while offset< size do
        begin
          try
            try
              QueryType := Buf^;  // 设备类型
              Inc(Buf, 1);
              offset := offset + 1;
              Len := Buf^;  // 该状态信息的长度
              Inc(Buf, 1);
              offset := offset + 1;
              //CopyMemory(stateBuf, Buf, len);

              case QueryType of
                0: DisplayMCU2_Polling(ADev, Buf, len);
                2: DisplayMeter_Polling(ADev, Buf, len);
                3: DisplayTSM_Polling(ADev, Buf, len);
                4: DisplayLED_Polling(ADev, Buf, len);
                5: DisplayMCU_Polling(ADev, Buf, len);
                9: DisplayLCD_Polling(ADev, Buf, len);
              end;
            except
              Continue;
            end;
          finally
            Inc(Buf, len);
            offset := offset + Len;
          end;
        end;
      except
        on e: Exception do
        begin
          messagebox(handle, pchar('设备巡检数据存在问题，请重新对车辆进行巡检'), '提示', mb_ok + mb_iconinformation);
        end;
      end;
    finally
      //Dispose(stateBuf);
    end;

    {for i:=0 to (size div 35)  -1 do
    begin
      QueryType := Buf^;             // 设备类型
      Inc(Buf, 3);
      //OnRcvLightStateListupLoad(QueryType, ADev, Buf);
      case QueryType of
        0: DisplayMCU2_Polling(ADev, Buf, MCU2);
        2: DisplayMeter_Polling(ADev, Buf, METER);
        3: DisplayTSM_Polling(ADev, Buf, TSM);
        4: DisplayLED_Polling(ADev, Buf, LED);
        5: DisplayMCU_Polling(ADev, Buf, MCU);
        9: DisplayLCD_Polling(ADev, Buf, LCD);
      end;

      Inc(Buf, 32);
    end;      }

  finally
    State := '                设备编号      硬件版本号   软件版本号   设备状态                      显示状态                     模式' +#13+ #10
            +'顶灯     ' + MCU + #13+ #10
            +'---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------' +#13+ #10

            +'                设备编号      硬件版本号   软件版本号   屏类型                          运行状态                     开关状态' + #13+ #10
            +'LED      ' + LED + #13+ #10
            +'---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------' +#13+ #10

            +'                设备编号      硬件版本号   软件版本号   运行状态                      开关状态' + #13+ #10
            +'LCD      ' + LCD + #13+ #10
            +'---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------' +#13+ #10

            +'                设备编号      硬件版本号   软件版本号   状态                     POS机编号          PSAM卡号' + #13+ #10
            +'TSM      ' + TSM + #13+ #10
            +'---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------' +#13+ #10

            +'                设备编号      硬件版本号   软件版本号   运行状态                      工作状态' + #13+ #10
            +'计价器  ' + METER + #13+ #10
            +'---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------' +#13+ #10

            +'                设备编号      硬件版本号   软件版本号   签到缓存数据条数   签退缓存数据条数   营运记录缓存条数   一卡通交易缓存条数' + #13+ #10
            +'MCU        ' + MCU2 ;

    if PollingListView.Items.Count =0 then
    begin
      with PollingListView.Items.Add  do
      begin
        Caption:=TDevice(ADev).IdStr;
        SubItems.Add(TDevice(ADev).Car.No);
        SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));
        SubItems.Add(State);
      end;
    end
    else
    begin
      node := PollingListView.Items.Insert(0);
      node.Caption:=TDevice(ADev).IdStr;
      node.SubItems.Add(TDevice(ADev).Car.No);
      node.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));
      node.SubItems.Add(State);
    end;

    Label3.Caption := IntToStr(PollingListView.Items.Count);
  end;
end;

procedure TLightStateFrm.BitBtn10Click(Sender: TObject);
begin
  MCUListView.Clear;
end;

procedure TLightStateFrm.BitBtn9Click(Sender: TObject);
begin
  while MCUListView.Items.Count > 10 do
  begin
    MCUListView.Items.Delete(MCUListView.Items.Count-1);
  end;
end;

procedure TLightStateFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.show_LightStateList.Checked := false;
end;

procedure TLightStateFrm.EventListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  EventListView.CustomSort(@CustormSortProc, Column.Index);
  LvSort := not LvSort;
end;

procedure TLightStateFrm.LEDListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  LEDListView.CustomSort(@CustormSortProc, Column.Index);
  LvSort := not LvSort;
end;

procedure TLightStateFrm.LCDListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  LCDListView.CustomSort(@CustormSortProc, Column.Index);
  LvSort := not LvSort;
end;

procedure TLightStateFrm.TSMListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  TSMListView.CustomSort(@CustormSortProc, Column.Index);
  LvSort := not LvSort;
end;

procedure TLightStateFrm.metersListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  metersListView.CustomSort(@CustormSortProc, Column.Index);
  LvSort := not LvSort;
end;

procedure TLightStateFrm.MCUListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  MCUListView.CustomSort(@CustormSortProc, Column.Index);
  LvSort := not LvSort;
end;

procedure TLightStateFrm.DisplayLCD_Polling(ADev: TObject; Buf: PByte;len: Integer);
var
  node: TListItem ;
  temp: string;
  state: string;
begin
  try
      if isAllZero(Buf, len) then
        Exit;

      state := BCDToStr1(Buf, 5) + '            ';
      Buf := PtrAdd(Buf, 5);

      state := state + IntToHex(Buf^, 2) + '                ';
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);
      state := state + temp + '          ';

      Buf := PtrAdd(Buf, 1);

      case Buf^ of
        $00: state := state + '运行正常                      ';
        $10..$1F:
          begin
            {$IFDEF HrbUser}
              state := state + '运行正常                      ';
            {$ELSE}
              state := state + '工作异常，需进行复位          ';
            {$ENDIF}
          end;
        $20..$2F: state := state + '设备异常，无法恢复，需修复    ';
      else
        begin
          state := state + 'RFU   ';
        end;
      end;

      Buf := PtrAdd(Buf, 1);
      case Buf^ of
        $00: state := state + 'LCD屏开启';
        $01: state := state + 'LCD屏关闭';
      else
        begin
          state := state + '未知';
        end;
      end;

     LCD := state;
  except
      raise;
    end;
end;

procedure TLightStateFrm.DisplayLED_Polling(ADev: TObject; Buf: PByte; len: Integer);
var
  temp: string;
  state: string;
begin
  try
      if isAllZero(Buf, len) then
        Exit;
        
      state := BCDToStr1(Buf, 5)  + '             ';
      Buf := PtrAdd(Buf, 5);

      state := state + IntToHex(Buf^, 2)  + '                   ';
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);
      state := state + temp + '               ';

      Buf := PtrAdd(Buf, 1);

      case Buf^ of
        $01: state := state + '16*128                             ';
        $02: state := state + '32*192                             ';
      else
        begin
          state := state + 'RFU                                ';
        end;
      end;

      Buf := PtrAdd(Buf, 1);

      case Buf^ of
        $00:      state := state + '运行正常                     ';
        $10..$1F: state := state + '工作异常，需进行复位         ';
        $20..$2F: state := state + '设备异常，无法恢复，需修复   ';
        $30..$3F: state := state + 'LED显示设备工作不正常        ';
      else
        begin
                  state := state + 'RFU                          ';
        end;
      end;

      Buf := PtrAdd(Buf, 1);
      case Buf^ of
        $00: state := state + 'LED屏开启';
        $01: state := state + 'LED屏关闭';
      else
        begin
          state := state + '未知';
        end;
      end;

      LED := state;
  except
      raise;
    end;
end;

procedure TLightStateFrm.DisplayMCU_Polling(ADev: TObject; Buf: PByte; len: Integer);
var
  temp: string;
  state: string;
begin
  try
    if isAllZero(Buf, len) then
        Exit;
        
    state := BCDToStr1(Buf, 5) + '            ';
    Buf := PtrAdd(Buf, 5);

    state := state + IntToHex(Buf^, 2) + '                   ';
    Buf := PtrAdd(Buf, 1);

    temp := '';
    temp := IntToHex(Buf^, 2) + '.';
    Buf := PtrAdd(Buf, 1);
    temp := temp + IntToHex(Buf^, 2);
    state := state + temp + '               ';

    Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00:  state := state + '设备正常                      ';
      $10..$1F: state := state + '工作异常，需进行复位          ';
    else
      begin
        state := state + 'RFU                           ';
      end;
    end;

    Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00: state := state + '空车                             ';
      $01: state := state + '重车                             ';
      $02: state := state + '停运                             ';
      $03: state := state + '电招                             ';
      $04: state := state + '报警                             ';
      $05: state := state + '显示防伪标志                     ';
    else
      begin
        state := state + '未知                             ';
      end;
    end;

    Buf := PtrAdd(Buf, 1);
    case Buf^ of
      $00: state := state + '一般模式';
      $01: state := state + '夜间模式';
    else
      begin
        state := state + '未知';
      end;
    end;

    MCU := state;
  except
      raise;
    end;
end;

procedure TLightStateFrm.DisplayMCU2_Polling(ADev: TObject; Buf: PByte; len: Integer);
var
  temp: string;
  sum: Byte; 
  state: string;
begin
    try
      if isAllZero(Buf, len) then
        Exit;

      sum := 0;

      state := BCDToStr1(Buf, 5) + '            ';                 //  设备类型
      Buf := PtrAdd(Buf, 5);

      state := state + IntToHex(Buf^, 2) + '                  ';  // 硬件版本号
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);                           // 软件版本号
      state := state + temp + '                              ';

      Buf := PtrAdd(Buf, 1);
      Buf := PtrAdd(Buf, 4);                                      // MCU设备状态
      Buf := PtrAdd(Buf, 4);                                      // MCU报警标志
      sum := Buf^;                                                // 签到缓存数据条数
      state := state + IntToStr(sum) + '                                        ';

      Buf := PtrAdd(Buf, 1);
      sum := Buf^;
      state := state + IntToStr(sum) + '                                      ';      // 签退缓存数据条数

      Buf := PtrAdd(Buf, 1);
      sum := Buf^;
      state := state + IntToStr(sum) + '                                          ';      // 营运记录缓存条数

      Buf := PtrAdd(Buf, 1);
      sum := Buf^;
      state := state + IntToStr(sum) + '                       ';      // 一卡通交易缓存条数

      MCU2 := state;
    except
      raise;
    end;
end;

procedure TLightStateFrm.DisplayMeter_Polling(ADev: TObject; Buf: PByte;   len: Integer);
var
  temp: string;
  state: string;
begin
  try
      if isAllZero(Buf, len) then
        Exit;
        
      state := BCDToStr1(Buf, 5) + '           ';
      Buf := PtrAdd(Buf, 5);

      state := state + IntToHex(Buf^, 2) + '                ';
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);
      state := state + temp + '          ';

      Buf := PtrAdd(Buf, 6);
      case Buf^ of
        $00: state := state + '       设备正常                  ';
        $01: state := state + '设备限制使用(次数限制)        ';
        $02: state := state + '设备限制使用(日期限制)        ';
        $04: state := state + '    营运数据存储满            ';
        $08: state := state + '上下班签到签退信息满          ';
      else
        begin
          state := state + '       设备异常                  ';
        end;
      end;

      Buf := PtrAdd(Buf, 1);
      case Buf^ of
        $00: state := state + '签到，已开机';
        $01: state := state + '签退，已关机';
        $10: state := state + '签到，强制开机';
        $11: state := state + '签退，强制关机';
      else
        begin
          state := state + '未知';
        end;
      end;

     METER := state;
  except
      raise;
    end;
end;

procedure TLightStateFrm.DisplayTSM_Polling(ADev: TObject; Buf: PByte; len: Integer);
var
  temp: string;
  state: string;
begin
  try
      if isAllZero(Buf, len) then
        Exit;

      state :=  BCDToStr1(Buf, 5) + '            ';
      Buf := PtrAdd(Buf, 5);

      state := state + IntToHex(Buf^, 2) + '                   ';
      Buf := PtrAdd(Buf, 1);

      temp := '';
      temp := IntToHex(Buf^, 2) + '.';
      Buf := PtrAdd(Buf, 1);
      temp := temp + IntToHex(Buf^, 2);
      state := state + temp + '          ';

      Buf := PtrAdd(Buf, 4);
      case Buf^ of
        $00: state := state + '设备正常        ';
        $01: state := state + '系统存储异常        ';
      else
        begin
          state := state + '其他异常        ';
        end;
      end;

      // 1个字节的ESAM卡类型是什么
      Buf := PtrAdd(Buf, 1);
      // 5个字节的POS机编号是BCD码?
      state := state + BCDToStr1(Buf, 5) + '            ';
      Buf := PtrAdd(Buf, 5);
      // 5个字节的PSAM卡卡号
      state := state + BCDToStr1(Buf, 5);

      TSM := state;
  except
    raise;
  end;
end;

procedure TLightStateFrm.PollingListViewClick(Sender: TObject);
begin
  try
    if PollingListView.Selected = nil then Exit;
    Memo1.Text := '';
    Memo1.Text := PollingListView.Selected.SubItems.Strings[2];
  except
  end;
end;

procedure TLightStateFrm.PollingListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  PollingListView.CustomSort(@CustormSortProc, Column.Index);
  LvSort := not LvSort;
end;

procedure TLightStateFrm.N1Click(Sender: TObject);
begin
  Memo1.Text := '';
  PollingListView.Clear;
  Label3.Caption := '0';
end;

procedure TLightStateFrm.N101Click(Sender: TObject);
begin
  Memo1.Text := '';
  while PollingListView.Items.Count > 10 do
  begin
    PollingListView.Items.Delete(MCUListView.Items.Count-1);
  end;
  Label3.Caption := IntToStr(PollingListView.Items.Count);
end;

procedure TLightStateFrm.PollingListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  try
    if PollingListView.Selected = nil then Exit;
    Memo1.Text := '';
    Memo1.Text := PollingListView.Selected.SubItems.Strings[2];
  except
  end;
end;

end.
