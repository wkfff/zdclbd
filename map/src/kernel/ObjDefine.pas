unit ObjDefine;

interface
uses
  Classes,
  RunData,
  EventDefine,
  Para;
type

  //TBasicObj��������ʵ��,Ϊ���������ṩ������GIS�����ʵ�֣���Ҫʵ����ͨ���¼��Ľӿ�
  TBasicObj = class(TObject)
  private
    FID: Longword;
    FOnClose: TNotifyEvent;
    FOnMsgEvent: TMessageEvent;
    procedure SetOnMsgEvent(const Value: TMessageEvent);
  protected
    procedure DoClose;virtual;
    procedure DoMsgEvent(Sender:TObject; MsgID: Integer; Param: TGisParams);virtual;
    procedure DoDealMsgEvent(Sender: TObject; MsgID: Integer; Param: TGisParams);virtual;abstract;
  public
    constructor Create;virtual;
    destructor Destroy;override;
    procedure Close;virtual;
    property ID:Longword read FID;
    property OnClose:TNotifyEvent read FOnClose Write FOnClose;
    property OnMsgEvent:TMessageEvent read FOnMsgEvent Write SetOnMsgEvent;
  end;
implementation

{ TBasicObj }

procedure TBasicObj.Close;
begin
  DoClose;
  if Assigned(FOnClose) then
    FOnClose(Self);
end;

constructor TBasicObj.Create;
begin
  inherited Create;
  FID := RuntimeData.GetID;
end;

destructor TBasicObj.Destroy;
begin
  inherited Destroy;
end;

procedure TBasicObj.DoClose;
begin
end;

procedure TBasicObj.DoMsgEvent(Sender: TObject; MsgID: Integer;
  Param: TGisParams);
begin
  if Assigned(FOnMsgEvent) then
    FOnMsgEvent(Sender,MsgID,Param);
end;

procedure TBasicObj.SetOnMsgEvent(const Value: TMessageEvent);
begin
  FOnMsgEvent := Value;
end;

end.
