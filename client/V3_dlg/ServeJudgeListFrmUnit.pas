unit ServeJudgeListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, CarUnit, uGloabVar, CmdStructUnit,
  DateUtils, Menus, AccuseFrmUnit;

type
  TServeJudgeListFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn_List100: TBitBtn;
    BitBtn_Clr: TBitBtn;
    Panel3: TPanel;
    ServeJudgeListView: TListView;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure BitBtn_List100Click(Sender: TObject);
    procedure BitBtn_ClrClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoOnServeJudge(pBuf: PByte; Dev: TDevice);
  end;

var
  ServeJudgeListFrm: TServeJudgeListFrm;

implementation
uses umainf;
{$R *.dfm}

{ TServeJudgeListFrm }

function BCDToInt(ABuff:Pointer): Integer; // 将BCD字符串转换为整形
var
  i:integer;
  temp: string;
begin
  temp:='';
  inc(PByte(ABuff));
  for i:=0 to 2 do
  begin
    temp:=temp+InttoHex(PByte(ABuff)^,2);
    inc(PByte(ABuff));
  end;
  Result := StringToInteger(temp);
end;

procedure TServeJudgeListFrm.DoOnServeJudge(pBuf: PByte; Dev: TDevice);
var
  p: PCmdSrvTermServeJudge_V3;
  DateTime: TDateTime;
  year: Integer;
  month: Word;
  day: Word;
  hour: Word;
  minute: Word;
  second: Word;
  dev_id: Integer;
  i: Integer;
  CarNo: string;
  temp: string;
  syyje, xslc, kslc: Double;
begin
  try
    //dev_id := BCDToInt(@PCmdSrvTermDRunData_V3(pBuf)^.GpsData.DevId[0]);
    //dev := ADeviceManage.find(dev_id);
    if dev <> nil then
    begin
      if PCmdSrvTermDRunData_V3(pBuf)^.Server_Type = 4 then
      begin
        with ServeJudgeListView.Items.Add do
        begin
          Data:=pBuf;

          Caption:=IntToStr(dev_id);

          CarNo := dev.Car.No; //ADeviceManage.FindToCarNO(dev_id);
          SubItems.Add(CarNo);
          SubItems.Add(IntToStr(PCmdSrvTermDRunData_V3(pBuf)^.Run_id));

          year :=  StrToInt('20' + IntToHex(PCmdSrvTermDRunData_V3(pBuf)^.GpsTime[0], 2));
          month := StrToInt(IntToHex(PCmdSrvTermDRunData_V3(pBuf)^.GpsTime[1], 2));
          day := StrToInt(IntToHex(PCmdSrvTermDRunData_V3(pBuf)^.GpsTime[2], 2));
          hour := StrToInt(IntToHex(PCmdSrvTermDRunData_V3(pBuf)^.GpsTime[3], 2));
          minute := StrToInt(IntToHex(PCmdSrvTermDRunData_V3(pBuf)^.GpsTime[4], 2));
          second := StrToInt(IntToHex(PCmdSrvTermDRunData_V3(pBuf)^.GpsTime[5], 2));
          try
            SubItems.Add(GetDateTimeByID(PCmdSrvTermDRunData_V3(pBuf)^.Server_ID));
          except
            SubItems.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));
          end;

          case PCmdSrvTermDRunData_V3(pBuf)^.Server_Type of
            0:
              begin
                SubItems.Add('未评价');
              end;
            1:
              begin
                SubItems.Add('满意');
                //dev.MY := dev.MY + 1;
              end;
            2: SubItems.Add('一般');
            3:
              begin
                SubItems.Add('不满意');
                //dev.BMY := dev.BMY + 1;
              end;
            4:
              begin
                SubItems.Add('投诉');
                //dev.AccuseNum := dev.AccuseNum + 1;
                //FComplaintsCount := FComplaintsCount + 1;
                PopMsg('服务评价信息', CarNo + ' 来投诉评价信息了');
              end;
            else
              SubItems.Add('未知');
          end;

          SubItems.Add('未知');

          SubItems.Add(DateTimeToStr(Now));
        end;
      end;

      {case PCmdSrvTermDRunData_V3(pBuf)^.Server_Type of
        0:;   // 未评价
        1:    // 满意
          begin
            dev.MY := dev.MY + 1;
          end;
        2:;   // 一般
        3:    // 不满意
          begin
            dev.BMY := dev.BMY + 1;
          end;
        4:    // 投诉
          begin
            dev.AccuseNum := dev.AccuseNum + 1;
            FComplaintsCount := FComplaintsCount + 1;
          end;
      end;

      try
        temp := BCDToStr(@PCmdSrvTermDRunData_V3(pBuf)^.RunJE[0], 3);
        syyje := StrToFloat(Copy(temp, 1, 5) + '.' + Copy(temp, 6, 1));
        dev.syyje := dev.syyje + syyje;   // 营运金额

        temp :=  BCDToStr(@PCmdSrvTermDRunData_V3(pBuf)^.NoRunDistanct[0], 2);
        kslc := StrToFloat(Copy(temp, 1, 3) + '.' + Copy(temp, 4, 1));
        dev.kslc := dev.kslc + kslc;      // 空驶里程

        temp := BCDToStr(@PCmdSrvTermDRunData_V3(pBuf)^.RunDistanct[0], 3); // 营运里程
        xslc := StrToFloat(Copy(temp, 1, 5) + '.' + Copy(temp, 6, 1));
        dev.xslc := dev.xslc + xslc + kslc;      // 行驶里程

        dev.ksl := FormatFloat('0.00', dev.kslc /(dev.xslc));
      except
      end; }
    end;
  except
  end;
end;

procedure TServeJudgeListFrm.N1Click(Sender: TObject);
var
  frm: TAccuseFrm;
begin
  if ServeJudgeListView.Selected = nil then Exit;
  if ServeJudgeListView.Selected.SubItems.Strings[3] <> '投诉'{PCmdSrvTermServeJudge_V3(ServeJudgeListView.Selected.Data)^.ServeID <> 4} then
  begin
    MessageBox(Handle,'此信息不是投诉信息，不能受理！','提示',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  try
    frm := TAccuseFrm.Create(nil);
    frm.Caption := '投诉受理';
    frm.DealType := 4;
    frm.ComboBoxState.ItemIndex := 1;
    frm.PanelNew.Align := alClient;
    frm.PanelDeal.Visible := False;
    frm.PanelCheck.Visible := False;
    frm.ComboBoxType.ItemIndex := 0;
    frm.Height := 460; 
    frm.EditAccuse_Carno.Text := ServeJudgeListView.Selected.SubItems.Strings[0];
    frm.editRunDataID.Text := ServeJudgeListView.Selected.SubItems.Strings[1];
    frm.Datecase_HappenDate.DateTime := StrToDateTime(ServeJudgeListView.Selected.SubItems.Strings[2]);
    frm.Datecase_HappenTime.DateTime := StrToDateTime(ServeJudgeListView.Selected.SubItems.Strings[2]);
    //frm.MemoAccuse_Reason.Text := ServeJudgeListView.Selected.SubItems.Strings[4];
    frm.Show;
  finally
  end;
end;

procedure TServeJudgeListFrm.BitBtn_List100Click(Sender: TObject);
var
  i: Integer;
begin
  while ServeJudgeListView.Items.Count > 10 do
  begin
    ServeJudgeListView.Items.Delete(ServeJudgeListView.Items.Count-1);
  end;
end;

procedure TServeJudgeListFrm.BitBtn_ClrClick(Sender: TObject);
begin
  ServeJudgeListView.Clear;
end;

procedure TServeJudgeListFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.Show_ServeJudgeList.Checked := False;
end;

end.
