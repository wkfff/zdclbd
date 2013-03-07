unit MapSeekCarFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxInplaceContainer, cxControls, Buttons, ComCtrls, StdCtrls,
  ExtCtrls, cxSplitter, QueryThreadUnit;

type
  TSingleDev = packed record
   carno     : string;
   datetime:string;
   speed:string;
   jd:string;
   wd:string;
 end;
 pSingleDev = ^TSingleDev;
  TMapSeekCarForm = class(TForm)
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel8: TPanel;
    ListViewTo: TListView;
    Panel7: TPanel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    start_date: TDateTimePicker;
    start_time: TDateTimePicker;
    end_date: TDateTimePicker;
    end_time: TDateTimePicker;
    CarList: TcxTreeList;
    CarNo: TcxTreeListColumn;
    HisDateTime: TcxTreeListColumn;
    HisSpeet: TcxTreeListColumn;
    HisLa: TcxTreeListColumn;
    HisLo: TcxTreeListColumn;
    Panel5: TPanel;
    Panel10: TPanel;
    BitBtn3: TBitBtn;
    SB_Query: TSpeedButton;
    ProgressBar1: TProgressBar;
    CheckBoxFirst: TCheckBox;
    CheckBoxLast: TCheckBox;
    CheckBoxAll: TCheckBox;
    Label3: TLabel;
    BitBtnStop: TBitBtn;
    CheckBox1: TCheckBox;
    Panel6: TPanel;
    BitBtn4: TBitBtn;
    CheckBox2: TCheckBox;
    cxTreeList1: TcxTreeList;
    cxTreeListColumn1: TcxTreeListColumn;
    cxTreeListColumn2: TcxTreeListColumn;
    cxTreeListColumn3: TcxTreeListColumn;
    cxTreeListColumn4: TcxTreeListColumn;
    cxTreeListColumn5: TcxTreeListColumn;
    Panel9: TPanel;
    Label4: TLabel;
    cxSplitter2: TcxSplitter;
    Label5: TLabel;
    Label6: TLabel;
    TimerShow: TTimer;
    TimerClose: TTimer;
    procedure FormShow(Sender: TObject);
    procedure SB_QueryClick(Sender: TObject);
    procedure CheckBoxFirstClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtnStopClick(Sender: TObject);
    procedure CarListDblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerCloseTimer(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDeactivate(Sender: TObject);
  private
    isStop:boolean;
    { Private declarations }
  public
    { Public declarations }
     procedure CreateParams(Var Param:TCreateParams);override;
     function FindNodeByADTextIncxTreeList(const FindStr:string;cxTreeList: TcxTreeList;ColumnOrder:Integer): TcxTreeListNode;
     procedure GetQueryReturnInfo(Info: OleVariant);
  public
     beginp:TPoint;
     endp:TPoint;
     QueryDevPostion: TQueryDevPostion;
     GCurConfineAreaID: Integer;
  end;

var
  MapSeekCarForm: TMapSeekCarForm;
  ASingledev: pSingleDev;
  
implementation
uses Carunit, uGloabVar, DBClient, uFrmSelectDevs, BusinessServerUnit, umainf,
     MetaDefine, ConstDefineUnit, DateUtils;
{$R *.dfm}

procedure TMapSeekCarForm.FormShow(Sender: TObject);
var
  i:integer;
  dev:TDevice;
begin

  CarList.Clear;
  ListViewTo.Clear;
  start_date.Date := Date;
  end_date.Date := Date;
  start_time.Time := EncodeTime(0,0,0,0);
  end_time.Time   := EncodeTime(23,59,59,0);
  for i:=0 to ADeviceManage.Count -1 do
  begin
      dev:=ADeviceManage.Items[i];
      with ListViewTo.Items.Add do
      begin
          Data := dev;
          Caption := dev.Car.No;
      end;
  end;
  
  Self.Top:=Screen.Height;//-Self.Height-30;
  if Self.WindowState=wsMinimized then
  begin
    Self.Top:=Screen.Height-Self.Height;
    Self.WindowState:=wsMinimized;
  end;
  //Self.Width:=Screen.Width;
  Self.Left:=Screen.Width - Self.Width;
  TimerShow.Enabled:=true;

end;

procedure TMapSeekCarForm.SB_QueryClick(Sender: TObject);
var
  i,j,k:integer;
  dev:TDevice;
  fromTime,toTime : TDateTime ;
  fromTimeStr,toTimeStr:string;
  dataSet:TClientDataSet;
  note:TcxTreeListNode;
  //carNo:string;
  find_ListADItem:TcxTreeListNode;
  procedure addList;
  begin // ProgressBar2.StepIt;
    note:=CarList.Add;
    note.Values[0]:=dev.Car.No;
    note.Values[1]:=dataSet.FindField('stime').AsString;
    note.Values[2]:=FormatFloat('##0.0', dataSet.FindField('speed').AsInteger/10); {dataSet.FindField('speed').AsInteger;//ls}
    note.Values[3]:=FormatFloat('##0.000000',(dataSet.FindField('Longitude').AsFloat));
    note.Values[4]:=FormatFloat('##0.000000',(dataSet.FindField('Latitude').AsFloat));
    //==============存车辆信息===============================//
    new(ASingledev);
    ASingledev.carno:=note.Values[0];
    ASingledev.datetime:=note.Values[1];
    ASingledev.speed:=note.Values[2];
    ASingledev.jd:=note.Values[3];
    ASingledev.wd:=note.Values[4];
    carlist1.Add(ASingledev);
  end;
begin
  if DaysBetween(end_date.date, start_date.date) > 1 then
  begin
//    messagebox(handle,'请将查询时间范围缩短至两天内!','提示',mb_ok + mb_iconinformation);
    ShowTips('请将查询时间范围缩短至两天内', end_time);
    exit;
  end;

  fromTime := start_date.DateTime;
  ReplaceTime(fromTime,start_time.Time);
  toTime := end_date.DateTime;
  ReplaceTime(toTime,end_time.Time);

  if fromTime > toTime then
  begin
    messagebox(handle,'起始时间不能大于结束时间，请重新选择时间!','提示',mb_ok + mb_iconinformation);
    end_time.SetFocus;
    exit;
  end;    

  CarList.Clear;
  isStop:=false;


  fromTimeStr:=formatDatetime('yyyy-MM-dd HH:mm:ss',fromTime);
  toTimeStr:=formatDatetime('yyyy-MM-dd HH:mm:ss',toTime);

  ProgressBar1.Max:= ListViewTo.Items.Count*10;
  QueryDevPostion := TQueryDevPostion.Create('', fromTimeStr, toTimeStr,
                                             beginp.Y, beginp.X, endp.Y, endp.X, SB_Query);
  QueryDevPostion.ProgressBar1 := ProgressBar1;
  QueryDevPostion.ListViewTo := ListViewTo;
  QueryDevPostion.CheckBoxAll := CheckBoxAll;
  QueryDevPostion.CheckBoxFirst := CheckBoxFirst;
  QueryDevPostion.CheckBoxLast := CheckBoxLast;
  QueryDevPostion.CarList := CarList;
  QueryDevPostion.OnQueryReturn := GetQueryReturnInfo;

  {for i:=0 to ListViewTo.Items.Count-1 do
  begin
      if isStop then break;
      dev:=TDevice(ListViewTo.Items.Item[i].Data);
      Application.ProcessMessages;
      ProgressBar1.StepIt;
      try
        dataSet:=bs.QueryDevPostion(dev.fact_id, dev.Id,fromTimeStr,toTimeStr,beginp.Y,beginp.X,endp.Y,endp.X);
      except
        on E: Exception do
        begin
          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
          ProgressBar1.Position:=0;
          exit;
        end;
      end;
      if dataSet=nil then continue;
      if dataSet.RecordCount=0 then continue;
      Application.ProcessMessages;
      if CheckBoxAll.Checked then //显示所有数据
      begin
          dataSet.First;
          while(not dataSet.Eof) do
          begin
             AddList;
             dataSet.Next;
          end;
      end
      else
      begin
          if CheckBoxFirst.Checked then //只显示最早时间
          begin
              dataSet.First;
              AddList;
          end;
          if dataSet.RecordCount=1 then continue;
          if CheckBoxLast.Checked then  //只显示最晚时间
          begin
              dataSet.Last;
              AddList;
          end;
      end;
      Application.ProcessMessages;
  end;
  ProgressBar1.Position:=0;
  if isStop then exit;
  inc(carfindTime);
  label6.Caption:=inttostr(carfindTime);
  cxTreeList1.Clear;
  if  checkbox1.Checked then
  begin

  end else
  begin
    //===首先比较carlist1  和 carlist2 提取相同的dev
    if carfindTime=1 then
    begin
       for k:=0 to carlist1.Count-1 do
       begin
          carlist2.Add(carlist1.Items[k]);
       end;
       carlist1.Clear;
       exit;
    end;
    cxTreeList1.Clear;
    if  carfindTime mod 2=0 then      //偶数时候 carlist3  值为 carlist1 与 carlist2的交集
    begin
      if carlist2.Count>0 then
      begin
        for j:=0 to  carlist1.Count-1 do
        begin
          for k:=0 to carlist2.Count-1 do
          begin
            if pSingleDev(carlist1.Items[j]).carno=pSingleDev(carlist2.Items[k]).carno  then
            begin
               //===加载没有出现的数据==//
               find_ListADItem:=FindNodeByADTextIncxTreeList(pSingleDev(carlist2.Items[k]).datetime,cxTreeList1,1);
               if find_ListADItem=nil then
               begin
                 carlist3.Add(carlist2.Items[k]);
               end else
               begin
                 find_ListADItem.Delete;
               end;
               note:=cxTreeList1.Add;
               note.Values[0]:=pSingleDev(carlist2.Items[k]).carno;   //显示原始数据
               note.Values[1]:=pSingleDev(carlist2.Items[k]).datetime;
               note.Values[2]:=pSingleDev(carlist2.Items[k]).speed;
               note.Values[3]:=pSingleDev(carlist2.Items[k]).jd;
               note.Values[4]:=pSingleDev(carlist2.Items[k]).wd;
               //====删除相同的数据==================//
            end;
          end;
        end;
        //===清空 ===//
        carlist2.Clear;
        carlist1.Clear;
      end;
    end else
    begin
       if carlist3.Count>0 then
       begin
         for j:=0 to  carlist1.Count-1 do
         begin
           for k:=0 to carlist3.Count-1 do
           begin
             if pSingleDev(carlist1.Items[j]).carno=pSingleDev(carlist3.Items[k]).carno   then
             begin
               find_ListADItem:=FindNodeByADTextIncxTreeList(pSingleDev(carlist3.Items[k]).datetime,cxTreeList1,1);
               if find_ListADItem=nil then
               begin
                 carlist2.Add(carlist1.Items[j]);
               end else
               begin
                 find_ListADItem.Delete;
               end;
               note:=cxTreeList1.Add;
               note.Values[0]:=pSingleDev(carlist3.Items[k]).carno;
               note.Values[1]:=pSingleDev(carlist3.Items[k]).datetime;
               note.Values[2]:=pSingleDev(carlist3.Items[k]).speed;
               note.Values[3]:=pSingleDev(carlist3.Items[k]).jd;
               note.Values[4]:=pSingleDev(carlist3.Items[k]).wd;
             end;
           end;
         end;
         carlist3.Clear;
         carlist1.Clear;
       end;
    end;
  end;    }
end;

procedure TMapSeekCarForm.CheckBoxFirstClick(Sender: TObject);
begin
   if not(CheckBoxFirst.Checked or CheckBoxLast.Checked or CheckBoxAll.Checked)then
   begin
       MessageBox(Self.Handle,pchar('必须选择一个选项'),'提示',mb_ok + mb_iconinformation);
       TCheckBox(Sender).Checked:=true;
   end;
end;

procedure TMapSeekCarForm.BitBtn3Click(Sender: TObject);
begin
  //  Self.FormStyle := fsNormal;
  Self.WindowState := wsMinimized;
  if CxTreeListToCSVFile(CarList) then
  begin

  end;
  Self.WindowState := wsNormal;
//  Self.FormStyle := fsStayOnTop;
// CxTreeListToCSVFile(CarList);
end;

procedure TMapSeekCarForm.BitBtn1Click(Sender: TObject);
var
  dlg : TFrmSelectDevs;
  i   : integer;
  dev : Tdevice;
begin
  dlg:= TFrmSelectDevs.Create(nil);
  try
    dlg.FormStyle := fsStayOnTop;
    dlg.ShowModal;
    if dlg.ModalResult = mrOk then
    begin
      ListViewTo.Items.Clear;
      if dlg.DestList.Count >0 then
      begin
        for i:= 0 to dlg.DestList.Count - 1 do
        begin
          dev:= Tdevice(dlg.DestList.Items[i].Data);
          if dev= nil then Continue;
          with ListViewTo.Items.Add do
          begin
            Data := dev;
            Caption := dev.Car.No;
            //SubItems.Add(dev.IdStr);
          end;
        end;
      end;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TMapSeekCarForm.BitBtn2Click(Sender: TObject);
begin
  if ListViewTo.Selected <> nil then
    ListViewTo.Selected.Delete;
end;

procedure TMapSeekCarForm.BitBtnStopClick(Sender: TObject);
begin
  if QueryDevPostion <> nil then
  begin
    QueryDevPostion.isStop:=true;
  end;
end;

procedure TMapSeekCarForm.CreateParams(var Param: TCreateParams);
begin
   Inherited CreateParams(Param);
   Param.wndParent := GetDesktopWindow; //getforegroundwindow
end;

procedure TMapSeekCarForm.CarListDblClick(Sender: TObject);
var
  wp:TWorldPoint;
  ep: TEarthPoint;
  x,y:integer;
 // fp:

begin
  if CarList.FocusedNode=nil then exit;
  ep.x:=CarList.FocusedNode.Values[3];
  ep.y:=CarList.FocusedNode.Values[4];
  wp:=FMap.Projection.LoLa2XY(ep);

  FMap.Zoom(1,wp);
  FMap.Draw;

  Self.Paint;

  FMap.TmpDraw.Canvas.Pen.Color := clred;
  FMap.TmpDraw.Canvas.Pen.Width :=3;
  FMap.TmpDraw.Canvas.Pen.Mode := pmMask ;
  x:= Mainf.FDlg_Map.Panel_Map.Width  div 2;
  y:= Mainf.FDlg_Map.Panel_Map.Height div 2;

  FMap.DrawTempEllipseAndText(x,y,CarList.FocusedNode.Values[0]);
end;

procedure TMapSeekCarForm.BitBtn4Click(Sender: TObject);
begin
  CxTreeListToCSVFile(cxTreeList1);
  carfindTime:=0;
end;

procedure TMapSeekCarForm.CheckBox1Click(Sender: TObject);
begin
  if  checkbox1.Checked  then
  begin
    checkbox2.Checked :=false;
    carlist3.Clear;
    carlist1.Clear;
    carlist2.Clear;
    carfindTime:=0;
  end;
end;

procedure TMapSeekCarForm.CheckBox2Click(Sender: TObject);
begin
   if checkbox2.Checked then
   begin
     checkbox1.Checked :=false;
     carfindTime:=0;
   end;
end;

function TMapSeekCarForm.FindNodeByADTextIncxTreeList(
  const FindStr: string; cxTreeList: TcxTreeList;
  ColumnOrder: Integer): TcxTreeListNode;
var
  i:integer;
begin
  result:= nil;
  for i:= 0 to cxTreeList.Count -1 do
  begin
    if cxTreeList.Items[i].Values[ColumnOrder]= FindStr then
    begin
      Result := cxTreeList.Items[i];
      Break;
    end;
  end;

end;

procedure TMapSeekCarForm.FormCreate(Sender: TObject);
begin
  label6.Caption:=inttostr(carfindTime) ;
end;

procedure TMapSeekCarForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if QueryDevPostion <> nil then
  begin
    QueryDevPostion.isStop := True;
  end;
  GAreaManage.Delete(GCurConfineAreaID);
  FMap.Draw;
end;

procedure TMapSeekCarForm.TimerCloseTimer(Sender: TObject);
begin
  try
   if  (Self.Top <= Screen.Height)and(Self.Top >=(Screen.Height-Self.Height-40))then
   begin
      Self.Top:=Self.top+15;
      exit;
   end;
   Timerclose.Enabled:=false;
   Self.Hide;
  except
  end;
end;

procedure TMapSeekCarForm.TimerShowTimer(Sender: TObject);
begin
  if Self.WindowState=wsMinimized then
  begin
   FlashWindow(Self.Handle,true);
   TimerShow.Interval:=2000;
   exit;
  end;
  if  Self.Top <= Screen.Height-Self.Height-25 then
  begin
    TimerShow.Enabled:=false;
    //Panel2.Enabled:=true;
    exit;
  end;
  TimerShow.Interval:=1;
  Self.Top:=Self.top-10;
end;

procedure TMapSeekCarForm.FormActivate(Sender: TObject);
begin
//  TimerShow.Enabled:=true;
end;

procedure TMapSeekCarForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //CanClose := False;
  //TimerClose.Enabled:=true;
end;

procedure TMapSeekCarForm.FormDeactivate(Sender: TObject);
begin
//  TimerShow.Enabled:=true;
end;

procedure TMapSeekCarForm.GetQueryReturnInfo(Info: OleVariant);
var
  i,j,k: Integer;
  find_ListADItem:TcxTreeListNode;
  note:TcxTreeListNode;
begin
  try
    if isStop then exit;
    inc(carfindTime);
    label6.Caption:=inttostr(carfindTime);
    cxTreeList1.Clear;
    if  checkbox1.Checked then
    begin

    end
    else
    begin
      //===首先比较carlist1  和 carlist2 提取相同的dev
      if carfindTime=1 then
      begin
         for k:=0 to carlist1.Count-1 do
         begin
            carlist2.Add(carlist1.Items[k]);
         end;
         carlist1.Clear;
         exit;
      end;
      cxTreeList1.Clear;
      if  carfindTime mod 2=0 then      //偶数时候 carlist3  值为 carlist1 与 carlist2的交集
      begin
        if carlist2.Count>0 then
        begin
          for j:=0 to  carlist1.Count-1 do
          begin
            for k:=0 to carlist2.Count-1 do
            begin
              if pSingleDev(carlist1.Items[j]).carno=pSingleDev(carlist2.Items[k]).carno  then
              begin
                 //===加载没有出现的数据==//
                 find_ListADItem:=FindNodeByADTextIncxTreeList(pSingleDev(carlist2.Items[k]).datetime,cxTreeList1,1);
                 if find_ListADItem=nil then
                 begin
                   carlist3.Add(carlist2.Items[k]);
                 end else
                 begin
                   find_ListADItem.Delete;
                 end;
                 note:=cxTreeList1.Add;
                 note.Values[0]:=pSingleDev(carlist2.Items[k]).carno;   //显示原始数据
                 note.Values[1]:=pSingleDev(carlist2.Items[k]).datetime;
                 note.Values[2]:=pSingleDev(carlist2.Items[k]).speed;
                 note.Values[3]:=pSingleDev(carlist2.Items[k]).jd;
                 note.Values[4]:=pSingleDev(carlist2.Items[k]).wd;
                 //====删除相同的数据==================//
              end;
            end;
          end;
          //===清空 ===//
          carlist2.Clear;
          carlist1.Clear;
        end;
      end else
      begin
         if carlist3.Count>0 then
         begin
           for j:=0 to  carlist1.Count-1 do
           begin
             for k:=0 to carlist3.Count-1 do
             begin
               if pSingleDev(carlist1.Items[j]).carno=pSingleDev(carlist3.Items[k]).carno   then
               begin
                 find_ListADItem:=FindNodeByADTextIncxTreeList(pSingleDev(carlist3.Items[k]).datetime,cxTreeList1,1);
                 if find_ListADItem=nil then
                 begin
                   carlist2.Add(carlist1.Items[j]);
                 end else
                 begin
                   find_ListADItem.Delete;
                 end;
                 note:=cxTreeList1.Add;
                 note.Values[0]:=pSingleDev(carlist3.Items[k]).carno;
                 note.Values[1]:=pSingleDev(carlist3.Items[k]).datetime;
                 note.Values[2]:=pSingleDev(carlist3.Items[k]).speed;
                 note.Values[3]:=pSingleDev(carlist3.Items[k]).jd;
                 note.Values[4]:=pSingleDev(carlist3.Items[k]).wd;
               end;
             end;
           end;
           carlist3.Clear;
           carlist1.Clear;
         end;
      end;
    end;
  finally
    ProgressBar1.Position:=0;
  end;
end;

end.
