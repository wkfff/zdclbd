unit ShowMessageInfo;

interface
uses Controls, ErrorInfoUnit;

  // ���쳣��Ϣ��ʾ��
  procedure messageErrorBox(info: string; error: string);

implementation

procedure messageErrorBox(info: string; error: string);
var
  dlg: TErrorInfoFrm;
begin
  try
    dlg := TErrorInfoFrm.create(nil);
    dlg.lblInfo.Caption := info;
    dlg.memInfo.Text := error;
    if dlg.ShowModal = mrok then
    begin
    end;
  finally
    dlg.Free;
  end;
end;

end.
