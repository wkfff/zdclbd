unit SendDelAdInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxInplaceContainer, cxControls, StdCtrls, Buttons,DBClient,CarUnit;

type
 TAdInfo = record
     ID:integer;
     AdInfo:string;
     BeginTime:TDatetime;
     EndTime:TDatetime;
     Customer:string;
     LinkName:string;
     Tel:string;
     Memo:string;
 end;

  TSendDelAdInfoForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    DevList: TcxTreeList;
    cxCarNO: TcxTreeListColumn;
    cxDevID: TcxTreeListColumn;
    Panel4: TPanel;
    AdInfoList: TcxTreeList;
    cxID: TcxTreeListColumn;
    cxadMemo: TcxTreeListColumn;
    cxbeginTime: TcxTreeListColumn;
    cxendTime: TcxTreeListColumn;
    cxcustomerName: TcxTreeListColumn;
    cxlinkName: TcxTreeListColumn;
    cxTel: TcxTreeListColumn;
    cxMemo: TcxTreeListColumn;
    Panel6: TPanel;
    Panel7: TPanel;
    Splitter1: TSplitter;
    BitBtnDelSelectDev: TBitBtn;
    EditCurrentAdInfo: TEdit;
    Label1: TLabel;
    BitBtnQueryOverAd: TBitBtn;
    BitBtnQueryNotOverAd: TBitBtn;
    BitBtnQueryAllAd: TBitBtn;
    BitBtnSend: TBitBtn;
    BitBtnClose: TBitBtn;
    procedure AdInfoListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnQueryOverAdClick(Sender: TObject);
    procedure BitBtnQueryAllAdClick(Sender: TObject);
    procedure BitBtnDelSelectDevClick(Sender: TObject);
    procedure BitBtnSendClick(Sender: TObject);
  private
    procedure ShowAdInfo;
    procedure DataSetToArray(DataSet:TClientDataSet);
    { Private declarations }
  public
     SelectAdInfoNode:TcxTreeListNode;
    { Public declarations }
  end;

var
  SendDelAdInfoForm: TSendDelAdInfoForm;
  AdInfos:array of TAdInfo;

implementation
    uses uGloabVar;
{$R *.dfm}

procedure TSendDelAdInfoForm.AdInfoListClick(Sender: TObject);
var
  DataSet: TClientDataSet;
  i:integer;
  node:TcxTreeListNode;
begin
    SelectAdInfoNode:=AdInfoList.FocusedNode;
    if SelectAdInfoNode<>nil then
    begin
        DevList.Clear;
        EditCurrentAdInfo.Text:=SelectAdInfoNode.Values[1];
        DataSet:=bs.QueryDevByADId(SelectAdInfoNode.Values[0]);
        if DataSet=nil then exit;

        for i:=0 to DataSet.RecordCount-1 do
        begin
            node:=DevList.Add;
            node.Values[0]:=DataSet.FieldValues['Car_NO'];
            node.Values[1]:=DataSet.FieldValues['Dev_ID'];
            DataSet.Next;
        end;

    end;
end;

procedure TSendDelAdInfoForm.FormCreate(Sender: TObject);
begin
   EditCurrentAdInfo.Clear;
   SelectAdInfoNode:=nil;
end;

procedure TSendDelAdInfoForm.BitBtnQueryOverAdClick(Sender: TObject);

begin
  DataSetToArray(bs.QueryAdInfoOverTime(1));
end;



procedure TSendDelAdInfoForm.ShowAdInfo;
var
  i,count:integer;
  node:TcxTreeListNode;
begin
  AdInfoList.Clear;
  count:=length(AdInfos);
  for i:=0 to count-1 do
  begin
      node:=AdInfoList.Add;
      node.Values[0]:=AdInfos[i].ID;
      node.Values[1]:=AdInfos[i].AdInfo;
      node.Values[2]:=AdInfos[i].BeginTime;
      node.Values[3]:=AdInfos[i].EndTime;
      node.Values[4]:=AdInfos[i].Customer;
      node.Values[5]:=AdInfos[i].LinkName;
      node.Values[6]:=AdInfos[i].Tel;
      node.Values[7]:=AdInfos[i].Memo;
      node.Data:=@AdInfos[i];
  end;

end;


procedure TSendDelAdInfoForm.DataSetToArray(DataSet: TClientDataSet);
var
  i:integer;
begin
  if DataSet=nil then
  begin

  end
  else
  begin
      SetLength(AdInfos,DataSet.RecordCount);
      for i:=0 to DataSet.RecordCount-1 do
      begin
          AdInfos[i].ID:=DataSet.FieldByName('ID').AsInteger;
          AdInfos[i].AdInfo:=DataSet.FieldByName('adMemo').AsString;
          AdInfos[i].BeginTime:=DataSet.FieldByName('beginTime').AsDateTime;
          AdInfos[i].EndTime:=DataSet.FieldByName('endTime').AsDateTime;
          AdInfos[i].Customer:=DataSet.FieldByName('customerName').AsString;
          AdInfos[i].LinkName:=DataSet.FieldByName('linkName').AsString;
          AdInfos[i].Tel:=DataSet.FieldByName('Tel').AsString;
          AdInfos[i].Memo:=DataSet.FieldByName('Memo').AsString;
          DataSet.Next;
      end;
      ShowAdInfo;
  end;
end;

procedure TSendDelAdInfoForm.BitBtnQueryAllAdClick(Sender: TObject);
begin
  DataSetToArray(bs.QueryAdInfo);
end;

procedure TSendDelAdInfoForm.BitBtnDelSelectDevClick(Sender: TObject);
begin
  if DevList.FocusedNode <> nil then
  begin
      DevList.FocusedNode.Delete;
  end;
end;

procedure TSendDelAdInfoForm.BitBtnSendClick(Sender: TObject);
var
  Dev:TDevice;
  i:integer;
  node:TcxTreeListNode;
  devid:string;
begin
  node:=SelectAdInfoNode;
  for i:=0 to DevList.Count -1 do
  begin
      devid:=DevList.Items[i].Texts[1];
      Dev:=ADeviceManage.find(devid);
      if Dev<>nil then
      begin
          DataServer.DelAdInfo(Dev,Integer(node.Values[0]));
      end
      else
      begin
         //Application.MessageBox(pchar('没有找到'+DevList.Items[i].Values[0]+'信息'),'提示',mb_ok );
          messagebox(0,pchar('没有找到'+DevList.Items[i].Texts[0]+'信息'), '提示', mb_ok + mb_iconinformation);
      end;
  end;
end;

end.
