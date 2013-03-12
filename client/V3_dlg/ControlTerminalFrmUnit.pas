unit ControlTerminalFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrmUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls, DBClient, CmdStructUnit,
  inifiles, Carunit;

type
  TControlTerminalFrm = class(TBaseFrm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Label7: TLabel;
    Label8: TLabel;
    Edit88: TEdit;
    Label9: TLabel;
    Edit99: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit1: TComboBox;
    Edit2: TComboBox;
    Edit3: TComboBox;
    Edit4: TComboBox;
    Edit5: TComboBox;
    Label13: TLabel;
    Edit13: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    Edit111: TEdit;
    Edit127: TEdit;
    Edit8: TComboBox;
    Edit9: TComboBox;
    Edit11: TComboBox;
    Edit12: TComboBox;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    Label10: TLabel;
    Edit10: TComboBox;
    Label14: TLabel;
    Edit14: TComboBox;
    Label15: TLabel;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Edit99KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
  private
    { Private declarations }
    function checkInput(): Boolean;
    function GetWirelessUpgradeParam(): string;
    function GetConnServerParam(dev: TDevice): string;
  public
    { Public declarations }
    IniFile: TIniFile;
    procedure InitialCombobox;
  end;

var
  ControlTerminalFrm: TControlTerminalFrm;

implementation
uses uFrmSelectDevs,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TControlTerminalFrm.Edit5KeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TControlTerminalFrm.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  s:string;
begin
  try
    PanProgress.Visible := True;
    ProgressBar1.Max:=ListView1.Items.Count*5*10;
    TbitBtn(Sender).Enabled:=false;
    if RadioButton6.Checked then
    begin
      //"拨号点名称;拨号用户名;拨号密码;地址;端口;制造商ID"
      s:= GetWirelessUpgradeParam;
    end
    else if RadioButton7.Checked then
    begin
      s := GetConnServerParam(D);
    end;
                              
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
      if RadioButton6.Checked then
      begin
        if not IsBeiDouDev(D) then
        DataServer.SendControlTerminal_V3(D,1,s);
      end
      else if RadioButton7.Checked then
      begin
        DataServer.SendControlTerminal_V3(D, 2, s);
      end
      else if RadioButton1.Checked then
      begin
        DataServer.SendControlTerminal_V3(d,3);
      end
      else if RadioButton2.Checked then
      begin
        dataserver.SendControlTerminal_V3(d,4);
      end
      else if RadioButton3.Checked then
      begin
        dataserver.SendControlTerminal_V3(d,5);
      end
      else if RadioButton4.Checked then
      begin
        dataserver.SendControlTerminal_V3(d,6);
      end
      else if RadioButton5.Checked then
      begin
        dataserver.SendControlTerminal_V3(d,7);
      end;

      ProgressBar1.StepIt;
      ProgressBar1.StepIt;
      //Sleep(50);
      //Application.ProcessMessages;
    end;
  finally
    PanProgress.Visible:=False;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

procedure TControlTerminalFrm.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Cancel := True;
end;

procedure TControlTerminalFrm.RadioButton6Click(Sender: TObject);
begin
  Edit1.Enabled := RadioButton6.Checked or RadioButton7.Checked;
  Edit2.Enabled := RadioButton6.Checked or RadioButton7.Checked;
  Edit3.Enabled := RadioButton6.Checked or RadioButton7.Checked;
  Edit4.Enabled := RadioButton6.Checked or RadioButton7.Checked;
  Edit5.Enabled := RadioButton6.Checked or RadioButton7.Checked;
  ComboBox1.Enabled := RadioButton6.Checked or RadioButton7.Checked;
  ComboBox2.Enabled := RadioButton6.Checked or RadioButton7.Checked;
  Edit8.Enabled := RadioButton6.Checked or RadioButton7.Checked;
  Edit9.Enabled := RadioButton6.Checked or RadioButton7.Checked;
  RadioButton8.Enabled := RadioButton7.Checked;
  RadioButton9.Enabled := RadioButton7.Checked;
  Edit14.Enabled := RadioButton7.Checked and RadioButton8.Checked;
  Edit1.SetFocus;
end;

procedure TControlTerminalFrm.RadioButton1Click(Sender: TObject);
begin
  Edit1.Enabled := RadioButton6.Checked;
  Edit2.Enabled := RadioButton6.Checked;
  Edit3.Enabled := RadioButton6.Checked;
  Edit4.Enabled := RadioButton6.Checked;
  Edit5.Enabled := RadioButton6.Checked;
  Edit10.Enabled := RadioButton6.Checked;
  Edit13.Enabled := RadioButton6.Checked;
  Edit8.Enabled := RadioButton6.Checked;
  Edit9.Enabled := RadioButton6.Checked;
  Edit11.Enabled := RadioButton6.Checked;
  Edit12.Enabled := RadioButton6.Checked;
  Edit14.Enabled := RadioButton6.Checked;

  ComboBox1.Enabled := RadioButton6.Checked;
  ComboBox2.Enabled := RadioButton6.Checked;
  RadioButton8.Enabled := RadioButton6.Checked;
  RadioButton9.Enabled := RadioButton6.Checked;
  if RadioButton8.Checked then
    Edit14.Enabled := True
  else
    Edit14.Enabled := False;  
end;

procedure TControlTerminalFrm.Edit99KeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in [#8, '0'..'9', #22, '.']) then Key := #0;

end;

procedure TControlTerminalFrm.InitialCombobox;
var
  servers: TStringList;
  i: Integer;
  s: string;
begin
  servers := TStringList.Create;
  IniFile := TIniFile.Create(ExePath + 'ControlTerminal.ini');
  try
    IniFile.ReadSectionValues('APN', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit1.Items.IndexOf(s) < 0 then
        Edit1.AddItem(s, nil);
    end;
    Edit1.ItemIndex := 0;
    servers.Clear;
    IniFile.ReadSectionValues('USERNAME', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit2.Items.IndexOf(s) < 0 then
        Edit2.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit2.ItemIndex := 0;
    servers.Clear;
    IniFile.ReadSectionValues('PASSWORD', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit3.Items.IndexOf(s) < 0 then
        Edit3.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit3.ItemIndex := 0;
    servers.Clear;
    IniFile.ReadSectionValues('IP', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit4.Items.IndexOf(s) < 0 then
        Edit4.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit4.ItemIndex := 0;
    servers.Clear;
    IniFile.ReadSectionValues('TCPPORT', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit5.Items.IndexOf(s) < 0 then
        Edit5.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit5.ItemIndex := 0;
    servers.Clear;
    IniFile.ReadSectionValues('UDPPORT', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit10.Items.IndexOf(s) < 0 then
        Edit10.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit10.ItemIndex := 0;
    servers.Clear;
    IniFile.ReadSectionValues('FactId', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit13.Items.IndexOf(s) < 0 then
        Edit13.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit13.ItemIndex := 0;
    servers.Clear;

    IniFile.ReadSectionValues('HardVer', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit8.Items.IndexOf(s) < 0 then
        Edit8.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit8.ItemIndex := 0;
    servers.Clear;

    IniFile.ReadSectionValues('SoftVer', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit9.Items.IndexOf(s) < 0 then
        Edit9.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit9.ItemIndex := 0;
    servers.Clear;

    IniFile.ReadSectionValues('URL', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit11.Items.IndexOf(s) < 0 then
        Edit11.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit11.ItemIndex := 0;
    servers.Clear;

    IniFile.ReadSectionValues('TimeLimited', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit12.Items.IndexOf(s) < 0 then
        Edit12.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit12.ItemIndex := 0;
    servers.Clear;

    IniFile.ReadSectionValues('AuthCode', servers);
    for i:=0 to servers.Count-1 do
    begin
      s := copy(servers[i], pos('=', servers[i]) + 1, length(servers[i]));
      if Edit14.Items.IndexOf(s) < 0 then
        Edit14.AddItem(copy(servers[i], pos('=', servers[i]) + 1, length(servers[i])), nil);
    end;
    Edit14.ItemIndex := 0;
    servers.Clear;
  finally
    IniFile.Free;
  end;
end;

procedure TControlTerminalFrm.FormShow(Sender: TObject);
//var
//  FTemp: Tclientdataset;
//  i: Integer;
begin
//  try
//    ComboBox1.Clear;
//    FTemp := TClientDataSet.Create(nil);
//    try
//      FTemp.XMLData := Bs.DevUpdate_QueryAllDevType;
//    except
//      on E: Exception do
//      begin
//        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
//        exit;
//      end;
//    end;
//    FTemp.First;
//    for i:=0 to FTemp.RecordCount-1 do
//    begin
//      ComboBox1.AddItem(FTemp.Fields.FieldByName('TYPENAME').AsString, TObject(FTemp.Fields.FieldByName('DEVTYPE').AsInteger));
//      FTemp.Next;
//    end;
//  finally
//    FTemp.Free;
//  end;
  InitialCombobox;
  RadioButton6.checked := true;
end;

procedure TControlTerminalFrm.ComboBox1Change(Sender: TObject);
var
  FTemp: Tclientdataset;
  i: Integer;
begin
  try
    ComboBox2.Clear;
    FTemp := TClientDataSet.Create(nil);
    Edit6.Text := '';
    Edit6.Text := IntToStr(Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]));
    try
      FTemp.XMLData := Bs.DevUpdate_QueryAllDevFact(Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]));
    except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    FTemp.First;
    for i:=0 to FTemp.RecordCount-1 do
    begin
      ComboBox2.AddItem(FTemp.Fields.FieldByName('FACTNAME').AsString, TObject(FTemp.Fields.FieldByName('DEVFACTID').AsInteger));
      FTemp.Next;
    end;
  finally
    FTemp.Free;
  end;

end;

procedure TControlTerminalFrm.ComboBox2Change(Sender: TObject);
var
  FTemp: Tclientdataset;
  i: Integer;
begin
  try
    Edit8.Text := '';
    Edit9.Text := '';
    Edit7.Text := '';
    Edit7.Text := IntToStr(Integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex]));
    FTemp := TClientDataSet.Create(nil);
    try
      FTemp.XMLData := Bs.Client_GetDevUpdateCurrentVer(Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]),Integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex]));
    except
      on E: Exception do
      begin
        messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
        exit;
      end;
    end;
    FTemp.First;
    for i:=0 to FTemp.RecordCount-1 do
    begin
      Edit8.text := FTemp.Fields.FieldByName('HARDVER').AsString;
      Edit9.Text := FormatFloat('0.00',strtofloat(FTemp.Fields.FieldByName('SOFTVER').AsString));
      Break;
    end;
  finally
    FTemp.Free;
  end;
end;

procedure TControlTerminalFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  servers: TStringList;
  i: Integer;
begin
  IniFile := TIniFile.Create(ExePath + 'ControlTerminal.ini');
  try              
    for i:=0 to Edit1.Items.Count-1 do
    begin
      IniFile.WriteString('APN', 'VALUE'+ IntToStr(i) , Edit1.Items[i]);
    end;
    if (Edit1.Items.IndexOf(Edit1.Text) < 0) and (Length(Trim(Edit1.Text)) > 0) then
      IniFile.WriteString('APN', 'VALUE'+ IntToStr(Edit1.Items.Count) , Edit1.Text);

    for i:=0 to Edit2.Items.Count-1 do
    begin
      IniFile.WriteString('USERNAME', 'VALUE'+ IntToStr(i) , Edit2.Items[i]);
    end;
    if (Edit2.Items.IndexOf(Edit2.Text) < 0) and (Length(Trim(Edit2.Text)) > 0) then
      IniFile.WriteString('USERNAME', 'VALUE'+ IntToStr(Edit2.Items.Count) , Edit2.Text);

    for i:=0 to Edit3.Items.Count-1 do
    begin
      IniFile.WriteString('PASSWORD', 'VALUE'+ IntToStr(i) , Edit3.Items[i]);
    end;
    if (Edit3.Items.IndexOf(Edit3.Text) < 0) and (Length(Trim(Edit3.Text)) > 0) then
      IniFile.WriteString('PASSWORD', 'VALUE'+ IntToStr(Edit3.Items.Count) , Edit3.Text);

    for i:=0 to Edit4.Items.Count-1 do
    begin
      IniFile.WriteString('IP', 'VALUE'+ IntToStr(i) , Edit4.Items[i]);
    end;
    if (Edit4.Items.IndexOf(Edit4.Text) < 0) and (Length(Trim(Edit4.Text)) > 0) then
      IniFile.WriteString('IP', 'VALUE'+ IntToStr(Edit4.Items.Count) , Edit4.Text);

    for i:=0 to Edit5.Items.Count-1 do
    begin
      IniFile.WriteString('TCPPORT', 'VALUE'+ IntToStr(i) , Edit5.Items[i]);
    end;
    if (Edit5.Items.IndexOf(Edit5.Text) < 0) and (Length(Trim(Edit5.Text)) > 0) then
      IniFile.WriteString('TCPPORT', 'VALUE'+ IntToStr(Edit5.Items.Count) , Edit5.Text);

    for i:=0 to Edit10.Items.Count-1 do
    begin
      IniFile.WriteString('UDPPORT', 'VALUE'+ IntToStr(i) , Edit10.Items[i]);
    end;
    if (Edit10.Items.IndexOf(Edit10.Text) < 0) and (Length(Trim(Edit10.Text)) > 0) then
      IniFile.WriteString('UDPPORT', 'VALUE'+ IntToStr(Edit10.Items.Count) , Edit10.Text);

    for i:=0 to Edit13.Items.Count-1 do
    begin
      IniFile.WriteString('FactId', 'VALUE'+ IntToStr(i) , Edit13.Items[i]);
    end;
    if (Edit13.Items.IndexOf(Edit13.Text) < 0) and (Length(Trim(Edit13.Text)) > 0) then
      IniFile.WriteString('FactId', 'VALUE'+ IntToStr(Edit13.Items.Count) , Edit13.Text);

    for i:=0 to Edit8.Items.Count-1 do
    begin
      IniFile.WriteString('HardVer', 'VALUE'+ IntToStr(i) , Edit8.Items[i]);
    end;
    if (Edit8.Items.IndexOf(Edit8.Text) < 0) and (Length(Trim(Edit8.Text)) > 0) then
      IniFile.WriteString('HardVer', 'VALUE'+ IntToStr(Edit8.Items.Count) , Edit8.Text);

    for i:=0 to Edit9.Items.Count-1 do
    begin
      IniFile.WriteString('SoftVer', 'VALUE'+ IntToStr(i) , Edit9.Items[i]);
    end;
    if (Edit9.Items.IndexOf(Edit9.Text) < 0) and (Length(Trim(Edit9.Text)) > 0) then
      IniFile.WriteString('SoftVer', 'VALUE'+ IntToStr(Edit9.Items.Count) , Edit9.Text);

    for i:=0 to Edit11.Items.Count-1 do
    begin
      IniFile.WriteString('URL', 'VALUE'+ IntToStr(i) , Edit11.Items[i]);
    end;
    if (Edit11.Items.IndexOf(Edit11.Text) < 0) and (Length(Trim(Edit11.Text)) > 0) then
      IniFile.WriteString('URL', 'VALUE'+ IntToStr(Edit11.Items.Count) , Edit11.Text);

    for i:=0 to Edit12.Items.Count-1 do
    begin
      IniFile.WriteString('TimeLimited', 'VALUE'+ IntToStr(i) , Edit12.Items[i]);
    end;
    if (Edit12.Items.IndexOf(Edit12.Text) < 0) and (Length(Trim(Edit12.Text)) > 0) then
      IniFile.WriteString('TimeLimited', 'VALUE'+ IntToStr(Edit12.Items.Count) , Edit12.Text);

    for i:=0 to Edit14.Items.Count-1 do
    begin
      IniFile.WriteString('AuthCode', 'VALUE'+ IntToStr(i) , Edit14.Items[i]);
    end;
    if (Edit14.Items.IndexOf(Edit14.Text) < 0) and (Length(Trim(Edit14.Text)) > 0) then
      IniFile.WriteString('AuthCode', 'VALUE'+ IntToStr(Edit14.Items.Count) , Edit14.Text);
  finally
    IniFile.Free;
  end;

end;

function TControlTerminalFrm.checkInput: Boolean;
  function getLabel(labelName: string): TLabel;
  var
    i: Integer;
    component: TComponent;
  begin
    Result := nil;
    for i := 0 to Self.ComponentCount - 1 do
    begin
      component := Self.Components[i];
      if (component.Name = labelName) and (component is TLabel) then
        Result := TLabel(component);
    end;  
  end;  
var
  comp: TComponent;
  edit: TEdit;
  combobox: TComboBox;
  i: Integer;
  lbl: TLabel;
  labelName: string;
begin
  Result := True;
  Exit;
  //此处参数不必填
  Result := False;
  try
    for i := 0 to Self.ComponentCount - 1 do
    begin
      comp := Self.Components[i];
      if comp is TEdit then
      begin
        edit := TEdit(comp);
        if not edit.Visible then Continue;
        if (edit.Text) = '' then
        begin
          lbl := getLabel('Label' + Copy(edit.Name, 5, Length(edit.Name) - 4));
          if lbl <> nil then
          begin
            MessageBox(Handle, PChar('请输入' + lbl.Caption), '提示', MB_OK + MB_ICONINFORMATION);
            
          end;  
          edit.SetFocus;
          Exit;
        end;
      end
      else if comp is TComboBox then
      begin
        combobox := TComboBox(comp);
        if not combobox.Visible then Continue;
        if (combobox.Text) = '' then
        begin
          lbl := getLabel('Label' + Copy(combobox.Name, 5, Length(combobox.Name) - 4));
          if lbl <> nil then
          begin
            MessageBox(Handle, PChar(lbl.Caption), '提示', MB_OK + MB_ICONINFORMATION);
            
          end;  
          combobox.SetFocus;
          Exit;
        end;
      end;
    end;
    Result := True;
  except

  end;
end;

procedure TControlTerminalFrm.Edit5Exit(Sender: TObject);
begin
  if Trim(Edit5.Text) <> '' then
  begin
    if (StringToInteger(Trim(Edit5.Text)) > 65535) or (StringToInteger(Trim(Edit5.Text)) < 1) then
    begin
      MessageBox(Handle, '端口号需介于1~65535之间，请重新输入', '提示', MB_OK + MB_ICONINFORMATION);
      Edit5.SetFocus;
      Exit;
    end;
  end;
end;

procedure TControlTerminalFrm.Edit12Exit(Sender: TObject);
begin
  if Trim(Edit12.Text) <> '' then
  begin
    if (StringToInteger(Trim(Edit12.Text)) > 65535) or (StringToInteger(Trim(Edit12.Text)) < 1) then
    begin
      MessageBox(Handle, '连接到升级服务器时限需介于0~65535之间，请重新输入', '提示', MB_OK + MB_ICONINFORMATION);
      Edit12.SetFocus;
      Exit;
    end;
  end;
end;

procedure TControlTerminalFrm.Edit13Exit(Sender: TObject);
begin
  if Trim(Edit13.Text) <> '' then
  begin
    if (Length(Trim(Edit13.Text)) > 10) then
    begin
      MessageBox(Handle, '制造商ID长度不能大于10，请重新输入', '提示', MB_OK + MB_ICONINFORMATION);
      Edit13.SetFocus;
      Exit;
    end;
  end;
end;

{ 无线升级参数
  URL地址；拨号点名称；拨号用户名；拨号密码；地址；TCP端口;UDP端口;制造商ID;硬件版本；固件版本；连接到指定服务器时限
}
function TControlTerminalFrm.GetWirelessUpgradeParam: string;
begin
  Result := Trim(Edit11.Text) + ';' + Trim(Edit1.Text) + ';' + Trim(Edit2.Text) + ';' + Trim(Edit3.Text) + ';'
          + Trim(Edit4.Text) + ';' + Trim(Edit5.Text) + ';' + Trim(Edit10.Text) + ';' + Trim(Edit13.Text) + ';'
          + Trim(Edit8.Text) + ';' + Trim(Edit9.Text) + ';' + Trim(Edit12.Text);
end;

{
连接控制；监管平台鉴权码；拨号点名称；拨号用户名；拨号密码；地址；TCP端口;UDP端口；连接到指定服务器时限
}
function TControlTerminalFrm.GetConnServerParam(dev: TDevice): string;
begin
  if RadioButton8.Checked then
  begin
    Result := '0;' + Trim(Edit14.Text) + ';' + Trim(Edit1.Text) + ';' + Trim(Edit2.Text) + ';' + Trim(Edit3.Text) + ';'
            + Trim(Edit4.Text) + ';' + Trim(Edit5.Text) + ';' + Trim(Edit10.Text) + ';' + Trim(Edit12.Text);
  end
  else
  begin
    Result := '1;';
  end;    
end;

procedure TControlTerminalFrm.RadioButton8Click(Sender: TObject);
begin
  if RadioButton8.Checked then
    Edit14.Enabled := True
  else
    Edit14.Enabled := False;
end;

end.
