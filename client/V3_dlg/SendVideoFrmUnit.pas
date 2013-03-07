unit SendVideoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TSendVideoFrm = class(TBaseFrm)
    OpenDialog1: TOpenDialog;
    Notebook1: TNotebook;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton4: TSpeedButton;
    ListView2: TListView;
    ListView3: TListView;
    ListView4: TListView;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PanViewAdInfo: TPanel;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    CheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    CheckBox3: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    // 0: 发送指定广告信息； 1：下载指定的广告信息； 2：查询当前正在播放的广告信息；3：查询LCD内的广告信息
    // 4：删除指定的广告信息；5：删除所有的广告信息
    SendType: Byte;
    procedure SendViewAdInfo();
    procedure SendVideo();
    procedure DownLoadAdInfo();
    procedure QueryAdInfo();
    procedure QueryAllAdInfo();
    procedure DeleteAdInfo();
    procedure DeleteAllAdInfo();
    procedure ShowAdInfoCount();
  end;

var
  SendVideoFrm: TSendVideoFrm;

implementation
uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TSendVideoFrm.ShowAdInfoCount();
begin
   messagebox(handle,'当前车机没有广告信息!','提示',mb_ok + mb_iconinformation);
end;

procedure TSendVideoFrm.SendVideo();
var
  msstream: TMemoryStream;
  i: Integer;
  D:TDevice;
begin
    if Trim(Edit1.Text) = '' then
  begin
    messagebox(handle,'请选择视频文件!','提示',mb_ok + mb_iconinformation);
    Edit1.SetFocus;
    Exit;
  end;

  try
    try
      msstream := TMemoryStream.Create;
      msstream.LoadFromFile(Edit1.Text); //Write(info.Photo[0],length(info.Photo));
    except
      messagebox(handle,'加载视频文件失败，请重新选择!','提示',mb_ok + mb_iconinformation);
      Edit1.SetFocus;
    end;

    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    BitBtn1.Enabled:=false;

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
      DataServer.SendVideo_V3(D, msstream);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    BitBtn1.Enabled:=true;
  end;
 Close;
end;

procedure TSendVideoFrm.SendViewAdInfo();
var
  i: Integer;
  D:TDevice;
  AdInfo: string;
  ShuXing: Word;
begin
  try
    if (ListView2.Selected = nil) and (Trim(Edit2.Text)='') then
    begin
      messagebox(handle, '请选择需要显示的广告信息！', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if Trim(Edit2.Text) <> '' then
      AdInfo := Trim(Edit2.Text)
    else if ListView2.Selected <> nil then
      AdInfo := ListView2.Selected.SubItems.Strings[0];
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    BitBtn1.Enabled:=false;

    if RadioButton5.Checked then
      ShuXing := 0;
    if RadioButton6.Checked then
      ShuXing := 4;
    if CheckBox3.Checked then
      ShuXing := ShuXing + 8;

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
      DataServer.SendViewAdInfo_V3(D, AdInfo, ShuXing);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    BitBtn1.Enabled:=true;
  end;
 Close;
end;

procedure TSendVideoFrm.DownLoadAdInfo();
var
  i: Integer;
  D:TDevice;
  AdInfo: string;
  ShuXing: Word;
begin
    try
    if (ListView2.Selected = nil) and (Trim(Edit2.Text)='') then
    begin
      messagebox(handle, '请选择要下载的广告文件！', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if Trim(Edit2.Text) <> '' then
      AdInfo := Trim(Edit2.Text)
    else if ListView2.Selected <> nil then
      AdInfo := ListView2.Selected.SubItems.Strings[0];
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    BitBtn1.Enabled:=false;

    if RadioButton5.Checked then
      ShuXing := 0;
    if RadioButton6.Checked then
      ShuXing := 4;
    if CheckBox3.Checked then
      ShuXing := ShuXing + 8;

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
      DataServer.SendDownLoadAdInfo_V3(D, AdInfo, ShuXing);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    BitBtn1.Enabled:=true;
  end;
 Close;
  {try
    if Trim(Edit1.Text) = '' then
    begin
      messagebox(handle,'请选择要下载的广告文件!','提示',mb_ok + mb_iconinformation);
      Edit1.SetFocus;
      Exit;
    end;

    AdInfo := Trim(Edit1.Text);
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    BitBtn1.Enabled:=false;
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
      DataServer.SendDownLoadAdInfo_V3(D, AdInfo);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    BitBtn1.Enabled:=true;
  end;
 Close;   }
end;

procedure TSendVideoFrm.QueryAdInfo();
var
  i: Integer;
  D:TDevice;
  ShuXing: Word;
begin
  try
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    BitBtn1.Enabled:=false;

    if RadioButton3.Checked then
      ShuXing := 0;
    if RadioButton4.Checked then
      ShuXing := 4;
    if CheckBox2.Checked then
      ShuXing := ShuXing + 8;

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
      DataServer.SendQueryAdInfo(D, ShuXing);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    BitBtn1.Enabled:=true;
  end;
 Close;
end;

procedure TSendVideoFrm.QueryAllAdInfo();
var
  i: Integer;
  D:TDevice;
begin
  try
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    BitBtn1.Enabled:=false;
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
      DataServer.SendQueryAllAdInfo(D);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    BitBtn1.Enabled:=true;
  end;
 //Close;
end;

procedure TSendVideoFrm.DeleteAdInfo();
var
  i: Integer;
  D:TDevice;
  AdInfo: string;
begin
  try
    if ListView4.Selected = nil then
    begin
      messagebox(handle, '请选择需要删除的广告信息！', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    AdInfo := ListView4.Selected.SubItems.Strings[0];
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    BitBtn1.Enabled:=false;
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
      DataServer.SendDeleteAdInfo_V3(D, AdInfo);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    BitBtn1.Enabled:=true;
  end;
 Close;
end;

procedure TSendVideoFrm.DeleteAllAdInfo();
var
  i: Integer;
  D:TDevice;
  ShuXing: Word;
begin
  try
    ShuXing := 0;
    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    BitBtn1.Enabled:=false;

    if RadioButton1.Checked then
      ShuXing := 0;
    if RadioButton2.Checked then
      ShuXing := 4;
    if CheckBox1.Checked then
      ShuXing := ShuXing + 8;

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
      DataServer.SendDeleteAllAdInfo_V3(D, ShuXing);
      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      Sleep(50);
      Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    BitBtn1.Enabled:=true;
  end;
 Close;
end;

procedure TSendVideoFrm.SpeedButton4Click(Sender: TObject);
var
  i: Integer;
  temp: Integer;
  len: Integer;
  filename: string;
begin
  if OpenDialog1.Execute then
  begin
    Edit1.Text := ExtractFileName(OpenDialog1.FileName);
   { len := Length(filename);
    i := 0;
    while i<len do
    begin
      temp := Pos('\', filename);
      if temp>0 then
      begin
        filename := Copy(filename, temp+1, len);
      end
      else
      begin
        Edit1.Text := filename;
        Break;
      end;
      i := i + 1;
    end; }
  end;
end;

procedure TSendVideoFrm.BitBtn1Click(Sender: TObject);
begin
  case SendType of
    0: SendViewAdInfo();
    1: DownLoadAdInfo();
    2: QueryAdInfo();
    3: QueryAllAdInfo();
    4: DeleteAdInfo();
    5: DeleteAllAdInfo();
  end;

end;

procedure TSendVideoFrm.N1Click(Sender: TObject);
begin
  PanViewAdInfo.Visible := True;
  if OpenDialog1.Execute then
  begin
    Edit2.Text := ExtractFileName(OpenDialog1.FileName);
  end;

end;

procedure TSendVideoFrm.SpeedButton1Click(Sender: TObject);
begin
  PanViewAdInfo.Visible := False;

end;

end.
