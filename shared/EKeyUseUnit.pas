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

  //���Ƿ���EKEY���ӡ���ʾ3�Σ��������û�л�û����ȷ��EKEY�����˳����
function ConnectedEkey: boolean;
  //�û��������Ekey��?
  // ���������(ȡע���ֵ)������EKey��ֵ��true��
  // ���û������򲻵ȣ�������
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
    raise Exception.Create('ҵ��������--û�м�⵽' + EKey_NAME + '!' + #13 + #13
      + '������ҵ��������ϲ�����������е�' + EKey_NAME + '!');
  if not InputedEkeyNum then exit; //��ע���ȡֵ�����Ƿ�eKey�е�EF0006�н��ܺ��ֵ
  if GEkey.IcDev > 0 then Result := true;
end;

function ConnectedEkey: boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to 3 do
  begin
    //����
    if not GEkey.InitEKey then
    begin
      if i = 3 then
      begin
        messagebox(0, pchar('������û�в����û������ȷ��' + EKey_NAME + '����������ʹ�����ܼ�ؿͻ���!'), '��ʾ', mb_ok + mb_iconinformation);
        Application.Terminate;
        exit;
      end;
      messagebox(0, pchar('û�м�⵽' + EKey_NAME + '!' + #13 + #13
        + '����������������е�' + EKey_NAME + '!'),
        pchar('��' + IntToStr(i + 1) + '����ʾ'), mb_ok + mb_iconinformation);
      continue;
    end;
    if not InputedEkeyNum then continue; //��ע���ȡֵ�����Ƿ�eKey�е�EF0006�н��ܺ��ֵ

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
    //ȡע�����ֵ
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
      //�����ûע�ᣬ�򵯳�ע�ᴰ��
      dlg := TFrmInputEkeyNum.Create(nil);
      try
        dlg.ShowModal;
        if dlg.ModalResult = mrOk then
        begin
          //д��ע���
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
