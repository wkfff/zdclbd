unit tyoexception;

interface

uses classes,sysutils,DB;
type

  EFileLoadErr=class(Exception);

  EIndexError=class(Exception)
  public
    constructor Create;virtual;
  end;

  EFindLayerError=class(Exception)
  public
    constructor Create;virtual;
  end;

  ENotComplete=class(Exception)
  public
    constructor Create;overload;
    constructor Create(FuncName:string);overload;
  end;

  {���쳣Ϊ���������û�ָ������Դʱ�׳�}
  ELoadCustomResErr=class(Exception)
  public
    constructor Create;
  end;

  EInvalidObject=class(Exception)
  public
    constructor Create;overload;
  end;

  EProjectionFailed=class(Exception)
  public
    constructor Create;overload;
    constructor Create(AMessage:string);overload;
  end;

  ENotFoundResource=class(Exception)
  public
    constructor Create();
  end;

implementation

{ ENotComplete }

constructor ENotComplete.Create;
begin
  Message:='�ú����򷽷���û��ʵ��:('
end;

constructor ENotComplete.Create(FuncName: string);
begin
  Message:='���� '+FuncName+' �򷽷���û��ʵ��:('
end;

{ ELoadCustomResErr }

constructor ELoadCustomResErr.Create;
begin
  Message:='��������ָ������Դ:(';
end;

{ EIndexError }

constructor EIndexError.Create;
begin
  Message:='����������Χ:(';
end;

{ EFindLayerError }

constructor EFindLayerError.Create;
begin
  Message:='�����ҵ������ͼ��:(';
end;

{ EInvalidObject }

constructor EInvalidObject.Create;
begin
  Message:='��Ч�Ķ���:(';
end;

{ EProjectionFailed }
constructor EProjectionFailed.Create;
begin
  Message:='ͶӰδ��ʼ��!!!';
end;

constructor EProjectionFailed.Create(AMessage:string);
begin
  Message:=AMessage;
end;

{ ENotFoundResource }

constructor ENotFoundResource.Create;
begin
  Message:='û���ҵ�ָ������Դ';
end;

end.
