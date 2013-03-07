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
    // 0: ����ָ�������Ϣ�� 1������ָ���Ĺ����Ϣ�� 2����ѯ��ǰ���ڲ��ŵĹ����Ϣ��3����ѯLCD�ڵĹ����Ϣ
    // 4��ɾ��ָ���Ĺ����Ϣ��5��ɾ�����еĹ����Ϣ
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
   messagebox(handle,'��ǰ����û�й����Ϣ!','��ʾ',mb_ok + mb_iconinformation);
end;

procedure TSendVideoFrm.SendVideo();
var
  msstream: TMemoryStream;
  i: Integer;
  D:TDevice;
begin
    if Trim(Edit1.Text) = '' then
  begin
    messagebox(handle,'��ѡ����Ƶ�ļ�!','��ʾ',mb_ok + mb_iconinformation);
    Edit1.SetFocus;
    Exit;
  end;

  try
    try
      msstream := TMemoryStream.Create;
      msstream.LoadFromFile(Edit1.Text); //Write(info.Photo[0],length(info.Photo));
    except
      messagebox(handle,'������Ƶ�ļ�ʧ�ܣ�������ѡ��!','��ʾ',mb_ok + mb_iconinformation);
      Edit1.SetFocus;
    end;

    PanProgress.Visible:=true;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    BitBtn1.Enabled:=false;

    for i:=0 to ListView1.Items.Count -1 do
    begin
      if Cancel then
      begin
        if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
      messagebox(handle, '��ѡ����Ҫ��ʾ�Ĺ����Ϣ��', '��ʾ', MB_OK + MB_ICONINFORMATION);
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
        if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
      messagebox(handle, '��ѡ��Ҫ���صĹ���ļ���', '��ʾ', MB_OK + MB_ICONINFORMATION);
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
        if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
      messagebox(handle,'��ѡ��Ҫ���صĹ���ļ�!','��ʾ',mb_ok + mb_iconinformation);
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
        if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
        if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
        if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
      messagebox(handle, '��ѡ����Ҫɾ���Ĺ����Ϣ��', '��ʾ', MB_OK + MB_ICONINFORMATION);
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
        if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
        if messagebox(handle, '�Ƿ�ȷʵҪȡ����ʣ�೵���Ĳ�����', '��ʾ', MB_YESNO + MB_ICONQUESTION) = ID_YES then
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
