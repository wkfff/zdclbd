unit InfoServerFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, StdCtrls, ComCtrls, Buttons, ExtCtrls, CmdStructUnit,
  RzButton;

type
  TInfoServerFrm = class(TBaseFrm)
    EditType: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    cbxInfoType: TComboBox;
    RzBitBtn1: TRzBitBtn;
    procedure EditTypeKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure EditTypeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure cbxInfoTypeChange(Sender: TObject);
  private
    { Private declarations }
    currInfoIndex: Integer;
  public
    { Public declarations }
  end;

var
  InfoServerFrm: TInfoServerFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TInfoServerFrm.EditTypeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', #22]) then
  begin
    Key := #0;
    EditType.SetFocus;
  end;
end;

procedure TInfoServerFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  infoType: TInfoType;
begin
//  if Trim(EditType.Text) = '' then
//  begin
//    messagebox(handle,'信息类型不能为空','提示',mb_ok + mb_iconinformation);
//    EditType.SetFocus;
//    Exit;
//  end;
  if cbxInfoType.ItemIndex < 0 then
  begin
    ShowTips('请选择信息类型', cbxInfoType);
    cbxInfoType.SetFocus;
    Exit;
  end;
  Memo1.Text := Trim(Memo1.Text);
  if (Memo1.Text = '') then
  begin
    ShowTips('请输入服务信息内容', Memo1);
    Memo1.SetFocus;
    Exit;
  end;
  if Length(Memo1.Text) > 500 then
  begin
    ShowTips('信息内容总长度不能超过500，请确认输入', Memo1);
    Memo1.SetFocus;
    Exit;
  end;
  infoType := TInfoType(cbxInfoType.Items.Objects[cbxInfoType.ItemIndex]);
  if infoType = nil then
  begin
    ShowTips('获取选择的信息类型不正确，请确认', cbxInfoType);
    Exit;
  end;  
  try
    ProgressBar1.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    for i:=0 to ListView1.Items.Count -1 do
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

      D:=TDevice(ListView1.Items.Item[i].Data);
      ProgressBar1.StepIt;


      ProgressBar1.StepIt;
      DataServer.SendInfoServer_V3(D, infoType.InfoTypeId, Trim(memo1.Text));
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      //Application.ProcessMessages;
    end;
  finally
    ProgressBar1.Visible:=False;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

procedure TInfoServerFrm.EditTypeChange(Sender: TObject);
begin
  if StringToInteger(Trim(EditType.Text)) >= 256 then
  begin
    ShowTips('信息类型不能超过256',EditType);
    EditType.Text := '255';
    EditType.SetFocus;
  end;             
end;

procedure TInfoServerFrm.FormCreate(Sender: TObject);
var
  i: Integer;
  infoType: TInfoType;
begin
  cbxInfoType.Clear;
  for i := 0 to FInfoTypeManage.Count - 1 do
  begin
    infoType := FInfoTypeManage.Items[i];
    cbxInfoType.Items.AddObject(infoType.InfoTypeName, infoType);
  end;
  cbxInfoType.ItemIndex := 0;
  currInfoIndex := -1;
  RzBitBtn1.Click;
end;

procedure TInfoServerFrm.RzBitBtn1Click(Sender: TObject);
var
  infoType: TInfoType;
  info: TInfo;
begin
  if cbxInfoType.ItemIndex < 0 then Exit;
  infoType := TInfoType(cbxInfoType.Items.Objects[cbxInfoType.ItemIndex]);
  if infoType = nil then Exit;

  if infoType.InfoCount = 0 then Exit;
  Inc(currInfoIndex);
  if currInfoIndex + 1 > infoType.InfoCount then
    currInfoIndex := 0;
  info := infoType.InfoItem[currInfoIndex];
  if info <> nil then
    Memo1.Text := info.InfoContent;
end;

procedure TInfoServerFrm.cbxInfoTypeChange(Sender: TObject);
begin
  currInfoIndex := -1;
  Memo1.Lines.Clear;
  RzBitBtn1.Click;
end;

end.
