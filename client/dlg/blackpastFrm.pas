unit blackpastFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxInplaceContainer, cxControls, StdCtrls, ExtCtrls, ComCtrls,
  Buttons, cxSplitter, ToolWin, ImgList, se_controls, ksskinstatusbar,
  Menus, ExtDlgs, cxCheckBox;
const
  _ROLE       :  Array [0..15] Of Word =
            ($8000,$4000,$2000,$1000,$0800,$0400,$0200,$0100,
             $0080,$0040,$0020,$0010,$0008,$0004,$0002,$0001);

{
Style:   0表示横向取模，从左至右，从上至下，字模排列顺序为高位在右，低位在左
              1表示纵向取模，从上至下，从左至右，字模排列顺序为高位在下，低位在上
}
const
  ary_i: array[0..15] of Integer = ($01, $02, $04, $08, $10, $20, $40, $80,
    $100, $200, $400, $800, $1000, $2000, $4000, $8000); //存储点阵相关             
type
// 图片缓冲区大小必须如此设定,不得更改
    PictType =  Array[0..511] Of Array[0..127] Of SmallInt;
    // 节目表结构,各域的顺序和大小均不得改变
    ProgType = Record
	    PictIndex	: BYTE;
	    Enter		: BYTE;
	    Leave		: BYTE;
	    Speed		: BYTE;
	    StayTime	: BYTE;
	    bFollowFlag	: BYTE;
	    bShowTimer	: BYTE;
	    bTimerPlay	: BYTE;
	    TimerMode	: BYTE;
	    WeekFlag	: BYTE;
	    StartHour	: BYTE;
	    StartMinute	: BYTE;
	    EndHour	    : BYTE;
	    EndMinute	: BYTE;
	    NotUsed0	: BYTE;
	    NotUsed1	: BYTE;
    End;

    TPlayWay=Record
      getInway:byte;
      outSideWay:byte;
      Speed:byte;
      stayTime:array[0..1] of byte;
    end;
    PPlayWay = ^TPlayWay;
  TblackpastFrma = class(TForm)
    Panel1: TPanel;
    ImageList1: TImageList;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel11: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    cxSplitter2: TcxSplitter;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    BitBtn4: TBitBtn;
    BitBtnSel: TBitBtn;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtnAdd: TBitBtn;
    BitBtnDel: TBitBtn;
    BitBtnSend: TBitBtn;
    ProgressBar1: TProgressBar;
    ImageList2: TImageList;
    ImageList3: TImageList;
    Panel10: TPanel;
    Image: TImage;
    Label10: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    SpeedButton2: TSpeedButton;
    Button4: TButton;
    Button5: TButton;
    Edit5: TEdit;
    Label13: TLabel;
    SpeedButton3: TSpeedButton;
    ComboBox4: TComboBox;
    Label14: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    AdInfoList: TcxTreeList;
    cxID: TcxTreeListColumn;
    LedMemo: TcxTreeListColumn;
    DataType: TcxTreeListColumn;
    DataSpeed: TcxTreeListColumn;
    InType: TcxTreeListColumn;
    ExitType: TcxTreeListColumn;
    x: TcxTreeListColumn;
    y: TcxTreeListColumn;
    StopTime: TcxTreeListColumn;
    Font: TcxTreeListColumn;
    IsDisTime: TcxTreeListColumn;
    ExTend: TcxTreeListColumn;
    RunTime: TcxTreeListColumn;
    EndTime: TcxTreeListColumn;
    CusTerm: TcxTreeListColumn;
    custermper: TcxTreeListColumn;
    custermtel: TcxTreeListColumn;
    memo: TcxTreeListColumn;
    ListView2: TListView;
    Image8: TImage;
    Image7: TImage;
    Image6: TImage;
    Image5: TImage;
    Image4: TImage;
    Image3: TImage;
    Image2: TImage;
    Image1: TImage;
    Image9: TImage;
    Edit6: TEdit;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    FontDialog1: TFontDialog;
    SpeedButton8: TSpeedButton;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    PopupMenu1: TPopupMenu;
    AdInfoListcxState: TcxTreeListColumn;
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtnAddClick(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
    procedure BitBtnSendClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AdInfoListClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ListView2DblClick(Sender: TObject);
    procedure ImageDblClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     CmdIDList:array of integer;
     SendP:integer;
     HaveErrorIsSet:boolean;
     picData:array[0..255] of byte;
     function getIndexID( content:string):integer;
     Procedure PictToBuff(dc:TCanvas; Var buff:PictType;
                                PictWidth:Integer;PictHeight:integer;
                                Width:integer; height:integer; color:integer);
                           
  public
    { Public declarations }

    function GetChineseLattice(bitamp: TBitmap; out LatticeData: array of char;
  Style: Integer): Boolean;

  end;
var
  blackpastFrma: TblackpastFrma;
  my:integer;
  mx:integer;
  edit6:Tedit;
  timeStopControl:boolean;
  stopLong:int64;
  lineLeft:string;//最大长度
  lineTop:string;
  choose:boolean;
  nodeSelect:TcxTreeListNode;
  start:boolean;
  p:TPlayWay;

implementation
uses uFrmSelectDevs,CarUnit, AdInfoFrmUnit,uGloabVar,
  SendDelAdInfoFrmUnit, AdNew_AdUnit,LatticesUnit, umainf,ufrmChangePass,ufrmabout,ledAdUnit;
{$R *.dfm}

procedure TblackpastFrma.BitBtnSelClick(Sender: TObject);
var
   frm: TFrmSelectDevs;
  i:integer;
begin
  frm:=TFrmSelectDevs.Create(nil);
  try
  if frm.ShowModal=mrOk then
  begin
    ListView2.Clear;
    for i:=0 to frm.DestList.Count-1 do
    begin
      with ListView2.Items.Add do
      begin
         Caption:=TDevice(frm.DestList.Items[i].Data).Car.No;
         Data:=frm.DestList.Items[i].Data;
      end;
    end;
  end;
  finally
    frm.Free;
  end;
end;

procedure TblackpastFrma.BitBtnAddClick(Sender: TObject);
var
  node,fnode:TcxTreeListNode;
var
  m,i: integer;
  filename: string;
  bmp:Tbitmap;
  backbmp:Tbitmap;
begin
   AdNew_AdFrm:=TAdNew_AdFrm.Create(self);
   isAdd:=true;
   try
      AdNew_AdFrm.ShowModal;
      if AdNew_AdFrm.ModalResult = mrOK then
      begin
          if AdNew_AdFrm.AdInfoList.FocusedNode =nil then exit;
          Image.Picture.Graphic := nil;
          Image9.Picture.Graphic:=nil;
          fnode:=AdNew_AdFrm.AdInfoList.FocusedNode;
          if  fnode.Values[2]='图片' then
          begin
             try
               Image9.Picture.LoadFromFile(fnode.Values[1]);
             except
             end;
             backbmp:=Tbitmap.Create;
             backbmp.Assign(image9.Picture.Bitmap);
             try
               bmp:=Tbitmap.Create;
               bmp.PixelFormat:=pf24bit;
               image.AutoSize:=true;
               bmp.Width:=128*3;
               bmp.Height:=16*3;
               SetStretchbltmode(bmp.Canvas.Handle,halfTone);
               stretchblt(bmp.Canvas.Handle,0,0,bmp.Width,bmp.Height,backBMP.Canvas.Handle,0,0,BACKBMP.Width,BACKBMP.Height,SRCCOPY);
               image.Picture.Bitmap.Assign(bmp);
               bmp.PixelFormat:=pf24bit;
           except
           end;
            backbmp.Free;
            BMP.Free;
          end;
          node:=AdInfoList.Add;
          node.Values[0]:=fnode.Values[0];
          node.Values[1]:=fnode.Values[1];
          node.Values[2]:=fnode.Values[2];
          node.Values[3]:=fnode.Values[3];
          node.Values[4]:=fnode.Values[4];
          node.Values[5]:=fnode.Values[5];
          node.Values[6]:=fnode.Values[6];
          node.Values[7]:=fnode.Values[7];
          node.Values[8]:=fnode.Values[8];
          node.Values[9]:=fnode.Values[9];
          node.Values[10]:=fnode.Values[10];
          node.Values[11]:=fnode.Values[11];
          node.Values[12]:=fnode.Values[12];
          node.Values[13]:=fnode.Values[13];
          node.Values[14]:=fnode.Values[14];
          node.Values[15]:=fnode.Values[15];
          node.Values[16]:=fnode.Values[16];
          node.Values[17]:=fnode.Values[17];
          combobox8.Text:=node.Values[2];
          combobox3.Text:=node.Values[3];
          combobox1.Text:=node.Values[4];
          combobox2.Text:=node.Values[5];
          edit3.Text:=node.Values[8] div 60;
          edit4.Text := node.Values[8] mod 60;
          combobox6.Text:=node.Values[9] ;
          combobox7.Text :=node.Values[10] ;
          nodeSelect:=node;
      end;
   finally
      AdNew_AdFrm.Free;
   end;
 end;

procedure TblackpastFrma.BitBtnDelClick(Sender: TObject);

begin
  if AdInfoList.FocusedNode <>nil then
   begin
      AdInfoList.FocusedNode.Delete;
   end;
end;

procedure TblackpastFrma.BitBtnSendClick(Sender: TObject);
var
  i,j:integer;
  buff:array[0..13] of byte ;
begin
   ProgressBar1.Position:=0;
   if AdInfoList.Count<=0 then
   begin
     messagebox(handle,'请添加要发送的广告信息!','提示',mb_ok + mb_iconinformation);
     exit;
   end;
   if nodeSelect=nil then
   begin
      messagebox(handle,'请选择要发送的广告信息!','提示',mb_ok + mb_iconinformation);
      exit;
   end;
   if ListView2.Items.Count <=0 then
   begin
      messagebox(handle,'请选择要发送的车辆!','提示',mb_ok + mb_iconinformation);
      exit;
   end;
   if combobox8.Text='图片' then
   begin
      if image.Picture.Graphic=nil then
      begin
         messagebox(handle,'请选择广告存在的图片内容!','提示',mb_ok + mb_iconinformation);
         exit;
      end;
      SpeedButton1.Click;
   end;
   i:=0;
   buff[0]:=getIndexID(combobox8.Text);       //数据类型
   buff[1]:=getIndexID(combobox3.Text);      // 数据速度
   buff[2]:=getIndexID(combobox1.Text);     //进入方式
   buff[3]:=getIndexID(combobox2.Text);     //退出方式
   buff[4]:=$ff;
   buff[5]:=$ff;
   buff[6]:=$ff;
   buff[7]:=$ff;

   buff[8]:=getIndexID(combobox6.Text);   //==字库
   buff[9]:=getIndexID(combobox7.Text);//时间标本

   buff[10]:=$ff;
   buff[11]:=$ff;
   buff[12]:=$ff;
   buff[13]:=$ff;

   bs.ConnectServer;
   ProgressBar1.Position:=0;
   ProgressBar1.Max:=listview2.Items.Count*10+10;
   ProgressBar1.StepIt;
   Application.ProcessMessages;

   for i:=0 to listview2.Items.Count-1 do
   begin
     if getIndexID(combobox8.Text) =1 then
       DataServer.SendAdNEWInfo(TDevice(ListView2.Items.Item[i].Data),getIndexID(combobox4.Text),nodeSelect.Values[0],buff,nodeSelect.Values[1],(strtoint(edit3.Text)*60+strtoint(edit4.Text)))
     else
       DataServer.SendAdNEWInfo(TDevice(ListView2.Items.Item[i].Data),getIndexID(combobox4.Text),nodeSelect.Values[0],buff,picData,(strtoint(edit3.Text)*60+strtoint(edit4.Text)));
       ProgressBar1.StepIt;
       Application.ProcessMessages;
  end;
 // ProgressBar1.Position:=0;
end;

procedure TblackpastFrma.PictToBuff(dc: TCanvas; var buff: PictType;
  PictWidth, PictHeight, Width, height, color: integer);
Var x,y,z,EndX,EndY : Integer;
    vC              : TColor;
    v,xv            : Word;
Begin
    // 清空缓冲区
    For y:=0 To 511 Do
        For X:=0 To 127 Do
            buff[y][x] := 0;

    // 根据图片和屏体的宽高决定截取图片的宽高,保证数据不越界
    If PictWidth >=Width  Then EndX:=Width  Else EndX:=PictWidth;
    If PictHeight>=Height Then EndY:=Height Else EndY:=PictHeight;

    // 遍历高度和宽度
    // 先截取红色
    For y:=0 To EndY-1 Do
        For x:=0 To (EndX+15) Div 16 Do
        Begin
            v := 0;
            For z:=0 To 15 Do
            Begin
                vC := dc.Pixels[x*16+z,y];
                If vC And RGB($ff,0,0) > RGB($80,0,0) Then v := v Or _ROLE[z];
            End;
            xv := (v And $ff)*256 +(v Div 256);         // 交换高低字节
            buff[y][x] := xv;
        End;
    // 双色屏再截取绿色
    If color<>0 Then
    Begin
        For y:=0 To EndY-1 Do
            For x:=0 To (EndX+15) Div 16 Do
            Begin
                v := 0;
                For z:=0 To 15 Do
                Begin
                    vC := dc.Pixels[x*16+z,y];
                    If vC And RGB(0,$ff,0) > RGB(0,$80,0) Then v := v Or _ROLE[z];
                End;
                xv := (v And $ff)*256 +(v Div 256);   // 交换高低字节
                buff[y+Height][x] := xv;
            End;
    End;
End;

procedure TblackpastFrma.ToolButton2Click(Sender: TObject);
var
  node,fnode:TcxTreeListNode;
begin
   AdNew_AdFrm:=TAdNew_AdFrm.Create(Self);
   AdNew_AdFrm.ShowModal ;
end;

procedure TblackpastFrma.Button3Click(Sender: TObject);
var
 i:integer;

begin
     image.Canvas.brush.color:=clGreen;
     Image.Picture.Bitmap.Canvas.Brush.Style:=BSClear;
     image.Canvas.font.size:=edit6.Font.Size;
     image.Canvas.font.color:=clRed;
     image.Canvas.TextOut(MX,MY,edit6.Text);
     edit6.Hide;
end;

procedure TblackpastFrma.Button2Click(Sender: TObject);

begin
  
  image1.Left:=0;
  image1.Top:=0;
  //===进入方法控制==//
  timeStopControl:=true;
  stopLong:=0;
  p.getInway:=combobox1.ItemIndex+1;
  p.outSideWay:=combobox2.ItemIndex+1;
  p.Speed:=combobox3.ItemIndex+1;

  p.stayTime[0]:=StrToInt('$'+Copy(IntToHex(strtoint(edit3.Text)*60+strtoint(edit4.Text),4),1,2));
  p.stayTime[1]:=StrToInt('$'+Copy(IntToHex(strtoint(edit3.Text)*60+strtoint(edit4.Text),4),3,2));
  //====根据 设置状态 执行相关操作===//

  case p.getInway of          //进入方式//
    01:begin
       image1.Left:=image1.Width;        //从右到左
       image1.Top:=0;
    end;
    02:begin
                          //从左到右移入
    end;
    03:begin
                               //从上倒下移入
    end;
    04:begin
       image1.Top:=image1.Height;
       image1.Left:=0;                   //从下到上移入
    end;
    05:begin                    //整屏进入
       image1.Left:=0;
       image1.Top:=0;
    end;
  end;

end;

procedure TblackpastFrma.Timer2Timer(Sender: TObject);
begin
//===进入===//
 {
  if timeStopControl then         //是否停留
  begin
      //....计算停留时间....//
      case p.getInway of
        01:begin
          if image1.Left>3 then
          begin
            image1.Left:=image1.Left-3;       //从右到左
          end else
          begin
             stopLong:=stopLong+timer2.Interval ;
             if stopLong>=(strtoint(edit3.Text)*60+strtoint(edit4.Text))*1000 then
             begin
                timeStopControl:=false;
             end;
          end;
        end;
        02:begin
          if image1.Left<3 then
          begin
            image1.Left:=image1.Left+3;
          end else
          begin
             stopLong:=stopLong+timer2.Interval ;
             if stopLong>=(strtoint(edit3.Text)*60+strtoint(edit4.Text))*1000 then
             begin
                timeStopControl:=false;
             end;
          end;
        end;
        03:begin
          if image1.Top<3 then
          begin
            image1.Top:=image1.Top+3;
          end else
          begin
             stopLong:=stopLong+timer2.Interval ;
             if stopLong>=(strtoint(edit3.Text)*60+strtoint(edit4.Text))*1000 then
             begin
                timeStopControl:=false;
             end;
          end;
        end;
        04:begin
          if image1.Top>3 then
          begin
            image1.Top:=image1.Top-3;
          end else
          begin
             stopLong:=stopLong+timer2.Interval ;
             if stopLong>=(strtoint(edit3.Text)*60+strtoint(edit4.Text))*1000 then
             begin
                timeStopControl:=false;
             end;
          end;
        end;
        05:begin
          image1.Top:=0;
          image1.Left:=0;
        end else
          begin
             stopLong:=stopLong+timer2.Interval ;
             if stopLong>=(strtoint(edit3.Text)*60+strtoint(edit4.Text))*1000 then
             begin
                timeStopControl:=false;
             end;
          end;
      end;
  end else         //===出去
  begin
    {case p.outSideWay of
    01:begin
      if image1.Left>-image1.Width then
      begin
        image1.Left:=image1.Left-1;
      end;
    end;
    02:begin
    end;
    03:begin
    end;
    04:begin
    end;
    05:begin
    end;
  end;   
 end;  }
end;

procedure TblackpastFrma.SpeedButton2Click(Sender: TObject);
var
  i,j:integer;
  buff:array[0..13] of byte ;
begin
  ProgressBar1.Position:=0;
   if AdInfoList.Count<=0 then
   begin
     messagebox(handle,'请添加要发送的广告信息!','提示',mb_ok + mb_iconinformation);
     exit;
   end;

   if nodeSelect=nil then
   begin
      messagebox(handle,'请选择要发送的广告信息!','提示',mb_ok + mb_iconinformation);
      exit;
   end;

   if ListView2.Items.Count <=0 then
   begin
      messagebox(handle,'请选择要发送的车辆!','提示',mb_ok + mb_iconinformation);
      exit;
   end;

   if combobox8.ItemIndex =1 then
   begin
      if image.Picture.Graphic=nil then
      begin
         messagebox(handle,'请选择广告存在的图片内容!','提示',mb_ok + mb_iconinformation);
         exit;
      end;
      SpeedButton1.Click;
   end;

   i:=0;

   buff[0]:=getIndexID(combobox8.Text);       //数据类型
   buff[1]:=getIndexID(combobox3.Text);      // 数据速度
   buff[2]:=getIndexID(combobox1.Text);     //进入方式
   buff[3]:=getIndexID(combobox2.Text);     //退出方式

   buff[4]:=$ff;
   buff[5]:=$ff;
   buff[6]:=$ff;
   buff[7]:=$ff;

   buff[8]:=getIndexID(combobox6.Text);   //==字库
   buff[9]:=getIndexID(combobox7.Text);//时间标本

   buff[10]:=$ff;
   buff[11]:=$ff;
   buff[12]:=$ff;
   buff[13]:=$ff;

   bs.ConnectServer;
   ProgressBar1.Position:=0;
   ProgressBar1.Max:=listview2.Items.Count*10+10;
   ProgressBar1.StepIt;
   Application.ProcessMessages;

   for i:=0 to listview2.Items.Count-1 do
   begin
     if getIndexID(combobox8.Text) =1 then
       DataServer.SendShowAdInfo(TDevice(ListView2.Items.Item[i].Data),getIndexID(combobox4.Text),nodeSelect.Values[0],buff,nodeSelect.Values[1],(strtoint(edit3.Text)*60+strtoint(edit4.Text)))
     else
       DataServer.SendShowAdInfo(TDevice(ListView2.Items.Item[i].Data),getIndexID(combobox4.Text),nodeSelect.Values[0],buff,nodeSelect.Values[1],(strtoint(edit3.Text)*60+strtoint(edit4.Text)));
       ProgressBar1.StepIt;
       Application.ProcessMessages;
  end;
  //ProgressBar1.Position:=0;
end;

procedure TblackpastFrma.ToolButton9Click(Sender: TObject);
begin
  SendDelAdInfoForm:=TSendDelAdInfoForm.Create(Self);
  try
      SendDelAdInfoForm.ShowModal;
  finally
      SendDelAdInfoForm.Free;
  end;
end;

procedure TblackpastFrma.N15Click(Sender: TObject);
begin
  if listview2.Selected=nil then
  begin
    messagebox(handle,'请选择所要读取车辆!','提示',mb_ok + mb_iconinformation);
    exit;
  end else
  begin
    if ledAdUnitFrm = nil then
    begin
      ledAdUnitFrm := TledAdUnitFrm.Create(Self);
    end;
    DataServer.ReadAllAdInfo(TDevice(listview2.Selected.Data)) ;
  end;
end;

procedure TblackpastFrma.Button4Click(Sender: TObject);
var
  i:integer;
begin
   i:=0;
   if ListView2.Items.Count <=0 then exit;
   DataServer.DeleteLenAdInfo(TDevice(ListView2.Items.Item[i].Data),strtoint(edit5.Text));
end;

procedure TblackpastFrma.Button5Click(Sender: TObject);
var
  i:integer;
begin
   i:=0;
   if ListView2.Items.Count <=0 then exit;
   DataServer.DeleteAllAdInfo(TDevice(ListView2.Items.Item[i].Data));
end;

procedure TblackpastFrma.SpeedButton3Click(Sender: TObject);
var
  i:integer;
begin
   i:=0;
   if ListView2.Items.Count <=0 then exit;
   DataServer.ReadAdInfo(TDevice(ListView2.Items.Item[i].Data));
end;

procedure TblackpastFrma.SpeedButton5Click(Sender: TObject);
var
  m: integer;
  filename: string;
  bmp:Tbitmap;
  backbmp:Tbitmap;
begin
  //====加载图片====转化为图片的128*16  的三倍==//
  
  if  trim(combobox8.Text) ='文本' then
  begin
    Application.messagebox('请确定广告内容为图片数据格式!', '提示信息', mb_ok + mb_iconinformation);
    Exit;
  end;
  if OpenPictureDialog1.Execute then
  begin
    Image.Picture.Graphic := nil;
    filename := OpenPictureDialog1.filename;
    if uppercase(extractfileext(filename)) <> '.BMP' then
    begin
      Application.messagebox('请选择位图!', '提示信息', mb_ok + mb_iconinformation);
      Exit;
    end;
    Image.Picture.LoadFromFile(filename);

    backbmp:=Tbitmap.Create;
    backbmp.Assign(image.Picture.Bitmap);
    try
      bmp:=Tbitmap.Create;
      bmp.PixelFormat:=pf24bit;
      image.AutoSize:=true;
      bmp.Width:=128*3;
      bmp.Height:=16*3;
      //===保持最大不失真
      SetStretchbltmode(bmp.Canvas.Handle,halfTone);
      //===  拷贝BACKbmp 到  BMP

      stretchblt(bmp.Canvas.Handle,0,0,bmp.Width,bmp.Height,backBMP.Canvas.Handle,0,0,BACKBMP.Width,BACKBMP.Height,SRCCOPY);

      image.Picture.Bitmap.Assign(bmp);

      bmp.PixelFormat:=pf24bit;
    except
    end;
  end;


end;

procedure TblackpastFrma.ImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if not start then  exit;

 if image.Picture=nil then exit;
  //===先字体选择===//
  mx:=x;
  my:=y;
  edit6.Text:='';
  edit6.Color:=clSilver;
  if start then
  begin
    with edit6 do
    begin
      parent:=panel10;
      BorderStyle:=bsNone;
      height:=edit6.Font.Size*2;
      left:=mx;
      Top:=my;
      show;
     // setFocus;
    end;
  end;
end;

procedure TblackpastFrma.FormCreate(Sender: TObject);
 
begin
  isAdd:=false;
  start:=false;;
  choose:=false;

end;

procedure TblackpastFrma.SpeedButton1Click(Sender: TObject);
var
  LatticeData: array[1..32] of byte;
  i: Integer;
  m: integer;
var
  Rect1, Rect2, Rect3, rect4, rect5, rect6, rect7, rect8: TRect;
  w, h: integer;
var

  filename: string;
  bmp:Tbitmap;
  backbmp:Tbitmap;

begin
  //====加载图片====转化为图片的128*16  的三倍==//

    Image9.Picture.Graphic := nil;
    backbmp:=Tbitmap.Create;
    backbmp.Assign(image.Picture.Bitmap);
    try
      bmp:=Tbitmap.Create;
      bmp.PixelFormat:=pf24bit;
      image.AutoSize:=true;
      bmp.Width:=128;
      bmp.Height:=16;
      //===保持最大不失真
      SetStretchbltmode(bmp.Canvas.Handle,halfTone);
      //===  拷贝BACKbmp 到  BMP
      stretchblt(bmp.Canvas.Handle,0,0,bmp.Width,bmp.Height,backBMP.Canvas.Handle,0,0,BACKBMP.Width,BACKBMP.Height,SRCCOPY);
      image9.Picture.Bitmap.Assign(bmp);
      bmp.PixelFormat:=pf24bit;
  except
  end;


  w := Image9.Picture.Bitmap.Width div 8;
  h := Image9.Picture.Bitmap.Height;
  Rect1 := Rect(0, 0, w, h);
  Rect2 := Rect(w * 1, 0, w * 2, h);
  Rect3 := Rect(w * 2, 0, w * 3, h);
  Rect4 := Rect(w * 3, 0, w * 4, h);
  Rect5 := Rect(w * 4, 0, w * 5, h);
  Rect6 := Rect(w * 5, 0, w * 6, h);
  Rect7 := Rect(w * 6, 0, w * 7, h);
  Rect8 := Rect(w * 7, 0, w * 8, h);
  with Image1 do
  begin
    Height := 16;
    Width := 16;
    Canvas.CopyRect(Rect1, Image9.Canvas, Rect1);
  end;
  with Image2 do
  begin
    Height := h;
    Width := w;
    Canvas.CopyRect(Rect1, Image9.Canvas, Rect2);
  end;
  with Image3 do
  begin
    Height := h;
    Width := w;
    Canvas.CopyRect(Rect1, Image9.Canvas, Rect3);
  end;
  with Image4 do
  begin
    Height := h;
    Width := w;
    Canvas.CopyRect(Rect1, Image9.Canvas, Rect4);
  end;
  with Image5 do
  begin
    Height := h;
    Width := w;
    Canvas.CopyRect(Rect1, Image9.Canvas, Rect5);
  end;
  with Image6 do
  begin
    Height := h;
    Width := w;
    Canvas.CopyRect(Rect1, Image9.Canvas, Rect6);
  end;
  with Image7 do
  begin
    Height := h;
    Width := w;
    Canvas.CopyRect(Rect1, Image9.Canvas, Rect7);
  end;
  with Image8 do
  begin
    Height := h;
    Width := w;
    Canvas.CopyRect(Rect1, Image9.Canvas, Rect8);
  end;
  GetBitampLattice(image1.Picture.Bitmap, LatticeData, ComboBox1.ItemIndex);
  Copymemory(@picdata[0],@LatticeData[1],32);
 { DrawHZ(LatticeData, PaintBox1.Canvas);
  for i := 1 to 32 do
    Memo1.Lines.Text := Memo1.Lines.Text + Format('0x%.2x',
      [ord(LatticeData[i])]) + ',';
  Memo1.Lines.Text := Memo1.Lines.Text + #13#10;  }

  GetBitampLattice(image2.Picture.Bitmap, LatticeData, ComboBox1.ItemIndex);
  Copymemory(@picdata[32],@LatticeData[1],32);

  GetBitampLattice(image3.Picture.Bitmap, LatticeData, ComboBox1.ItemIndex);
  Copymemory(@picdata[64],@LatticeData[1],32);

  GetBitampLattice(image4.Picture.Bitmap, LatticeData, ComboBox1.ItemIndex);
  Copymemory(@picdata[96],@LatticeData[1],32);

  GetBitampLattice(image5.Picture.Bitmap, LatticeData, ComboBox1.ItemIndex);
  Copymemory(@picdata[96+32],@LatticeData[1],32);

  GetBitampLattice(image6.Picture.Bitmap, LatticeData, ComboBox1.ItemIndex);
  Copymemory(@picdata[96+32+32],@LatticeData[1],32);

  GetBitampLattice(image7.Picture.Bitmap, LatticeData, ComboBox1.ItemIndex);
  Copymemory(@picdata[96+32+32+32],@LatticeData[1],32);

  GetBitampLattice(image8.Picture.Bitmap, LatticeData, ComboBox1.ItemIndex);
  Copymemory(@picdata[96+32+32+32],@LatticeData[1],32);
  choose:=true;
end;

function TblackpastFrma.GetChineseLattice(bitamp: TBitmap;
  out LatticeData: array of char; Style: Integer): Boolean;
var
  bmp_Text: TBitmap;
  c_temp: char;
  w_temp: Word;
  i, j: Integer;
  cb: Byte;
begin
 bmp_Text := TBitmap.Create;                //创建背景扫描图

  with bmp_Text do
  begin
    PixelFormat := pf8bit;
    Width := 16;
    Height := 16;
    Canvas.Font.Name := '宋体';
    Canvas.Font.Size := 12;
    Canvas.Font.Color := clBlack;
    Canvas.CopyRect(Rect(0, 0, 16, 16), bitamp.Canvas, Rect(0, 0, 16, 16));
    Canvas.Refresh;
    //Canvas.BrushCopy(Rect(0,0,16,16),bitamp,bitamp.Canvas.ClipRect,bitamp.Canvas.Brush.Color);
    //Canvas.BrushCopy(Rect(0,0,16,16),bitamp,);
    //Canvas.TextRect(Rect(0,0,16,16),0,0,ChineseText);
    for i := 0 to 15 do                      //开始扫描
    begin
      w_temp := 0;
      c_temp := char(0);
      for j := 0 to 15 do
      begin
        if Style = 0 then                    //横向取模
          cb := pbyte(Integer(ScanLine[i]) + j)^
        else if Style = 1 then               //纵向取模
          cb := pbyte(Integer(ScanLine[j]) + i)^;
        if cb = $00 then                     //$ff   取反
          w_temp := ord(w_temp) or ary_i[j];
      end;
      if Style = 0 then
      begin
        c_temp := char(w_temp and $FF);
        LatticeData[i * 2] := c_temp;
        c_temp := char(w_temp shr 8);
        LatticeData[i * 2 + 1] := c_temp;
      end
      else if Style = 1 then
      begin
        c_temp := char(w_temp and $FF);
        LatticeData[i] := c_temp;
        c_temp := char(w_temp shr 8);
        LatticeData[16 + i] := c_temp;
      end;
    end;
    Free;
  end;
  Result := true;
end;


procedure TblackpastFrma.ListView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if  Button=mbright then
  begin
    listview2.PopupMenu:=PopupMenu1;
  end;
end;

procedure TblackpastFrma.AdInfoListClick(Sender: TObject);
var
  ffnode:TcxTreeListNode;
  filename: string;
  bmp:Tbitmap;
  backbmp:Tbitmap;
begin
  ffnode:=AdInfoList.FocusedNode;
  if ffnode<>nil then
  begin
    nodeSelect:=AdInfoList.FocusedNode;
    combobox3.Text:=nodeSelect.Values[3] ;
    combobox1.Text:=nodeSelect.Values[4] ;
    combobox2.Text:=nodeSelect.Values[5] ;
    edit3.Text:=nodeSelect.Values[8] div 60;
    edit4.Text := nodeSelect.Values[8] mod 60;
    combobox6.Text:=nodeSelect.Values[9] ;
    combobox7.Text :=nodeSelect.Values[10] ;
    combobox8.Text :=nodeSelect.Values[2];
    if combobox8.Text='图片' then
    begin
          Image.Picture.Graphic := nil;
          Image9.Picture.Graphic:=nil;
          if  ffnode.Values[2]='图片' then
          begin
             try
               Image9.Picture.LoadFromFile(ffnode.Values[1]);
             except
             end;
             backbmp:=Tbitmap.Create;
             backbmp.Assign(image9.Picture.Bitmap);
             try
               bmp:=Tbitmap.Create;
               bmp.PixelFormat:=pf24bit;
               image.AutoSize:=true;
               bmp.Width:=128*3;
               bmp.Height:=16*3;
               SetStretchbltmode(bmp.Canvas.Handle,halfTone);
               stretchblt(bmp.Canvas.Handle,0,0,bmp.Width,bmp.Height,backBMP.Canvas.Handle,0,0,BACKBMP.Width,BACKBMP.Height,SRCCOPY);
               image.Picture.Bitmap.Assign(bmp);
               bmp.PixelFormat:=pf24bit;
           except
           end;
            backbmp.Free;
            BMP.Free;
          end;
      end;
  end;
end;
procedure TblackpastFrma.BitBtn4Click(Sender: TObject);
begin
  if listview2.Selected<>nil then
  begin
     listview2.Selected.Delete;
  end;
end;

procedure TblackpastFrma.ListView2DblClick(Sender: TObject);
begin
  if listview2.Selected<>nil then
  begin
     listview2.Selected.Delete;
  end;
end;

procedure TblackpastFrma.ImageDblClick(Sender: TObject);
begin
  SpeedButton5.Click;
end;

procedure TblackpastFrma.Timer3Timer(Sender: TObject);
begin
  {StatusBar1.Panels.Items[2].Text:= Mainf.StatusBar1.Panels.Items[2].Text;
  StatusBar1.Panels.Items[3].Text:= Mainf.StatusBar1.Panels.Items[3].Text;
  StatusBar1.Panels.Items[4].ImageIndex :=Mainf.StatusBar1.Panels.Items[4].ImageIndex;
  StatusBar1.Panels.Items[5].ImageIndex :=Mainf.StatusBar1.Panels.Items[5].ImageIndex; }
end;

 

procedure TblackpastFrma.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if start then
  begin
    if (key=vk_return) then
    begin
       image.Canvas.brush.color:=clGreen;
       Image.Picture.Bitmap.Canvas.Brush.Style:=BSClear;
       image.Canvas.font.size:=edit6.Font.Size;
       image.Canvas.font.color:=edit6.Font.Color;
       image.Canvas.TextOut(MX,MY,edit6.Text);
       edit6.Hide;
       start:=false;
    end;
  end;
end;

procedure TblackpastFrma.N6Click(Sender: TObject);
begin
  close;
end;

procedure TblackpastFrma.N4Click(Sender: TObject);
  var dlg: TfrmChangePass;
begin
  dlg:= TfrmChangePass.Create(self);
  try
    dlg.edit1.Text:= current_user.UserName ;
    dlg.edit2.Text:='';
    dlg.edit3.Text:='';
    dlg.edit4.Text:='';
    dlg.ShowModal ;
    if dlg.ModalResult = mrok then
    begin       
      try
        if bs.ChangePassword(current_user,trim(dlg.edit3.text)) then
        begin
          messagebox(handle,'密码修改完成！','提示',mb_ok + mb_iconinformation);
          Current_user.Password :=trim(dlg.edit3.text);
        end;
      except
        on E:exception do
           begin
             messagebox(0,pchar(e.Message ),'提示',mb_ok + mb_iconinformation);
           end;
      end;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TblackpastFrma.N12Click(Sender: TObject);
var dlg:Tfrmabout;
begin
  dlg:= TfrmAbout.Create(self);
  try    
    dlg.ShowModal ;
  finally
    dlg.Free;
  end;
end;

procedure TblackpastFrma.ToolButton6Click(Sender: TObject);
begin
  close;
end;

procedure TblackpastFrma.SpeedButton7Click(Sender: TObject);
begin
  if image.Picture.Graphic=nil then
  begin
     messagebox(handle,'对不起，请选择所发广告图片！','提示',mb_ok + mb_iconinformation);
     exit;
  end;
 start:=true;
end;

procedure TblackpastFrma.SpeedButton8Click(Sender: TObject);
begin
    if FontDialog1.Execute  then
    begin
       Edit6.Font.Name:=FontDialog1.Name;
       Edit6.Font.Size:=FontDialog1.Font.Size;
       Edit6.Font.Color:=FontDialog1.Font.Color;
    end;
end;

procedure TblackpastFrma.N5Click(Sender: TObject);
begin
  close;
end;

procedure TblackpastFrma.SpeedButton6Click(Sender: TObject);
begin
  close;
end;

function TblackpastFrma.getIndexID( content: string): integer;
var
  ii:integer;
begin
    result:=0;
    if content='从右到左'  then  ii:=1;
    if content='从左到右'  then  ii:=2;
    if content='从上到下'  then  ii:=3;
    if content='从下到上'  then  ii:=4;
    if content='整屏进入'  then  ii:=5;
    if content='显示时间'  then  ii:=1;
    if content='不显示时间'  then  ii:=0;
    if content='文本'  then  ii:=1;
    if content='图片'  then  ii:=2;
    if content='一级'  then  ii:=1;
    if content='二级'  then  ii:=2;
    if content='三级'  then  ii:=3;
    if content='四级'  then  ii:=4;
    if content='五级'  then  ii:=5;
    if content='六级'  then  ii:=6;
    if content='七级'  then  ii:=7;
    if content='八级'  then  ii:=8;
    if content='简体'  then  ii:=0;
    if content='其它'  then  ii:=1;
    if content='一号屏'  then  ii:=0;
    if content='二号屏'  then  ii:=1;
    if content='三号屏'  then  ii:=2;
    result:=ii;

end;

procedure TblackpastFrma.FormShow(Sender: TObject);
begin
  if GCurSelectDev<>nil then
    begin
    with ListView2.Items.Add do
    begin
      caption:=GCurSelectDev.Car.No;
      Data:=GCurSelectDev;
    end;
  end;
end;

end.
