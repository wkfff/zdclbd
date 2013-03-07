unit cmdunit;

interface
uses
  types;
type
{*********************************************************************}

 {����������Ϣ}
  PDevGroup = ^TDevGroup;
  TDevGroup = packed record
    id: integer;
    Name: string;
    parent: integer;
    leaf_nod: boolean;
  end;
 {����}
  PCar = ^TCar;
  TCar = packed record
    id: integer;
    Name: string;
  end;
 {����}
//  PDev = ^TDev;
//  TDev = packed record
//    groupId: integer;
//    DevID: string;
//    DevIDInteger: integer;
//    CarID: integer;
//    CarNo: string;
//  end;

 {Ȩ��}
  PPri = ^TPri;
  TPri = packed record
    pri: integer;
    Visible: boolean;
    Enabled: boolean;
  end;
  POrder = ^TOrder;
  TOrder = packed record
    orderID: integer;
    orderType: integer;
    orderDate: TDateTime;
    orderContent: string;
    orderPartContent: string;
    orderCustomTel: string;
    orderUserID: integer;
    orderSendDate: TDateTime;
    orderDevID: integer;
    orderResult: string;
    orderMemo: string;
    orderDevIDArray: TIntegerDynArray;
  end;
implementation

end.
