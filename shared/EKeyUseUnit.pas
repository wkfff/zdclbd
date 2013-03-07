unit EKeyUseUnit;

interface
uses windows, SysUtils, Classes,
  registry, forms, Dialogs, controls,
  mwEkeyUnit;

var
  GEkey: TmwEkey;
  GConType: string;

procedure ConnectedEkey_monitor;
function ConnectedEkey_biz: boolean;

  //看是否与EKEY连接。提示3次，如果还是没有或没有正确的EKEY，将退出软件
function ConnectedEkey: boolean;
  //用户已输入过Ekey号?
  // 如果已输入(取注册表值)，等于EKey中值则true。
  // 如果没输入过或不等，则输入
function InputedEkeyNum: boolean;


implementation
uses EkeyNumInputFrmUnit;

procedure ConnectedEkey_monitor;
begin
  GConType := 'monitor';
  ConnectedEkey;
end;

function ConnectedEkey_biz: boolean;
var
  i: integer;
begin
  Result := false;
  GConType := 'biz';

  if not GEkey.InitEKey then
    raise Exception.Create('业务服务程序--没有检测到' + EKey_NAME + '!' + #13 + #13
      + '请您在业务服务器上插入随软件发行的' + EKey_NAME + '!');
  if not InputedEkeyNum then exit; //从注册表取值，看是否＝eKey中的EF0006中解密后的值
  if GEkey.IcDev > 0 then Result := true;
end;

function ConnectedEkey: boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to 3 do
  begin
    //连接
    if not GEkey.InitEKey then
    begin
      if i = 3 then
      begin
        messagebox(0, pchar('由于您没有插入或没插入正确的' + EKey_NAME + '，您将不能使用智能监控客户端!'), '提示', mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      messagebox(0, pchar('没有检测到' + EKey_NAME + '!' + #13 + #13
        + '请您插入随软件发行的' + EKey_NAME + '!'),
        pchar('第' + IntToStr(i + 1) + '次提示'), mb_ok + mb_iconinformation);
      continue;
    end;
    if not InputedEkeyNum then continue; //从注册表取值，看是否＝eKey中的EF0006中解密后的值

    if GEkey.IcDev > 0 then
    begin
      Result := true;
      break;
    end;
  end;
end;


function InputedEkeyNum: boolean;
var
  dlg: TFrmInputEkeyNum;
  reg: TRegistry;
  zcxx, eNumstr: string;
  zcbj: boolean;
begin
  result := false;
  zcbj := false;
  try
    //取注册表中值
    reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    if reg.KeyExists('\software\njty\' + GConType) then
    begin
      reg.OpenKey('\software\njty\' + GConType, true);
      zcxx := reg.ReadString('ekeynum');
      eNumstr := GEkey.ReadData;
      if zcxx = eNumstr then
      begin
        zcbj := true;
        result := true;
        exit;
      end;
    end;
    if not zcbj then
    begin
      //如果还没注册，则弹出注册窗体
      dlg := TFrmInputEkeyNum.Create(nil);
      try
        dlg.ShowModal;
        if dlg.ModalResult = mrOk then
        begin
          //写入注册表
          if reg.CreateKey('\software\njty\' + GConType) then
          begin
            reg.OpenKey('\software\njty\' + GConType, true);
            reg.WriteString('ekeynum', trim(dlg.EditEKeyNum.Text));
          end;
          result := true;
        end;
      finally
        dlg.Free;
      end;
    end;
  finally
    reg.CloseKey;
    reg.Free;
  end;
end;

initialization
  GEkey := TmwEkey.Create;
finalization
  FreeAndNil(GEkey);
end.
