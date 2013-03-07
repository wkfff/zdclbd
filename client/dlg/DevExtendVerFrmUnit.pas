unit DevExtendVerFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, ExtCtrls, StdCtrls;

type
  TDevExtendVerFrm = class(TForm)
    cxList: TcxTreeList;
    ColDevName: TcxTreeListColumn;
    ColDevState: TcxTreeListColumn;
    ColDevVer: TcxTreeListColumn;
    Panel1: TPanel;
    EditCarNo: TEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListDevVerInfo(ABuf: PByte):Boolean;
  end;

var
  DevExtendVerFrm: TDevExtendVerFrm;

implementation
uses CmdStructUnit,UGloabVar,CarUnit,Systemlog,MemFormatUnit;
{$R *.dfm}

{ TDevExtendVerFrm }

function TDevExtendVerFrm.ListDevVerInfo(ABuf: PByte):Boolean;
  procedure InsertList(ADevName,AState,AVer:String);
  begin
    with cxList.Add do
    begin
      Values[0] :=ADevName;
      Values[1] :=AState;
      Values[2] :=AVer;
    end;
  end;
  function GetStateStr3(state:Integer):String;
  begin
    Result:= '';
    case state of
      0: Result:='��Ч';
      1: Result:='����';
      2: Result:='����';
    end;
  end;
  function GetStateStr2(state:Integer):String;
  begin
    Result:= '';
    case state of
      0: Result:='��ֹ';
      1: Result:='ʹ��';
    end;
  end;
var
  pCmd: PCmdSrvTermReadDevVer_Extend;
  dev : TDevice;
  state : Word;
  devVer,lcdVer,ledVer,jjqVer,posVer:String;
  posState,jjqState,ledState,lcdState:integer;
  pic0State,pic1State,pic2State,devWarnStop:integer;
  log : TSystemLog;
  buf: array of byte;
begin
  Result :=False;
  try
    pcmd := PCmdSrvTermReadDevVer_Extend(ABuf);
    dev := ADeviceManage.find(pcmd^.DevId);
    if dev= nil then exit;
    EditCarNo.Text := dev.Car.No;
    //ȡ��״̬ 
    state := pCmd^.DevState;
    posState := state and $03;
    jjqState := (state shr 2) and $03;
    ledState := (state shr 4)and $03;
    lcdState := (state shr 6)and $03;
    pic0State :=(state shr 8)and $03;
    pic1State := (state shr 10) and $03;
    pic2State := (state shr 12) and $03;
    devWarnStop := (state shr 14) and $03;
    //ȡ�汾��Ϣ
    SetLength(devVer,20);
    SetLength(lcdVer,20);
    SetLength(ledVer,20);
    SetLength(jjqVer,20);
    SetLength(posVer,20);
    CopyMemory(@devVer[1],@pCmd^.Devver[0],20);
    CopyMemory(@lcdVer[1],@pCmd^.LcdVer[0],20);
    CopyMemory(@ledVer[1],@pCmd^.LedVer[0],20);
    CopyMemory(@jjqVer[1],@pCmd^.JjqVer[0],20);
    CopyMemory(@posVer[1],@pCmd^.PosVer[0],20);
    devVer := Trim(devVer);
    lcdVer := Trim(lcdVer);
    ledVer := Trim(ledVer);
    jjqVer := Trim(jjqVer);
    posVer := Trim(posVer);
    //�б���ʾ
    cxList.Clear;
    cxList.BeginUpdate;
    InsertList('��������','-',devVer);
    InsertList('������',GetStateStr3(lcdState),lcdVer);
    InsertList('�����',GetStateStr3(ledState),ledVer);
    InsertList('�Ƽ���',GetStateStr3(jjqState),jjqVer);
    InsertList('POS��',GetStateStr3(posState),posVer);
    InsertList('����ͷ0״̬',GetStateStr3(pic0State),'-');
    InsertList('����ͷ1״̬',GetStateStr3(pic1State),'-');
    InsertList('����ͷ2״̬',GetStateStr2(pic2State),'-');
    InsertList('�豸����ͣ������',GetStateStr2(devWarnStop),'-');  
    cxList.EndUpdate;
    Result := True;
    //д��־
    log := TSystemLog.Create;
    try
      log.LogFile := ExePath+'DevVer'+'\'+'DevVer';
      log.AddLog(FormatDateTime('hh:nn:ss',time)+' �յ�['+dev.Car.No+']'+dev.IdStr+'�ϴ��汾��Ϣ:'+ #13#10+
        '�����汾:'+devVer+ #13#10+
        '������:'+GetStateStr3(lcdState)+':'+LcdVer+ #13#10+
        '�����:'+GetStateStr3(ledState)+':'+LedVer+ #13#10+
        '�Ƽ���:'+GetStateStr3(jjqState)+':'+JjqVer+ #13#10+
        'POS��:'+GetStateStr3(posState)+':'+PosVer+ #13#10+
        '����ͷ0״̬:'+GetStateStr3(pic0State)+ #13#10+
        '����ͷ1״̬:'+GetStateStr3(pic1State)+ #13#10+
        '����ͷ2״̬:'+GetStateStr2(pic2State)+ #13#10+
        '�豸����ͣ������:'+GetStateStr2(devWarnStop));
      //�����������־
      SetLength(buf,pCmd^.Size);
      CopyMemory(@buf[0],pCmd,pCmd^.Size);
      log.addLog(BuffToHex(@buf[0],pCmd^.Size));
    finally
      log.Free;
    end;
  except
  end;
end;

end.
