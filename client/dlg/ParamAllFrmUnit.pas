unit ParamAllFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParamFrmUnit, StdCtrls, ExtCtrls, Buttons, ComCtrls,CarUnit,ConstDefineUnit,
  RzLstBox, RzChkLst, cxCheckListBox, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxCheckGroup, cxCheckBox, RzButton, RzRadChk, Types;
const
   SHOW_H=522;
   SET_H=111;
type
  TParamAllFrm = class(TParamFrm)
    Panel6: TPanel;
    Panel7: TPanel;
    ListView1: TListView;
    Panel8: TPanel;
    BitBtn4: TBitBtn;
    BitBtnSel: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtnSetClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    ListViewPointer:integer;
    CmdIDList:array of integer;
    HaveErrorIsSet:boolean;

    procedure SetAllDevParam;
    { Private declarations }
  public
    { Public declarations }
    Cancel: Boolean;
    // procedure CreateParams(Var Param:TCreateParams);override;
  end;

var
  ParamAllFrm: TParamAllFrm;

implementation
uses uGloabVar,uFrmSelectDevs,GatewayServerUnit;
{$R *.dfm}

procedure TParamAllFrm.BitBtnSetClick(Sender: TObject);
var
  i,j:integer;
  s:string;
  NO:integer;
  paramData: TByteDynArray;
  paramCount: Integer;
  dev: TDevice;
begin
  BitBtnSet.Enabled := False;
  try
    if ListView1.Items.Count <= 0 then
    begin
      messagebox(handle,'车辆里不能为空!','提示',mb_ok + mb_iconinformation);
      BitBtnSet.Enabled:=true;
      exit;
    end;
    SetLength(paramData, 0);
    paramCount := 0;
    if checkParam(paramData, paramCount) then
    begin
      if paramCount <= 0 then
      begin
        MessageBox(Handle, '请至少设置一个参数', '提示', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;  
      for i := 0 to ListView1.Items.Count - 1 do
      begin
        dev := TDevice(ListView1.Items.Item[i].Data);
        DataServer.SetAllDevParam_V3(dev, paramData, paramCount);
      end;
      Close; 
    end;
  finally
    BitBtnSet.Enabled := True;
  end;

  //-------------以下不执行了，设参数改为一次性设置所有的 2012.1

 { Cancel := False;
  BitBtnSet.Enabled:=false;
  CheckBoxList.Clear;
  if not CheckEmpty then
  begin
   BitBtnSet.Enabled:=true;
   exit;
  end;                                          
  if not CheckError then
  begin
   BitBtnSet.Enabled:=true;
   exit;
  end;  
  if ListView1.Items.Count=0 then
  begin
    messagebox(handle,'车辆里不能为空!','提示',mb_ok + mb_iconinformation);
    BitBtnSet.Enabled:=true;
    exit;
  end;
   ListViewPointer:=0;
   CurrentDev:=TDevice(ListView1.Items.Item[ListViewPointer].Data);
   ParamNO:=0;
   j:=0;
   LastComp:=0;



//  for i:=0 to Self.ComponentCount-1 do
//  begin
//    if (Self.Components[i] is  TCheckBox) then
//    begin
//        if TCheckBox(Self.Components[i]).Checked then
//        begin
//          inc(j);
//          //LastComp:=i;
//          CheckBoxList.Add(TCheckBox(Self.Components[i]).Name);
//        end;
//    end;
//  end;
  LastComp := CheckBoxList.Count;
  if (j=1)and(ListView1.Items.Count=1) then
  begin
    try
      ParamSaveToDev(CurrentDev);
    except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        Cancel := True;
        timer1.Enabled:=false;
        BitBtnSet.Enabled:=true;
        ProgressBar1.Visible:=false;
        exit;
      end;
    end;
    S:=CheckBoxList.Strings[0];//TCheckBox(Self.Components[LastComp]).Name;
    S:=copy(S,9,Length(S)-1);
    NO:=StrToInt(S);
    SetParam(CurrentDev.Id,NO);
    Close;
  end
  else
  begin
    ProgressBar1.Max:=j*ListView1.Items.Count+ListView1.Items.Count;
    ProgressBar1.Visible:=true;
    ProgressBar1.Position:=0;
    //Self.Height:=SET_H;
    SetLength(CmdIDList,ListView1.Items.Count);
    for i:=0 to ListView1.Items.Count-1 do  //保存到数据库;
    begin
      if Cancel then
      begin
        if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
        begin
          Close;
          Exit;
        end
        else
        begin
          Cancel := False;
        end;
      end;
      CmdIDList[i]:=-1;
      CurrentDev:=TDevice(ListView1.Items.Item[i].Data);
      if CurrentDev=nil then continue;
      try
        ParamSaveToDev(CurrentDev);   //需要修改为调用webservice
      except
        on E: Exception do
        begin
          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
          Cancel := True;
          timer1.Enabled:=false;
          BitBtnSet.Enabled:=true;
          ProgressBar1.Visible:=false;
          exit;
        end;
      end;
      ProgressBar1.StepIt;
    end;
    Timer1.Enabled:=true;
    HaveErrorIsSet:=false;
    Timer1Timer(Timer1);
  end; }
end;

procedure TParamAllFrm.SetAllDevParam;
     function CheckCanSetParam:boolean;
     var
       i:integer;
       state:byte;
       pCmd: PCmdInfo;
     begin
       if CmdIDList[0]=-1 then  //判断是否为第一次发送.
       begin
         Result:=true;
         exit;
       end;
       Result:=false;
       for i:=0 to ListView1.Items.Count-1 do
       begin
         pCmd := ACmdManage.Find(CmdIDList[i]);
         if pCmd = nil then exit;
         state := pCmd^.State;
         //state:=(ACmdManage.Find(CmdIDList[i]))^.State;
         if state = CMD_SNDNODO then      //如果有一个还处于发送状态,就认为没有发送完,继续等待.
         begin
           exit;
         end
         else if (state= CMD_DONE) and (paramNO > LastComp)then //最后一个设置成功
         begin
           Timer1.Enabled := False;
           close;
           exit;
         end
         else if not(State = CMD_DONE)or(State = CMD_REPLACE) then // 如果有一个发送错误,就报错,告诉用户是否接着发送.
         begin
           if HaveErrorIsSet then continue;
           timer1.Enabled:=false;
           if messagebox(handle,Pchar('设置'+ADeviceManage.FindToCarNO(ACmdManage.Find(CmdIDList[i]).DevId)+'参数出错!是否继续设置?'),pchar('提示'),MB_YESNO)=ID_YES then
           begin
              HaveErrorIsSet:=true;
              timer1.Enabled:=true;
           end
           else
           begin
              BitBtn2Click(nil);
              exit;
           end;
         end;
       end;
       Result:=true;
     end;
var
  i,j:integer;
  s:string;
  NO:integer;
begin

  if ParamNO >= LastComp then //self.ComponentCount then
  begin
     timer1.Enabled:=false;
     BitBtn2Click(nil);     
     close;
     exit;
  end;
//  if not(Self.Components[ParamNO] is  TCheckBox) then
//  begin
//     inc(ParamNO);
//  end
//  else if not TCheckBox(Self.Components[ParamNO]).Checked then
//    inc(ParamNO);
  i:=ParamNO;
  if  i<CheckBoxList.Count then //Self.ComponentCount then//if  (CheckCanSetParam)and(i<Self.ComponentCount) then
  begin
//    if (Self.Components[i] is  TCheckBox) then
//    begin
//       if TCheckBox(Self.Components[i]).Checked then
//       begin
             S:=CheckBoxList.Strings[i]; //TCheckBox(Self.Components[i]).Name;
             S:=copy(S,9,Length(S)-1);
             NO:=StrToInt(S);
             for j:=0 to ListView1.Items.Count-1 do
             begin
                CurrentDev:=TDevice(ListView1.Items.Item[j].Data);
                if CurrentDev=nil then continue;
                SetParam(CurrentDev.Id,NO);
                CmdIDList[j]:=GSetParamCmdID;
                ProgressBar1.StepIt;
             end;
            inc(ParamNO)
//       end
//       else
//       begin
//          inc(ParamNO);
//       end;
//    end
//    else
//    begin
//      inc(ParamNO);
//    end;
  end;
end;



procedure TParamAllFrm.Timer1Timer(Sender: TObject);
begin
   SetAllDevParam;
end;

procedure TParamAllFrm.BitBtn4Click(Sender: TObject);
begin
  if ListView1.Items.Count =1 then
  begin
     messagebox(handle,'车辆里只有一辆车,不能删除了!','提示',mb_ok + mb_iconinformation);
  end
  else
  begin
    ListView1.DeleteSelected;
  end;
end;

procedure TParamAllFrm.FormShow(Sender: TObject);
begin
  inherited;
//   Self.Height:=SHOW_H;
   if ListView1.Items.Count > 0 then
   begin
     Listview1.Items.Item[0].Selected:=true;
     ListView1.SetFocus;
     ListView1Click(nil);
   end;
   BitBtnSet.SetFocus;
end;

procedure TParamAllFrm.BitBtnSelClick(Sender: TObject);
var
  frm: TFrmSelectDevs;
  i:integer;
begin
  frm:=TFrmSelectDevs.Create(nil);
  frm.FormStyle := fsStayOnTop;
 // Self.WindowState:=wsMinimized;
  try
  if frm.ShowModal=mrOk then
  begin
    ListView1.Clear;
    for i:=0 to frm.DestList.Count-1 do
    begin
      with ListView1.Items.Add do
      begin
        Caption:=TDevice(frm.DestList.Items[i].Data).Car.No;
        Data:=frm.DestList.Items[i].Data;
      end;
    end;
  end;
  finally
   // Self.WindowState:=wsNormal;
    frm.Free;
  end;
end;

{procedure TParamAllFrm.CreateParams(Var Param:TCreateParams);
begin
   Inherited CreateParams(Param);
     Param.wndParent := GetActiveWindow; 
end;}





procedure TParamAllFrm.ListView1Click(Sender: TObject);
begin
  if ListView1.Selected <> nil then
    ShowParamToEdit(TDevice(ListView1.Selected.Data));
end;



procedure TParamAllFrm.BitBtn2Click(Sender: TObject);
begin
  Cancel := True;
  timer1.Enabled:=false;
  BitBtnSet.Enabled:=true;
  ProgressBar1.Visible:=false;
  //Self.Height:=SHOW_H;
end;

procedure TParamAllFrm.BitBtn1Click(Sender: TObject);
begin
  BitBtn2Click(nil);
  close;
end;

procedure TParamAllFrm.FormCreate(Sender: TObject);
begin
  inherited;
  Cancel := False;
end;

end.
