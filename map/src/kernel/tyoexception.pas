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

  {此异常为不能载入用户指定的资源时抛出}
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
  Message:='该函数或方法还没有实现:('
end;

constructor ENotComplete.Create(FuncName: string);
begin
  Message:='函数 '+FuncName+' 或方法还没有实现:('
end;

{ ELoadCustomResErr }

constructor ELoadCustomResErr.Create;
begin
  Message:='不能载入指定的资源:(';
end;

{ EIndexError }

constructor EIndexError.Create;
begin
  Message:='索引超出范围:(';
end;

{ EFindLayerError }

constructor EFindLayerError.Create;
begin
  Message:='不能找到所需的图层:(';
end;

{ EInvalidObject }

constructor EInvalidObject.Create;
begin
  Message:='无效的对象:(';
end;

{ EProjectionFailed }
constructor EProjectionFailed.Create;
begin
  Message:='投影未初始化!!!';
end;

constructor EProjectionFailed.Create(AMessage:string);
begin
  Message:=AMessage;
end;

{ ENotFoundResource }

constructor ENotFoundResource.Create;
begin
  Message:='没有找到指定的资源';
end;

end.
