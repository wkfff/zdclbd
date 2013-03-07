unit EmptyFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, ComCtrls, StdCtrls,
  Buttons, cxControls, cxInplaceContainer, TeEngine, Series, TeeProcs,
  Chart, DbChart, ExtCtrls, cxTextEdit, DB, ADODB,DateUtils, cxSplitter;

type
  TEmptyFrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ADOQuery1: TADOQuery;
    Panel3: TPanel;
    Panel2: TPanel;
    SpeedButton4: TSpeedButton;
    Label2: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    CheckBox1: TCheckBox;
    cxSplitter2: TcxSplitter;
    Panel5: TPanel;
    AdInfoList: TcxTreeList;
    AdInfoListcxTreeListColumn1: TcxTreeListColumn;
    AdInfoListcxTreeListColumn2: TcxTreeListColumn;
    AdInfoListcxTreeListColumn3: TcxTreeListColumn;
    AdInfoListcxTreeListColumn4: TcxTreeListColumn;
    AdInfoListcxTreeListColumn5: TcxTreeListColumn;
    AdInfoListcxTreeListColumn6: TcxTreeListColumn;
    AdInfoListcxTreeListColumn7: TcxTreeListColumn;
    AdInfoListcxTreeListColumn8: TcxTreeListColumn;
    AdInfoListcxTreeListColumn9: TcxTreeListColumn;
    AdInfoListcxTreeListColumn10: TcxTreeListColumn;
    AdInfoListcxTreeListColumn11: TcxTreeListColumn;
    AdInfoListcxTreeListColumn12: TcxTreeListColumn;
    AdInfoListcxTreeListColumn13: TcxTreeListColumn;
    AdInfoListcxTreeListColumn14: TcxTreeListColumn;
    AdInfoListcxTreeListColumn15: TcxTreeListColumn;
    AdInfoListcxTreeListColumn16: TcxTreeListColumn;
    AdInfoListcxTreeListColumn17: TcxTreeListColumn;
    AdInfoListcxTreeListColumn18: TcxTreeListColumn;
    AdInfoListcxTreeListColumn19: TcxTreeListColumn;
    AdInfoListcxTreeListColumn20: TcxTreeListColumn;
    AdInfoListcxTreeListColumn21: TcxTreeListColumn;
    AdInfoListcxTreeListColumn22: TcxTreeListColumn;
    AdInfoListcxTreeListColumn23: TcxTreeListColumn;
    AdInfoListcxTreeListColumn24: TcxTreeListColumn;
    AdInfoListcxTreeListColumn25: TcxTreeListColumn;
    AdInfoListcxTreeListColumn26: TcxTreeListColumn;
    Panel1: TPanel;
    DBChart1: TDBChart;
    FastLineSeries1: TLineSeries;
    Panel4: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    cxSplitter1: TcxSplitter;
    procedure Button1Click(Sender: TObject);
    procedure AdInfoListClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmptyFrm: TEmptyFrm;

implementation
uses umainf,uGloabVar, ConstDefineUnit;
{$R *.dfm}

procedure TEmptyFrm.Button1Click(Sender: TObject);
var
  date_begin:string;
  date_end:string;
  username_n:string;
  node:TcxTreeListNode;
  i:integer;
begin
  date_begin:= FormatDateTime('yyyy-mm-dd', DateTimePicker1.date);
  date_end:= FormatDateTime('yyyy-mm-dd', DateTimePicker2.date);
  username_n:=trim(current_user.userName);
  if Mainf.connectionAccess  then
  begin
    ADOQuery1.Connection:=Mainf.ADOConnection1;
    ADOQuery1.Close;
    if not checkbox1.Checked  then
    begin
      ADOQuery1.SQL.Text :='select * from Empty_date where date_M>'''+ trim(date_begin)+''' and date_M<'''+ trim(date_end)+''' and username_n='''+username_n+'''' ;
    end else
    begin
      ADOQuery1.SQL.Text :='select * from Empty_date where date_M>'''+ trim(date_begin)+''' and date_M<'''+ trim(date_end)+'''' ;
    end;
    ADOQuery1.Open;
    AdInfoList.Clear;
    if  ADOQuery1.RecordCount>0 then //==加载 到 列表数据中
    begin
      for i:=0 to  ADOQuery1.RecordCount-1 do
      begin
        node:=AdInfoList.Add;
        node.Values[0]:=trim(ADOQuery1.fieldbyname('date_M').AsString);
        node.Values[1]:=trim(ADOQuery1.fieldbyname('h0').AsString);
        node.Values[2]:=trim(ADOQuery1.fieldbyname('h1').AsString);
        node.Values[3]:=trim(ADOQuery1.fieldbyname('h2').AsString);
        node.Values[4]:=trim(ADOQuery1.fieldbyname('h3').AsString);
        node.Values[5]:=trim(ADOQuery1.fieldbyname('h4').AsString);
        node.Values[6]:=trim(ADOQuery1.fieldbyname('h5').AsString);
        node.Values[7]:=trim(ADOQuery1.fieldbyname('h6').AsString);
        node.Values[8]:=trim(ADOQuery1.fieldbyname('h7').AsString);
        node.Values[9]:=trim(ADOQuery1.fieldbyname('h8').AsString);
        node.Values[10]:=trim(ADOQuery1.fieldbyname('h9').AsString);
        node.Values[11]:=trim(ADOQuery1.fieldbyname('h10').AsString);
        node.Values[12]:=trim(ADOQuery1.fieldbyname('h11').AsString);
        node.Values[13]:=trim(ADOQuery1.fieldbyname('h12').AsString);
        node.Values[14]:=trim(ADOQuery1.fieldbyname('h13').AsString);
        node.Values[15]:=trim(ADOQuery1.fieldbyname('h14').AsString);
        node.Values[16]:=trim(ADOQuery1.fieldbyname('h15').AsString);
        node.Values[17]:=trim(ADOQuery1.fieldbyname('h16').AsString);
        node.Values[18]:=trim(ADOQuery1.fieldbyname('h17').AsString);
        node.Values[19]:=trim(ADOQuery1.fieldbyname('h18').AsString);
        node.Values[20]:=trim(ADOQuery1.fieldbyname('h19').AsString);
        node.Values[21]:=trim(ADOQuery1.fieldbyname('h20').AsString);
        node.Values[22]:=trim(ADOQuery1.fieldbyname('h21').AsString);
        node.Values[23]:=trim(ADOQuery1.fieldbyname('h22').AsString);
        node.Values[24]:=trim(ADOQuery1.fieldbyname('h23').AsString);
        node.Values[25]:=trim(ADOQuery1.fieldbyname('username_n').AsString);
        if node.Values[1]='' then
        begin
          node.Values[1]:=0;
        end;
        if node.Values[2]='' then
        begin
          node.Values[2]:=0;
        end;
        if node.Values[3]='' then
        begin
          node.Values[3]:=0;
        end;
        if node.Values[4]='' then
        begin
          node.Values[4]:=0;
        end;
        if node.Values[5]='' then
        begin
          node.Values[5]:=0;
        end;
        if node.Values[6]='' then
        begin
          node.Values[6]:=0;
        end;
        if node.Values[7]='' then
        begin
          node.Values[7]:=0;
        end;
        if node.Values[8]='' then
        begin
          node.Values[8]:=0;
        end;
        if node.Values[9]='' then
        begin
          node.Values[9]:=0;
        end;
        if node.Values[10]='' then
        begin
          node.Values[10]:=0;
        end;
        if node.Values[11]='' then
        begin
          node.Values[11]:=0;
        end;
        if node.Values[12]='' then
        begin
          node.Values[12]:=0;
        end;
        if node.Values[13]='' then
        begin
          node.Values[13]:=0;
        end;
        if node.Values[14]='' then
        begin
          node.Values[14]:=0;
        end;
        if node.Values[15]='' then
        begin
          node.Values[15]:=0;
        end;
        if node.Values[16]='' then
        begin
          node.Values[16]:=0;
        end;
        if node.Values[17]='' then
        begin
          node.Values[17]:=0;
        end;
        if node.Values[18]='' then
        begin
          node.Values[18]:=0;
        end;
        if node.Values[17]='' then
        begin
          node.Values[17]:=0;
        end;
        if node.Values[18]='' then
        begin
          node.Values[18]:=0;
        end;
        if node.Values[19]='' then
        begin
          node.Values[19]:=0;
        end;
        if node.Values[20]='' then
        begin
          node.Values[20]:=0;
        end;
        if node.Values[21]='' then
        begin
          node.Values[21]:=0;
        end;
        if node.Values[22]='' then
        begin
          node.Values[22]:=0;
        end;
        if node.Values[23]='' then
        begin
          node.Values[23]:=0;
        end;
        if node.Values[24]='' then
        begin
          node.Values[24]:=0;
        end;
        ADOQuery1.Next;
      end;
    end else
    begin
      messagebox(handle,'对不起,没有空车率数据!','提示',mb_ok + mb_iconinformation);
      exit;
    end;
  end;
end;

procedure TEmptyFrm.AdInfoListClick(Sender: TObject);
var
  node:TcxTreeListNode;
begin
   node:=AdInfoList.FocusedNode;
   if node<>nil then
   begin
     label3.Caption:=node.Values[0];
     with DBChart1.Series[0] do
     begin
      Clear;
      AddXY(0, node.Values[1], '0');
      AddXY(1, node.Values[2], '1');
      AddXY(2, node.Values[3], '2');
      AddXY(3, node.Values[4], '3');
      AddXY(4, node.Values[5], '4');
      AddXY(5, node.Values[6], '5');
      AddXY(6, node.Values[7], '6');
      AddXY(7, node.Values[8], '7');
      AddXY(8, node.Values[9], '8');
      AddXY(9, node.Values[10], '9');
      AddXY(10, node.Values[11], '10');
      AddXY(11, node.Values[12], '11');
      AddXY(12, node.Values[13], '12');
      AddXY(13, node.Values[14], '13');
      AddXY(14, node.Values[15], '14');
      AddXY(15, node.Values[16], '15');
      AddXY(16, node.Values[17], '16');
      AddXY(17, node.Values[18], '17');
      AddXY(18, node.Values[19], '18');
      AddXY(19, node.Values[20], '19');
      AddXY(20, node.Values[21], '20');
      AddXY(21, node.Values[22], '21');
      AddXY(22, node.Values[23], '22');
      AddXY(23, node.Values[24], '23');
    end;
   end;
end;

procedure TEmptyFrm.SpeedButton4Click(Sender: TObject);
begin
  close;
end;

procedure TEmptyFrm.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=incday(now,-29);
  DateTimePicker2.Date:=IncDay(now);
end;

procedure TEmptyFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ManualDock(nil);
end;

procedure TEmptyFrm.SpeedButton1Click(Sender: TObject);
var
  date_begin:string;
  date_end:string;
  username_n:string;
  node:TcxTreeListNode;
  i:integer;
begin
  date_begin:= FormatDateTime('yyyy-mm-dd', DateTimePicker1.date);
  date_end:= FormatDateTime('yyyy-mm-dd', DateTimePicker2.date);

  if date_begin > date_end then
  begin
    messagebox(handle, '开始日期应小于结束日期，请检查！', '提示信息', mb_ok + mb_iconinformation);
    exit;
  end;

  username_n:=trim(current_user.userName);
  try
    if Mainf.connectionAccess  then
    begin
      ADOQuery1.Connection:=Mainf.ADOConnection1;
      ADOQuery1.Close;
      if not checkbox1.Checked  then
      begin
        ADOQuery1.SQL.Text :='select * from Empty_date where date_M>'''+ trim(date_begin)+''' and date_M<'''+ trim(date_end)+''' and username_n='''+username_n+'''' ;
      end else
      begin
        ADOQuery1.SQL.Text :='select * from Empty_date where date_M>'''+ trim(date_begin)+''' and date_M<'''+ trim(date_end)+'''' ;
      end;
      ADOQuery1.Open;
      AdInfoList.Clear;
      if  ADOQuery1.RecordCount>0 then //==加载 到 列表数据中
      begin
        for i:=0 to  ADOQuery1.RecordCount-1 do
        begin
          node:=AdInfoList.Add;
          node.Values[0]:=trim(ADOQuery1.fieldbyname('date_M').AsString);
          node.Values[1]:=trim(ADOQuery1.fieldbyname('h0').AsString);
          node.Values[2]:=trim(ADOQuery1.fieldbyname('h1').AsString);
          node.Values[3]:=trim(ADOQuery1.fieldbyname('h2').AsString);
          node.Values[4]:=trim(ADOQuery1.fieldbyname('h3').AsString);
          node.Values[5]:=trim(ADOQuery1.fieldbyname('h4').AsString);
          node.Values[6]:=trim(ADOQuery1.fieldbyname('h5').AsString);
          node.Values[7]:=trim(ADOQuery1.fieldbyname('h6').AsString);
          node.Values[8]:=trim(ADOQuery1.fieldbyname('h7').AsString);
          node.Values[9]:=trim(ADOQuery1.fieldbyname('h8').AsString);
          node.Values[10]:=trim(ADOQuery1.fieldbyname('h9').AsString);
          node.Values[11]:=trim(ADOQuery1.fieldbyname('h10').AsString);
          node.Values[12]:=trim(ADOQuery1.fieldbyname('h11').AsString);
          node.Values[13]:=trim(ADOQuery1.fieldbyname('h12').AsString);
          node.Values[14]:=trim(ADOQuery1.fieldbyname('h13').AsString);
          node.Values[15]:=trim(ADOQuery1.fieldbyname('h14').AsString);
          node.Values[16]:=trim(ADOQuery1.fieldbyname('h15').AsString);
          node.Values[17]:=trim(ADOQuery1.fieldbyname('h16').AsString);
          node.Values[18]:=trim(ADOQuery1.fieldbyname('h17').AsString);
          node.Values[19]:=trim(ADOQuery1.fieldbyname('h18').AsString);
          node.Values[20]:=trim(ADOQuery1.fieldbyname('h19').AsString);
          node.Values[21]:=trim(ADOQuery1.fieldbyname('h20').AsString);
          node.Values[22]:=trim(ADOQuery1.fieldbyname('h21').AsString);
          node.Values[23]:=trim(ADOQuery1.fieldbyname('h22').AsString);
          node.Values[24]:=trim(ADOQuery1.fieldbyname('h23').AsString);
          node.Values[25]:=trim(ADOQuery1.fieldbyname('username_n').AsString);
          if node.Values[1]='' then
          begin
            node.Values[1]:=0;
          end;
          if node.Values[2]='' then
          begin
            node.Values[2]:=0;
          end;
          if node.Values[3]='' then
          begin
            node.Values[3]:=0;
          end;
          if node.Values[4]='' then
          begin
            node.Values[4]:=0;
          end;
          if node.Values[5]='' then
          begin
            node.Values[5]:=0;
          end;
          if node.Values[6]='' then
          begin
            node.Values[6]:=0;
          end;
          if node.Values[7]='' then
          begin
            node.Values[7]:=0;
          end;
          if node.Values[8]='' then
          begin
            node.Values[8]:=0;
          end;
          if node.Values[9]='' then
          begin
            node.Values[9]:=0;
          end;
          if node.Values[10]='' then
          begin
            node.Values[10]:=0;
          end;
          if node.Values[11]='' then
          begin
            node.Values[11]:=0;
          end;
          if node.Values[12]='' then
          begin
            node.Values[12]:=0;
          end;
          if node.Values[13]='' then
          begin
            node.Values[13]:=0;
          end;
          if node.Values[14]='' then
          begin
            node.Values[14]:=0;
          end;
          if node.Values[15]='' then
          begin
            node.Values[15]:=0;
          end;
          if node.Values[16]='' then
          begin
            node.Values[16]:=0;
          end;
          if node.Values[17]='' then
          begin
            node.Values[17]:=0;
          end;
          if node.Values[18]='' then
          begin
            node.Values[18]:=0;
          end;
          if node.Values[17]='' then
          begin
            node.Values[17]:=0;
          end;
          if node.Values[18]='' then
          begin
            node.Values[18]:=0;
          end;
          if node.Values[19]='' then
          begin
            node.Values[19]:=0;
          end;
          if node.Values[20]='' then
          begin
            node.Values[20]:=0;
          end;
          if node.Values[21]='' then
          begin
            node.Values[21]:=0;
          end;
          if node.Values[22]='' then
          begin
            node.Values[22]:=0;
          end;
          if node.Values[23]='' then
          begin
            node.Values[23]:=0;
          end;
          if node.Values[24]='' then
          begin
            node.Values[24]:=0;
          end;
          ADOQuery1.Next;
        end;
      end else
      begin
        messagebox(handle,'对不起,没有空车率数据!','提示',mb_ok + mb_iconinformation);
        exit;
      end;
    end;
  except
    on E: Exception do
    begin
      messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
      exit;
    end;
  end;
end;

end.
