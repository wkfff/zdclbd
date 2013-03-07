unit AdInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, StdCtrls, ComCtrls, Buttons, cxCalendar,DBClient;

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

  TAdInfoForm = class(TForm)
    Panel2: TPanel;
    AdInfoList: TcxTreeList;
    cxID: TcxTreeListColumn;
    cxadMemo: TcxTreeListColumn;
    cxbeginTime: TcxTreeListColumn;
    cxendTime: TcxTreeListColumn;
    cxcustomerName: TcxTreeListColumn;
    cxlinkName: TcxTreeListColumn;
    cxTel: TcxTreeListColumn;
    cxMemo: TcxTreeListColumn;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    EditAdInfo: TMemo;
    Panel5: TPanel;
    DateTimeBegin: TDateTimePicker;
    DateTimeEnd: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditCustomer: TEdit;
    Label4: TLabel;
    EditLinkName: TEdit;
    Label5: TLabel;
    EditTel: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EditMemo: TEdit;
    ButtonAdd: TButton;
    ButtonModifiy: TButton;
    ButtonDel: TButton;
    BitBtnSelect: TBitBtn;
    BitBtnClose: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnSelectClick(Sender: TObject);
    procedure AdInfoListDblClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure AdInfoListClick(Sender: TObject);
    procedure ButtonDelClick(Sender: TObject);
  private
    { Private declarations }
  public
     procedure ShowAdInfo;
     function AddAdInfo(AdInfo:string;BeginTime,EndTime:TDatetime;Customer,LinkName,Tel,Memo:string):boolean;
     function DelAdInfo(AdInfoID:integer):boolean;
     function ModifyAdInfo(AdInfoID:integer;AdInfo:string;BeginTime,EndTime:TDatetime;Customer,LinkName,Tel,Memo:string):boolean;
     function QueryAdInfo:boolean;
     procedure CleanEdit;
    { Public declarations }
  end;

var
  AdInfoForm: TAdInfoForm;
  AdInfos:array of TAdInfo;

  
implementation
     uses uGloabVar;
{$R *.dfm}

{ TAdInfoForm }

function TAdInfoForm.AddAdInfo(AdInfo: string; BeginTime, EndTime: TDatetime; Customer, LinkName, Tel, Memo: string):boolean;
var
  id,count:integer;
  node:TcxTreeListNode;
begin
    Result:=false;
    id:=bs.AddNewAdInfo(AdInfo,BeginTime,EndTime,Customer,LinkName,Tel,Memo);
    if id>0 then
    begin
        count:=length(AdInfos);
        Setlength(AdInfos,count+1);
        AdInfos[count].ID:=id;
        AdInfos[count].AdInfo:=AdInfo;
        AdInfos[count].BeginTime:=BeginTime;
        AdInfos[count].EndTime:=EndTime;
        AdInfos[count].Customer:=Customer;
        AdInfos[count].LinkName:=LinkName;
        AdInfos[count].Tel:=Tel;
        AdInfos[count].Memo:=Memo;

        node:=AdInfoList.Add;
        node.Values[0]:=ID;
        node.Values[1]:=AdInfo;
        node.Values[2]:=BeginTime;
        node.Values[3]:=EndTime;
        node.Values[4]:=Customer;
        node.Values[5]:=LinkName;
        node.Values[6]:=Tel;
        node.Values[7]:=Memo;
        node.Data:=@AdInfos[count];
        Result:=true;
    end
end;

function TAdInfoForm.DelAdInfo(AdInfoID: integer): boolean;
begin
    Result:=false;
    bs.DeleteAdInfo(AdInfoID);
end;

function TAdInfoForm.ModifyAdInfo(AdInfoID: integer; AdInfo: string;
  BeginTime, EndTime: TDatetime; Customer, LinkName, Tel,
  Memo: string): boolean;
begin

end;

function TAdInfoForm.QueryAdInfo: boolean;
var
  DataSet:TClientDataSet;
  i:integer;
begin
  DataSet:=bs.QueryAdInfo;
  if DataSet=nil then
  begin
      Result:=false;
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

procedure TAdInfoForm.ShowAdInfo;
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

procedure TAdInfoForm.FormCreate(Sender: TObject);
begin
  CleanEdit;
  if Length(AdInfos)=0 then
  begin
      QueryAdInfo;
  end
  else
  begin
      
      ShowAdInfo;
  end;
end;

procedure TAdInfoForm.BitBtnSelectClick(Sender: TObject);
begin
  Close;
  Self.ModalResult:=mrOk;
end;

procedure TAdInfoForm.AdInfoListDblClick(Sender: TObject);
begin
  
  if BitBtnSelect.Enabled then
  begin
     BitBtnSelectClick(nil);
  end;
end;

procedure TAdInfoForm.ButtonAddClick(Sender: TObject);
begin
  if AddAdInfo(EditAdInfo.Text,DateTimeBegin.Date,DateTimeEnd.Date,EditCustomer.Text,EditLinkName.Text,EditTel.Text,EditMemo.Text) then
     CleanEdit;

end;

procedure TAdInfoForm.CleanEdit;
begin
EditAdInfo.Clear;
DateTimeBegin.Date:=now;
DateTimeEnd.Date:=now+30;
EditCustomer.Clear;
EditLinkName.Clear;
EditTel.Clear;
EditMemo.Clear;
end;

procedure TAdInfoForm.AdInfoListClick(Sender: TObject);
var
    node:TcxTreeListNode;
begin
   if AdInfoList.FocusedNode <>nil then
   begin
        node:=AdInfoList.FocusedNode;
        EditAdInfo.Text:=node.Values[1] ;
        DateTimeBegin.Date:=node.Values[2] ;
        DateTimeEnd.Date:=node.Values[3];
        EditCustomer.Text:=node.Values[4];
        EditLinkName.Text:=node.Values[5];
        EditTel.Text:=node.Values[6];
        EditMemo.Text:=node.Values[7];

   end;
end;

procedure TAdInfoForm.ButtonDelClick(Sender: TObject);
var
    node:TcxTreeListNode;
begin
  if AdInfoList.FocusedNode=nil then
  begin
      messagebox(handle,'请选择一条广告','提示',mb_ok + mb_iconinformation);
      exit;
  end;
  if  messagebox(handle,PChar('您确定要删除['+EditAdInfo.Text+']广告'),'提示',MB_OKCANCEL + MB_ICONQUESTION)= ID_OK then
  begin
     node:=AdInfoList.FocusedNode;
     DelAdInfo(node.Values[0]);
     node.Delete;
  end;



end;

end.
