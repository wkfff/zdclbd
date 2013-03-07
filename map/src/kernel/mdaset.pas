{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressMemData - CLX/VCL Edition                            }
{                                                                   }
{       Copyright (c) 1998-2001 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, DPU, SO, ETC.) ARE CONFIDENTIAL AND PROPRIETARY }
{   TRADE SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER}
{   IS LICENSED TO DISTRIBUTE THE EXPRESSMEMDATA                    }
{   AS PART OF AN EXECUTABLE PROGRAM ONLY.                          }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}


unit mdaset;
interface

{$I dxmdver.inc}

uses
  DB, Classes, SysUtils, Variants,types;

{$IFNDEF LINUX}
  {$IFDEF DELPHI5}
   {$DEFINE WIDESTRING}
  {$ENDIF}
{$ENDIF}

{$IFNDEF LINUX}
  {$IFNDEF DELPHI5}
   {$DEFINE BCD}
  {$ENDIF}
{$ENDIF}

type

TdxMemDataE = class;
TdxMemFieldEs = class;

TMemBlobData = string;
TMemBlobDataArray = array[0..0] of TMemBlobData;
PMemBlobDataArray = ^TMemBlobDataArray;


TdxMemFieldE = class
private
  FField : TField;
  FDataType : TFieldType;
  FDataSize : Integer;
  FOffSet : Integer;
  FValueOffSet : Integer;
  FMaxIncValue : Integer;
  FOwner : TdxMemFieldEs;
  FIndex : Integer;
  FIsRecId : Boolean;
  FIsNeedAutoInc : Boolean;
  {$IFDEF WIDESTRING}
  FIsWideString : Boolean;
  {$ENDIF}

  function GetValues(Index : Integer) : PChar;
  function GetHasValues(Index : Integer) : Char;
  procedure SetHasValues(Index : Integer; Value : Char);

  procedure SetAutoIncValue(Value : PChar; const Buffer : PChar);

  function GetDataSet : TdxMemDataE;
  function GetMemFields : TdxMemFieldEs;
protected
  procedure CreateField(Field : TField); virtual;

  property MemFields : TDxMemFieldEs read GetMemFields;
public
  constructor Create(AOwner : TdxMemFieldEs);

  procedure AddValue(const Buffer : PChar);
  procedure InsertValue(AIndex : Integer; const Buffer : PChar);

  //For the guys from AQA.
  property OffSet: Integer read FOffSet;  

  property DataSet : TdxMemDataE read GetDataSet;
  property Field : TField read FField;
  property Index : Integer read FIndex;
  property Values[Index : Integer] : PChar read GetValues;
  property HasValues[Index : Integer] : Char read GetHasValues write SetHasValues;
end;

TdxMemFieldEs = class
private
  FItems : TList;
  FCalcFields : TList;
  FDataSet : TdxMemDataE;
  FValues : TList;
  FIsNeedAutoIncList : TList;
  {$IFDEF WIDESTRING}
  FWideStringFields : TList;
  {$ENDIF}
  FValuesSize : Integer;

  function GetRecordCount : Integer;
  function GetItem(Index : Integer)  : TdxMemFieldE;
protected
  function Add(AField : TField) : TdxMemFieldE;
  procedure Clear;
  {$IFDEF WIDESTRING}
  procedure WideStringDeleteRecord(AIndex : Integer);
  {$ENDIF}
  procedure DeleteRecord(AIndex : Integer);

  procedure InsertRecord(Buffer: Pointer; AIndex : Integer; Append: Boolean);

  procedure AddField(Field : TField);
  procedure RemoveField(Field : TField);
public
  constructor Create(ADataSet : TdxMemDataE);
  destructor Destroy; override;

  procedure GetBuffer(Buffer : Pointer; AIndex : Integer);
  procedure SetBuffer(Buffer : Pointer; AIndex : Integer);
  function GetActiveBuffer(ActiveBuffer, Buffer : Pointer; Field : TField) : Boolean;
  procedure SetActiveBuffer(ActiveBuffer, Buffer : Pointer; Field : TField);
  function GetCount : Integer;
  function IndexOf(Field : TField) : TdxMemFieldE;

  function GetValue(mField : TdxMemFieldE; Index : Integer) : PChar;
  function GetHasValue(mField : TdxMemFieldE; Index : Integer) : char;
  procedure SetValue(mField : TdxMemFieldE; Index : Integer; Buffer : PChar);
  procedure SetHasValue(mField : TdxMemFieldE; Index : Integer; Value : char);


  //For the guys from AQA.
  property Values: TList read FValues;

  property DataSet : TdxMemDataE read FDataSet;
  property Count : Integer read GetCount;
  property Items[Index : Integer] : TdxMemFieldE read GetItem;
  property RecordCount : Integer read GetRecordCount;
end;

PdxRecInfo = ^TdxRecInfo;
TdxRecInfo = packed record
  Bookmark: Integer;
  BookmarkFlag: TBookmarkFlag;
end;

{ TBlobStream }

TMemBlobStream = class(TStream)
private
  FField: TBlobField;
  FDataSet: TdxMemDataE;
  FBuffer: PChar;
  FMode: TBlobStreamMode;
  FOpened: Boolean;
  FModified: Boolean;
  FPosition: Longint;
  FCached: Boolean;
  function GetBlobSize: Longint;
public
  constructor Create(Field: TBlobField; Mode: TBlobStreamMode);
  destructor Destroy; override;
  function Read(var Buffer; Count: Longint): Longint; override;
  function Write(const Buffer; Count: Longint): Longint; override;
  function Seek(Offset: Longint; Origin: Word): Longint; override;
  procedure Truncate;
end;

{ TdxMemDataE }
TdxSortOption = (soDesc, soCaseInsensitive);
TdxSortOptions = set of TdxSortOption;

TdxMemIndexE = class(TCollectionItem)
private
  fIsDirty: Boolean;
  fField: TField;
  fLoadedFieldName: String;
  fFieldName: String;
  fList: TList;
  fIndexList: TList;

  procedure SetIsDirty(Value: Boolean);
  procedure DeleteRecord(pRecord: Pointer);
  procedure UpdateRecord(pRecord: Pointer);
  procedure SetFieldName(Value: String);
  procedure SetFieldNameAfterMemdataLoaded;
protected
  function GetMemData: TdxMemDataE;
  procedure Prepare;
  function GotoNearest(const Buffer : PChar; var Index : Integer) : Boolean;

  property IsDirty: Boolean read fIsDirty write SetIsDirty;
public
  constructor Create(Collection: TCollection); override;
  destructor Destroy; override;

  property MemData: TdxMemDataE read GetMemData;
published
  property FieldName: String read fFieldName write SetFieldName;
end;

TdxMemIndexEes = class(TCollection)
private
  fMemData: TdxMemDataE;
protected
  function GetOwner: TPersistent; override;
  procedure SetIsDirty;
  procedure DeleteRecord(pRecord: Pointer);
  procedure UpdateRecord(pRecord: Pointer);
  procedure RemoveField(AField: TField);
  procedure CheckFields;
  procedure AfterMemdataLoaded;
public
  function Add: TdxMemIndexE;
  function GetIndexByField(AField: TField): TdxMemIndexE;

  property MemData: TdxMemDataE read fMemData;
end;


TdxMemPersistentEOption = (poNone, poActive, poLoad);

TdxMemPersistentE = class(TPersistent)
private
  FStream: TMemoryStream;
  FOption: TdxMemPersistentEOption;
  FMemData: TdxMemDataE;
  FIsLoadFromPersistent: Boolean;

  procedure ReadData(Stream: TStream);
  procedure WriteData(Stream: TStream);
protected
  procedure DefineProperties(Filer: TFiler); override;
public
  constructor Create(AMemData: TdxMemDataE);
  destructor Destroy; override;
  procedure Assign(Source: TPersistent); override;
  procedure SaveData;
  procedure LoadData;

  function HasData: Boolean;

  property MemData: TdxMemDataE read FMemData;
published
  property Option: TdxMemPersistentEOption read FOption write FOption default poActive;
end;

TdxMemDataE = class(TDataSet)
private
  FActive : Boolean;
  FData : TdxMemFieldEs;
  FRecBufSize: Integer;
  FRecInfoOfs: Integer;
  FCurRec: Integer;
  FFilterCurRec : Integer;
  FBookMarks : TList;
  FBlobList : TList;
  FFilterList : TList;
  FLastBookmark: Integer;
  FSaveChanges: Boolean;
  FReadOnly : Boolean;
  FRecIdField : TField;
  FSortOptions : TdxSortOptions;
  FSortedFieldName : String;
  FSortedField : TField;
  FLoadFlag : Boolean;
  FDelimiterChar : Char;
  FIsFiltered : Boolean;
  FGotoNearestMin : Integer;
  FGotoNearestMax : Integer;
  FProgrammedFilter    : Boolean;
  fIndexes: TdxMemIndexEes;
  fPersistent: TdxMemPersistentE;

  function GetSortOptions : TdxSortOptions;
  procedure SetSortedField(Value : String);
  procedure SetSortOptions(Value : TdxSortOptions);
  procedure SetIndexes(Value : TdxMemIndexEes);
  procedure SetPersistent(Value: TdxMemPersistentE);
  function GetActiveRecBuf(var RecBuf: PChar): Boolean;
  procedure DoSort(List : TList; AOffSet : Integer; Size : Integer;
        DataType : TFieldType; FlagDesc : Boolean; ExhangeList: TList);
  procedure MakeSort;
  procedure GetLookupFields(List: TList);
  procedure CreateRecIDField;

  function CheckFields(FieldsName: string): Boolean;
  function InternalLocate(const KeyFields: string; const KeyValues: Variant;
                Options: TLocateOptions): Integer;
  function InternalSeek(const KeyFields : string; const KeyValues: Variant;
                Options: TLocateOptions):TIntegerDynArray;  //改写自InternalLocate，用于查询多条满足条件的记录.sha 20050802
protected
  function GetBlobData(Field: TField; Buffer: PChar): TMemBlobData;
  procedure SetBlobData(Field: TField; Buffer: PChar; const Value: TMemBlobData);
  function GetActiveBlobData(Field: TField): TMemBlobData;
  procedure GetMemBlobData(Buffer : PChar);
  procedure SetMemBlobData(Buffer : PChar);
  procedure BlobClear;

  procedure Loaded; override;
  function AllocRecordBuffer: PChar; override;
  procedure FreeRecordBuffer(var Buffer: PChar); override;
  procedure GetBookmarkData(Buffer: PChar; Data: Pointer); override;
  function GetBookmarkFlag(Buffer: PChar): TBookmarkFlag; override;
  function GetRecord(Buffer: PChar; GetMode: TGetMode; DoCheck: Boolean): TGetResult; override;
  function GetRecordSize: Word; override;
  procedure InternalAddRecord(Buffer: Pointer; Append: Boolean); override;
  {$IFDEF DELPHI4}
  procedure InternalInsert; override;
  {$ENDIF}
  procedure InternalClose; override;
  procedure InternalDelete; override;
  procedure InternalFirst; override;
  procedure InternalGotoBookmark(Bookmark: Pointer); override;
  procedure InternalHandleException; override;
  procedure InternalInitFieldDefs; override;
  procedure InternalInitRecord(Buffer: PChar); override;
  procedure InternalLast; override;
  procedure InternalOpen; override;
  procedure InternalPost; override;
  procedure InternalRefresh; override;
  procedure InternalSetToRecord(Buffer: PChar); override;
  function IsCursorOpen: Boolean; override;
  procedure SetBookmarkFlag(Buffer: PChar; Value: TBookmarkFlag); override;
  procedure SetBookmarkData(Buffer: PChar; Data: Pointer); override;
  procedure SetFieldData(Field: TField; Buffer: Pointer); override;
  {$IFDEF DELPHI5}
  procedure SetFieldData(Field: TField; Buffer: Pointer; NativeFormat: Boolean); override;
  {$ENDIF}

  {$IFDEF BCD}
//$$??  function BCDToCurr(BCD: Pointer; var Curr: Currency): Boolean; override;
//$$??  function CurrToBCD(const Curr: Currency; BCD: Pointer; Precision, Decimals: Integer): Boolean; override;
  {$ENDIF}

  procedure DoAfterCancel; override;
  procedure DoAfterClose; override;
  procedure DoAfterInsert; override;
  procedure DoAfterOpen; override;
  procedure DoAfterPost; override;
  procedure DoBeforeClose; override;
  procedure DoBeforeInsert; override;
  procedure DoBeforeOpen; override;
  procedure DoBeforePost; override;
  procedure DoOnNewRecord; override;
protected
  function GetRecordCount: Integer; override;
  function GetRecNo: Integer; override;
  procedure SetRecNo(Value: Integer); override;
  function GetCanModify: Boolean; override;
  procedure ClearCalcFields(Buffer: PChar); override;

  function GetStringValue(const Buffer : PChar) : String;
  {$IFDEF WIDESTRING}
  function GetWideStringValue(const Buffer : PChar) : WideString;
  {$ENDIF}
  function GetIntegerValue(const Buffer : PChar; DataType : TFieldType) : Integer;
  {$IFDEF DELPHI5}
  function GetLargeIntValue(const Buffer : PChar; DataType : TFieldType) : Int64;
  {$ENDIF}
  function GetFloatValue(const Buffer : PChar) : Double;
  function GetDateTimeValue(const Buffer : PChar; DataType : TFieldType) : TDateTime;
  function GetBooleanValue(const Buffer : PChar) : Boolean;
  function GetVariantValue(const Buffer : PChar; DataType : TFieldType) : Variant;
  function InternalCompareValues(const Buffer1, Buffer2 : PChar; DataType : TFieldType; IsCaseInSensitive: Boolean) : Integer;
  function CompareValues(const Buffer1, Buffer2 : PChar; DataType : TFieldType) : Integer;
  function InternalGotoNearest(List : TList; AOffSet : Integer; DataType : TFieldType;
        const Buffer : PChar; IsDesc : Boolean; var Index : Integer) : Boolean;
  function GotoNearest(const Buffer : PChar; IsDesc : Boolean; var Index : Integer) : Boolean;

  procedure SetOnFilterRecord(const Value: TFilterRecordEvent); override;
  procedure InternalAddFilterRecord;
  procedure MakeRecordSort;
  procedure UpdateFilterRecord; virtual;

  procedure CloseBlob(Field: TField); override;
public
  constructor Create(AOwner : TComponent); override;
  destructor Destroy; override;
  procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  function GetFieldData(Field: TField; Buffer: Pointer): Boolean; override;
  {$IFDEF DELPHI5}
  function GetFieldData(Field: TField; Buffer: Pointer; NativeFormat: Boolean): Boolean; override;
  {$ENDIF}
  function BookmarkValid(Bookmark: TBookmark): Boolean; override;
  function GetCurrentRecord(Buffer: PChar): Boolean; override;
  function CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer; override;
  function Locate(const KeyFields: string; const KeyValues: Variant;
           Options: TLocateOptions): Boolean; override;
  function Seek(const KeyFields: String; const KeyValues: Variant;
           Options: TLocateOptions;var ResultAry:TIntegerDynArray):Boolean;//sha 当有多条满足条件的记录时，改写Locate函数
  function Lookup(const KeyFields: string; const KeyValues: Variant;
    const ResultFields: string): Variant; override;
  function GetRecNoByFieldValue(Value : Variant; FieldName : String) : Integer; virtual;

  function GetFieldClass(FieldType: TFieldType): TFieldClass; override;

  function SupportedFieldType(AType: TFieldType): Boolean; virtual;

  function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; override;

  procedure FillBookMarks;
  procedure MoveCurRecordTo(Index : Integer);
  procedure LoadFromTextFile(FileName : String); dynamic;
  procedure SaveToTextFile(FileName : String); dynamic;
  procedure LoadFromBinaryFile(FileName : String);
  procedure SaveToBinaryFile(FileName : String);
  procedure LoadFromStream(Stream : TStream);
  procedure SaveToStream(Stream : TStream);
  procedure CreateFieldsFromStream(Stream : TStream);
  procedure CreateFieldsFromDataSet(DataSet : TDataSet);
  procedure LoadFromDataSet(DataSet : TDataSet);

  procedure UpdateFilters; virtual;
  {if failed return -1, in other case the record count with the same value}
  function GetValueCount(FieldName : String; Value : Variant) : Integer;

  procedure SetFilteredRecNo(Value: Integer);


  //Again for the guys from AQA. Hi Atanas :-)
  property CurRec: Integer read FCurRec write FCurRec;

  property BlobFieldCount;
  property BlobList: TList read FBlobList;
  //FilterList made public - so we can set the list of filtered records
  //when ProgrammedFilter is True, the developer is responsible to set the list
  property FilterList: TList read FFilterList;
  //ProgrammedFilter - for faster setting of the filers. This avoids calling OnFilterRecord
  property ProgrammedFilter: Boolean read FProgrammedFilter write FProgrammedFilter;

  property RecIdField : TField read FRecIdField;
  property IsLoading : Boolean read FLoadFlag write FLoadFlag;
  property Data : TdxMemFieldEs read FData;
  property DelimiterChar : Char read FDelimiterChar write FDelimiterChar;
  property Filter;
published
  property Active;
  property Indexes: TdxMemIndexEes read fIndexes write SetIndexes;
  property Persistent: TdxMemPersistentE read fPersistent write SetPersistent;
  property ReadOnly : Boolean read FReadOnly write FReadOnly default False;
  property SortOptions : TdxSortOptions read GetSortOptions write SetSortOptions;
  property SortedField : String read FSortedFieldName write SetSortedField;

  property BeforeOpen;
  property AfterOpen;
  property BeforeClose;
  property AfterClose;
  property BeforeInsert;
  property AfterInsert;
  property BeforeEdit;
  property AfterEdit;
  property BeforePost;
  property AfterPost;
  property BeforeCancel;
  property AfterCancel;
  property BeforeDelete;
  property AfterDelete;
  property BeforeScroll;
  property AfterScroll;
  property OnCalcFields;
  property OnDeleteError;
  property OnEditError;
  property OnNewRecord;
  property OnPostError;

  property OnFilterRecord;
end;

procedure DateTimeToMemDataValue(Value : TDateTime; pt : Pointer; Field : TField);
function VariantToMemDataValue(Value : Variant; pt : Pointer; Field : TField) : Boolean;

const
  MemDataVer = 1.7;

implementation

uses {$IFNDEF LINUX}Windows, Forms,{$ELSE} qForms,{$ENDIF}
        DbConsts, DBCommon {$IFDEF WIDESTRING}, ActiveX {$ENDIF};

const
  IncorrectedData = 'The data is incorrect';

{$IFDEF WIDESTRING}
procedure MemDataCopyWideString(buf: Pointer; const St: WideString);
var
  ws: PWideChar;
begin
  if ((PChar(buf))  = #1) then
    SysFreeString(PWideChar(buf^));
  ws := SysAllocString(nil);
  Move(ws, buf^, SizeOf(WideString));
  PWideString(buf)^ := St;
end;
{$ENDIF}

procedure DateTimeToMemDataValue(Value : TDateTime; pt : Pointer; Field : TField);
var
  TimeStamp: TTimeStamp;
  Data: TDateTimeRec;
  DataSize : Integer;
begin
  TimeStamp := DateTimeToTimeStamp(Value);
  DataSize := 4;
  case Field.DataType of
    ftDate: Data.Date := TimeStamp.Date;
    ftTime: Data.Time := TimeStamp.Time;
  else
    begin
      Data.DateTime := TimeStampToMSecs(TimeStamp);
      DataSize := 8;
    end;
  end;
  Move(Data, pt^, DataSize);
end;

function VariantToMemDataValue(Value : Variant; pt : Pointer; Field : TField) : Boolean;
var
  int : Integer; //TIntegerField
  sml : SmallInt; //TSmallIntField
  wrd : Word; //TWordField
  dbl : Double; //TFloatField
  wrdbool : WordBool; //TBooleanField
  bcd : System.Currency; //TBCDField
  {$IFDEF DELPHI5}
  Int64_ : Int64;
  {$ENDIF}
  {$IFDEF WIDESTRING}
  wString : WideString;
  {$ENDIF}
begin
  Result := True;
  case Field.DataType of
    ftString: StrPCopy(pt, Value);
    {$IFDEF WIDESTRING}
      ftWideString:
      begin
        wString := Value;
        if (Length(wString) > Field.Size div 2) then
          SetLength(wString, Field.Size div 2);
        MemDataCopyWideString(pt, wString);
      end;
    {$ENDIF}
    ftDate, ftTime, ftDateTime: DateTimeToMemDataValue(Value, pt, Field);
    ftSmallint:
      begin
        sml := Value;
        Move(sml, pt^, Field.DataSize);
      end;
    ftInteger, ftAutoInc:
      begin
        int := Value;
        Move(int, pt^, Field.DataSize);
      end;
    ftWord:
      begin
        wrd := Value;
        Move(wrd, pt^, Field.DataSize);
      end;
    ftBoolean:
      begin
        wrdbool := Value;
        Move(wrdbool, pt^, Field.DataSize);
      end;
    ftFloat, ftCurrency:
      begin
        dbl := Value;
        Move(dbl, pt^, Field.DataSize);
      end;
    ftBCD:
      begin
        bcd := Value;
        Move(bcd, pt^, Field.DataSize);
      end;
  {$IFDEF DELPHI5}
      ftLargeInt:
      begin
        Int64_ := LongInt(Value); 
        Move(Int64_, pt^, Field.DataSize);
      end;
  {$ENDIF}
      else Result := False;
    end;
end;

{TdxMemFieldE}

constructor TdxMemFieldE.Create(AOwner : TdxMemFieldEs);
begin
  FOwner := AOwner;
  FIndex := FOwner.FItems.Count;
end;

procedure TdxMemFieldE.CreateField(Field : TField);
var
  i : Integer;
  mField : TdxMemFieldE;
begin
  FField := Field;
  FDataType := Field.DataType;
  FDataSize := Field.DataSize;
  FIsRecId := UpperCase(Field.FieldName) = 'RECID';
  FIsNeedAutoInc := FIsRecId or (FDataType = ftAutoInc);
  {$IFDEF WIDESTRING}
  FIsWideString := (FDataType = ftWideString);
  if FIsWideString then
    FOwner.FWideStringFields.Add(self);
  {$ENDIF}
  if FIsNeedAutoInc then
    FOwner.FIsNeedAutoIncList.Add(self);
  if FIndex = 0 then
  begin
    FOffSet := 0;
    fOwner.FValuesSize := 0;
  end else begin
    mField := TdxMemFieldE(FOwner.FItems[FIndex - 1]);
    FOffSet := mField.FOffSet + mField.FDataSize + 1;
  end;
  FValueOffSet := FOffSet + 1;
  Inc(FOwner.FValuesSize, FDataSize + 1);
  FMaxIncValue := 0;
  for i := 0 to DataSet.RecordCount - 1 do
    AddValue(nil);
end;

procedure TdxMemFieldE.SetAutoIncValue(Value : PChar; const Buffer : PChar);
var
  AMaxValue: Integer;
begin
  if (Buffer <> nil) then
    Move(Buffer^, AMaxValue, SizeOf(Integer))
  else AMaxValue := -1;
  if (Buffer <> nil) and  (FMaxIncValue < AMaxValue) then
    FMaxIncValue := AMaxValue
  else
  begin
    Inc(FMaxIncValue);
    Value[0] := Char(1);
    Move(FMaxIncValue, (Value + 1)^, FDataSize);
  end;
end;

procedure TdxMemFieldE.AddValue(const Buffer : PChar);
begin
  if FIndex = 0 then
    InsertValue(FOwner.FValues.Count, Buffer)
  else InsertValue(FOwner.FValues.Count - 1, Buffer);
end;

procedure TdxMemFieldE.InsertValue(AIndex : Integer; const Buffer : PChar);
var
  p : PChar;
begin
  if AIndex = FOwner.FValues.Count then
  begin
    p := StrAlloc(FOwner.FValuesSize);
    FOwner.FValues.Insert(AIndex, p);
  end else p := PChar(FOwner.FValues.Last) + FOffSet;
  if Buffer = nil then
    p[0] := Char(0)
  else begin
    p[0] := Char(1);
    {$IFDEF WIDESTRING}
    if FIsWidestring then
      MemDataCopyWideString(p + 1, PWideString(Buffer)^)
    else Move(Buffer^, (p + 1)^, FDataSize);
    {$ELSE}
    Move(Buffer^, (p + 1)^, FDataSize);
    {$ENDIF}
  end;
  if FIsNeedAutoInc then
    SetAutoIncValue(p, Buffer);
end;

function TdxMemFieldE.GetValues(Index : Integer) : PChar;
begin
  Result := PChar(FOwner.FValues.List^[Index]) + FValueOffSet;
end;

function TdxMemFieldE.GetHasValues(Index : Integer) : Char;
begin
  Result := (PChar(FOwner.FValues.List^[Index]) + FOffSet)[0];
end;

procedure TdxMemFieldE.SetHasValues(Index : Integer; Value : Char);
{$IFDEF WIDESTRING}
var
  buf : PChar;
  ws : PWideChar;
{$ENDIF}
begin
  {$IFDEF WIDESTRING}
  if (FIsWidestring) then
  begin
    buf := PChar(FOwner.FValues.List^[Index]) + FOffSet;
    if (Value = Char(0)) and (buf[0] = Char(1)) then
      SysFreeString(PWideChar(Pointer(buf + 1)^));
    if (Value = Char(1)) and (buf[0] = Char(0)) then
    begin
      ws := SysAllocString(nil);
      Move(ws, PChar(buf + 1)^, SizeOf(WideString));
    end;
  end;
  {$ENDIF}
  (PChar(FOwner.FValues.List^[Index]) + FOffSet)[0] := Value;
end;

function TdxMemFieldE.GetDataSet : TdxMemDataE;
begin
  Result := MemFields.DataSet;
end;

function TdxMemFieldE.GetMemFields : TdxMemFieldEs;
begin
  Result := FOwner;
end;

{TdxMemFieldEs}
constructor TdxMemFieldEs.Create(ADataSet : TdxMemDataE);
begin
  FDataSet := ADataSet;
  FItems := TList.Create;
  FCalcFields := TList.Create;
  FIsNeedAutoIncList := TList.Create;
  {$IFDEF WIDESTRING}
  FWideStringFields := TList.Create;
  {$ENDIF}
end;

destructor TdxMemFieldEs.Destroy;
begin
  Clear;
  FItems.Free;
  FCalcFields.Free;
  FIsNeedAutoIncList.Free;
  {$IFDEF WIDESTRING}
  FWideStringFields.Free;
  {$ENDIF}

  inherited Destroy;
end;

procedure TdxMemFieldEs.Clear;
var
  i : Integer;
begin
  if FValues <> nil then
  begin
    for i := 0 to FValues.Count - 1 do
    begin
      {$IFDEF WIDESTRING}
      WideStringDeleteRecord(i);
      {$ENDIF}
      StrDispose(FValues.List^[i]);
    end;
    FValues.Free;
    FValues := nil;
  end;
  for i := 0 to FItems.Count - 1 do
    TdxMemFieldE(FItems[i]).Free;
  FItems.Clear;
  FCalcFields.Clear;
  FIsNeedAutoIncList.Clear;
  {$IFDEF WIDESTRING}
  FWideStringFields.Clear;
  {$ENDIF}
end;

{$IFDEF WIDESTRING}
procedure TdxMemFieldEs.WideStringDeleteRecord(AIndex : Integer);
var
  i : Integer;
begin
  for i := 0 to FWideStringFields.Count - 1 do
    TdxMemFieldE(FWideStringFields[i]).SetHasValues(AIndex, Char(0));
end;
{$ENDIF}


procedure TdxMemFieldEs.DeleteRecord(AIndex : Integer);
begin
  {$IFDEF WIDESTRING}
  WideStringDeleteRecord(AIndex);
  {$ENDIF}
  StrDispose(FValues[AIndex]);
  FValues.Delete(AIndex);
end;

function TdxMemFieldEs.Add(AField : TField) : TdxMemFieldE;
begin
  Result := TdxMemFieldE.Create(self);
  FItems.Add(Result);
  TdxMemFieldE(Result).CreateField(AField);
end;

function TdxMemFieldEs.GetItem(Index : Integer)  : TdxMemFieldE;
begin
  Result := TdxMemFieldE(FItems[Index]);
end;

function TdxMemFieldEs.IndexOf(Field : TField) : TdxMemFieldE;
var
  i : Integer;
begin
  Result := Nil;
  for i := 0 to FItems.Count - 1 do
    if(TdxMemFieldE(FItems.List^[i]).Field = Field) then
    begin
      Result := TdxMemFieldE(FItems.List^[i]);
      break;
    end;
end;

function TdxMemFieldEs.GetValue(mField : TdxMemFieldE; Index : Integer) : PChar;
begin
  Result := PChar(FValues.List^[Index]) + mField.FValueOffSet;
end;

function TdxMemFieldEs.GetHasValue(mField : TdxMemFieldE; Index : Integer) : char;
begin
  Result := mField.GetHasValues(Index);
end;

procedure TdxMemFieldEs.SetValue(mField : TdxMemFieldE; Index : Integer; Buffer : PChar);
const
  HasValueArr : Array[False..True] of Char = (char(0), char(1));
begin
  SetHasValue(mField, Index, HasValueArr[Buffer <> nil]);
  if (Buffer = nil) then exit;
  {$IFDEF WIDESTRING}
  if not (mField.FIsWideString) then
    Move(Buffer^, (PChar(FValues.List^[Index]) + mField.FValueOffSet)^, mField.FDataSize)
  else
    MemDataCopyWideString(PChar(FValues.List^[Index]) + mField.FValueOffSet, PWideString(Buffer)^);
  {$ELSE}
  Move(Buffer^, (PChar(FValues.List^[Index]) + mField.FValueOffSet)^, mField.FDataSize);
  {$ENDIF}

end;

procedure TdxMemFieldEs.SetHasValue(mField : TdxMemFieldE; Index : Integer; Value : char);
begin
  mField.SetHasValues(Index, Value);
end;

function TdxMemFieldEs.GetCount : Integer;
begin
  Result := FItems.Count;
end;

procedure TdxMemFieldEs.GetBuffer(Buffer : Pointer; AIndex : Integer);
begin
  Move(FValues.List^[AIndex]^, Buffer^, FValuesSize);
end;

procedure TdxMemFieldEs.SetBuffer(Buffer : Pointer; AIndex : Integer);
{$IFDEF WIDESTRING}
var
  i : Integer;
  buf : PChar;
{$ENDIF}
begin
  if AIndex = -1 then exit;
  {$IFDEF WIDESTRING}
  if (FWideStringFields.Count > 0) then
  begin
    for i := 0 to FItems.Count - 1 do
    begin
      buf := PChar(Buffer) + TdxMemFieldE(FItems[i]).FOffSet;
      SetHasValue(TdxMemFieldE(FItems[i]), AIndex, buf[0]);
      if (buf[0] = #1) then
        SetValue(TdxMemFieldE(FItems[i]), AIndex, buf + 1);
    end;
  end
  else
    Move(Buffer^, FValues.List^[AIndex]^, FValuesSize);
  {$ELSE}
  Move(Buffer^, FValues.List^[AIndex]^, FValuesSize);
  {$ENDIF}
end;

function TdxMemFieldEs.GetActiveBuffer(ActiveBuffer, Buffer : Pointer; Field : TField) : Boolean;
var
  mField : TdxMemFieldE;
  p : PChar;
begin
  mField := IndexOf(Field);
  if(mField <> Nil) then
  begin
    p := ActiveBuffer;
    p := p + mField.FOffSet;
    Result := Byte(p[0]) <> 0;
    {$IFDEF WIDESTRING}
    if (Field.DataType = ftWideString)then
    begin
      if Result then
         MemDataCopyWideString(Buffer, PWideString(p+1)^)
       else PWideString(Buffer)^ := '';
    end
    else Move((p + 1)^, Buffer^, mField.FDataSize);
    {$ELSE}
    Move((p + 1)^, Buffer^, mField.FDataSize);
    {$ENDIF}
  end else Result := False;
end;

procedure TdxMemFieldEs.SetActiveBuffer(ActiveBuffer, Buffer : Pointer; Field : TField);
var
  mField : TdxMemFieldE;
  p : PChar;
begin
  if (Field.Calculated or Field.Lookup)
  and (DataSet.State = dsCalcFields) then  exit;

  mField := IndexOf(Field);
  p := PChar(ActiveBuffer) + mField.FOffSet;
  if(Buffer <> nil) then
  begin
    p[0] := Char(1);
    {$IFDEF WIDESTRING}
    if (Field.DataType = ftWideString) then
    begin
      MemDataCopyWideString(p + 1, PWideString(Buffer)^);
    end else Move(Buffer^, (p + 1)^, mField.FDataSize);
    {$ELSE}
    Move(Buffer^, (p + 1)^, mField.FDataSize);
    {$ENDIF}
  end else p[0] := Char(0);
end;

function TdxMemFieldEs.GetRecordCount : Integer;
begin
  if(FValues = nil) then
    Result := 0
  else Result := FValues.Count;
end;

procedure TdxMemFieldEs.InsertRecord(Buffer: Pointer; AIndex : Integer; Append: Boolean);
var
  i: Integer;
  p : PChar;
  mField : TdxMemFieldE;
begin
  if AIndex = -1 then
    AIndex := 0;

  p := StrAlloc(FValuesSize);
  Move(Buffer^, p^, FValuesSize);
  if Append then
    FValues.Add(p)
  else FValues.Insert(AIndex, p);
  for i := 0 to FIsNeedAutoIncList.Count - 1 do
  begin
    mField := TdxMemFieldE(FIsNeedAutoIncList[i]);
    mField.SetAutoIncValue(p + mField.FOffSet, PChar(Buffer) + mField.FValueOffSet);
  end;
end;

procedure TdxMemFieldEs.AddField(Field : TField);
var
  mField : TdxMemFieldE;
begin
  mField := IndexOf(Field);
  if(mField = Nil) then
    Add(Field);
end;

procedure TdxMemFieldEs.RemoveField(Field : TField);
var
  mField : TdxMemFieldE;
begin
  mField := IndexOf(Field);
  if(mField <> Nil) then
    mField.Free;
end;

{TdxMemIndexE}
constructor TdxMemIndexE.Create(Collection: TCollection);
begin
  inherited Create(Collection);

  fIsDirty := True;
  fList := TList.Create;
  fIndexList := TList.Create;
end;

destructor TdxMemIndexE.Destroy;
begin
  fList.Free;
  fIndexList.Free;

  inherited Destroy;
end;

procedure TdxMemIndexE.Prepare;
var
  i: Integer;
  mField: TdxMemFieldE;
  tempList: TList;
begin
  if not IsDirty or (fField = nil) then exit;

  fList.Clear;
  fIndexList.Clear;
  with GetMemData do
  begin
    mField := fData.IndexOf(fField);
    if (mField <> nil) then
    begin
      fList.Capacity := fData.FValues.Count;
      fIndexList.Capacity := fList.Capacity;
      for i := 0 to fData.FValues.Count - 1 do
      begin
        fList.Add(fData.FValues.List^[i]);
        fIndexList.Add(Pointer(i));
      end;
      tempList := TList.Create;
      tempList.Add(fIndexList);
      try
        DoSort(fList, mField.FValueOffSet, mField.FDataSize, fField.DataType, False, tempList);
      finally
        tempList.Free;
      end;
      IsDirty := False;
    end;
  end;
end;

function TdxMemIndexE.GotoNearest(const Buffer : PChar; var Index : Integer) : Boolean;
var
  mField: TdxMemFieldE;
begin
  Result := False;
  Prepare;
  if IsDirty then exit;
  with GetMemData do
  begin
    mField := fData.IndexOf(fField);
    if (mField <> nil) then
      Result := GetMemData.InternalGotoNearest(fList, mField.FValueOffSet, fField.DataType,
                  Buffer, False, Index);
      if Result then
        Index := Integer(fIndexList.List^[Index]);          
  end;
end;

procedure TdxMemIndexE.SetIsDirty(Value: Boolean);
begin
  if not Value and (fField = nil) then
    Value := True;
  if (fIsDirty <> Value) then
  begin
    fIsDirty := Value;
    if (Value) then
      fList.Clear;
  end;
end;

procedure TdxMemIndexE.DeleteRecord(pRecord: Pointer);
begin
  if not fIsDirty then
    fList.Remove(pRecord);
end;

procedure TdxMemIndexE.UpdateRecord(pRecord: Pointer);
var
  i, Index: Integer;
  mField: TdxMemFieldE;
begin
  if fIsDirty then
    exit;
  i := fList.IndexOf(pRecord);
  if i > -1 then
  begin
    Index := GetMemData.Data.FValues.IndexOf(fList.List^[i]);
    if Index > - 1 then
    begin
      mField := GetMemData.Data.IndexOf(fField);
      with GetMemData, GetMemData.Data do
      begin
        if ((Index = 0) or (CompareValues(GetValue(mField, Index - 1), GetValue(mField, Index), fField.DataType) <= 0))
        and ((Index < RecordCount - 1) or (CompareValues(GetValue(mField, Index), GetValue(mField, Index + 1), fField.DataType) <= 0)) then
          exit;
      end;    
    end;
  end;
  fIsDirty := True;
end;

procedure TdxMemIndexE.SetFieldName(Value: String);
var
  AField : TField;
begin
  if (GetMemdata <> nil) and (csLoading in GetMemdata.ComponentState) then
  begin
    fLoadedFieldName := Value;
    exit;
  end;
  if (CompareText(fFieldName, Value) <> 0) then
  begin
    AField := GetMemData.FieldByName(Value);
    if AField <> nil then
    begin
      fFieldName := AField.FieldName;
      fField := AField;
      IsDirty := True;
    end;
  end;
end;

procedure TdxMemIndexE.SetFieldNameAfterMemdataLoaded;
begin
  if (fLoadedFieldName <> '') then
    FieldName := fLoadedFieldName;
end;

function TdxMemIndexE.GetMemData: TdxMemDataE;
begin
  Result := TdxMemIndexEes(Collection).fMemData;
end; 

{TdxMemIndexEes}
function TdxMemIndexEes.GetOwner: TPersistent;
begin
  Result := fMemData;
end;

procedure TdxMemIndexEes.SetIsDirty;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    TdxMemIndexE(Items[i]).IsDirty := True;
end;

procedure TdxMemIndexEes.DeleteRecord(pRecord: Pointer);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    TdxMemIndexE(Items[i]).DeleteRecord(pRecord);
end;

procedure TdxMemIndexEes.UpdateRecord(pRecord: Pointer);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    TdxMemIndexE(Items[i]).UpdateRecord(pRecord);
end;

procedure TdxMemIndexEes.RemoveField(AField: TField);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    if(TdxMemIndexE(Items[i]).fField = AField) then
    begin
      TdxMemIndexE(Items[i]).fField := nil;
      TdxMemIndexE(Items[i]).IsDirty := True;
    end;
end;

procedure TdxMemIndexEes.CheckFields;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    TdxMemIndexE(Items[i]).fField := fMemData.FindField(TdxMemIndexE(Items[i]).FieldName);
    TdxMemIndexE(Items[i]).IsDirty := True;
  end;
end;

procedure TdxMemIndexEes.AfterMemdataLoaded;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    TdxMemIndexE(Items[i]).SetFieldNameAfterMemdataLoaded;
end;

function TdxMemIndexEes.Add: TdxMemIndexE;
begin
  Result := TdxMemIndexE(inherited Add);
end;

function TdxMemIndexEes.GetIndexByField(AField: TField): TdxMemIndexE;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if(TdxMemIndexE(Items[i]).fField = AField) then
    begin
      Result := TdxMemIndexE(Items[i]);
      break;
    end;
end;


{ TdxMemDataE }
constructor TdxMemDataE.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FData := TdxMemFieldEs.Create(self);
  FData.FDataSet := self;
  FBookMarks := TList.Create;
  FBlobList := TList.Create;
  FFilterList := TList.Create;
  {$IFNDEF LINUX}
  FDelimiterChar := Char(VK_TAB);
  {$ELSE}
  FDelimiterChar := #9;  
  {$ENDIF}
  FGotoNearestMin := -1;
  FGotoNearestMax := -1;

  fIndexes := TdxMemIndexEes.Create(TdxMemIndexE);
  fIndexes.fMemData := self;
  fPersistent := TdxMemPersistentE.Create(self);

  CreateRecIDField;
end;

destructor TdxMemDataE.Destroy;
begin
  fIndexes.Free;
  BlobClear;
  FBlobList.Free;
  FBlobList := nil;
  FBookMarks.Free;
  FFilterList.Free;
  FData.Free;
  FData := nil;
  FActive := False;
  fPersistent.Free;
  
  inherited Destroy;
end;

procedure TdxMemDataE.CreateRecIDField;
begin
  if (FRecIdField <> nil) then exit;
  FRecIdField := TIntegerField.Create(self);
  with FRecIdField do
  begin
    FieldName := 'RecId';
    DataSet := self;
    Name := self.Name + FieldName;
    Calculated := True;
    Visible := False;
  end;
end;

procedure TdxMemDataE.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if Active and not (csLoading in ComponentState) and not (csDestroying in ComponentState) then
  begin
    if (AComponent is TField) and (TField(AComponent).DataSet = self) then
    begin
      if(Operation = opInsert) then
        FData.AddField(AComponent as TField)
      else
      begin
        if (FRecIdField = AComponent) then
          FRecIdField := nil;
        FData.RemoveField(AComponent as TField);
        Indexes.RemoveField(AComponent as TField);
      end;
    end;
  end;
  inherited Notification(AComponent, Operation);
end;

function TdxMemDataE.BookmarkValid(Bookmark: TBookmark): Boolean;
var
  Index : Integer;
begin
  Result := (Bookmark <> nil);
  if(Result) then
  begin
    Index :=FBookMarks.IndexOf(TObject(PInteger(Bookmark)^));
    Result := (Index > -1) and (Index < Data.RecordCount);
    if  FIsFiltered then
      Result := FFilterList.IndexOf(Pointer(Index + 1)) > -1;
  end;
end;

function TdxMemDataE.CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer;
const
  RetCodes: array[Boolean, Boolean] of ShortInt = ((2, -1), (1, 0));
var
  r1, r2 : Integer;
begin
  Result := RetCodes[Bookmark1 = nil, Bookmark2 = nil];
  if(Result = 2) then
  begin
    Move(Bookmark1^, r1, SizeOf(Integer));
    Move(Bookmark2^, r2, SizeOf(Integer));
    if(r1 = r2) then
       Result := 0
    else begin
      if FSortedField <> nil then
      begin
        r1 := FBookMarks.IndexOf(TObject(r1));
        r2 := FBookMarks.IndexOf(TObject(r2));
      end;
      if(r1 > r2) then
        Result := 1
      else Result := -1;
    end;
  end;
end;

function TdxMemDataE.CheckFields(FieldsName: string): Boolean;
var
  FieldList: TList;
  i: Integer;
begin
  FieldList := TList.Create;
  GetFieldList(FieldList, FieldsName);
  Result := FieldList.Count > 0;
  if Result then
  begin
    for i := 0 to FieldList.Count - 1 do
      if(FieldList[i] = nil) then
      begin
        Result := False;
        break;
      end;
  end;
  FieldList.Free;
end;


function TdxMemDataE.InternalLocate(const KeyFields: string; const KeyValues: Variant;
           Options: TLocateOptions): Integer;

  function CompareLocate_SortCaseSensitive: Boolean;
  begin
    Result := ((loCaseInsensitive in Options) and (soCaseInsensitive in SortOptions))
     or ( not (loCaseInsensitive in Options) and not (soCaseInsensitive in SortOptions))
  end;

  procedure AllocPCharByVariant(AValue: Variant; AField: TField; var ABuf: PChar);
  {$IFDEF WIDESTRING}
   var
    ws : PWideChar;
  {$ENDIF}
  begin
    GetMem(ABuf, AField.DataSize);
    {$IFDEF WIDESTRING}
    if (AField.DataType = ftWideString) then
    begin
      ws := SysAllocString(nil);
      Move(ws, ABuf^, SizeOf(WideString));
    end;
    {$ENDIF}
    VariantToMemDataValue(AValue, ABuf, AField);
  end;

  procedure FreePChar(AField: TField; ABuf: PChar);
  begin
    if ABuf = nil then
     exit;
    {$IFDEF WIDESTRING}
    if (AField.DataType = ftWideString) then
      SysFreeString(PWideChar(Pointer(ABuf)^));
    {$ENDIF}
    FreeMem(ABuf, AField.DataSize);
  end;

  function CompareLocStr(DataType : TFieldType; buf1, buf2 : PChar; AStSize: Integer) : Integer;
  var
    tempbuf : PChar;
    fStr2Len : Integer;
  {$IFDEF WIDESTRING}
    tempwStr : WideString;
  {$ENDIF}
  begin
    Result := -1;
    {$IFDEF WIDESTRING}
    if (DataType = ftWideString) then
    begin
      fStr2Len := Length(PWideString(buf2)^);
      if fStr2Len = AStSize then
        Result := InternalCompareValues(buf1, buf2, DataType, loCaseInsensitive in Options)
      else
        if (loPartialKey in Options) and (fStr2Len > AStSize) then
        begin
          tempwStr := PWideString(buf2)^;
          SetLength(tempwStr, AStSize);
          Result := InternalCompareValues(buf1, PChar(@tempwStr), DataType, loCaseInsensitive in Options);
        end;
    end else
    {$ENDIF}
    begin
      fStr2Len := StrLen(buf2);
      if fStr2Len = AStSize then
        Result := InternalCompareValues(buf1, buf2, DataType, loCaseInsensitive in Options)
      else
        if (loPartialKey in Options) and (fStr2Len > AStSize) and (AStSize > 0) then
        begin
          tempbuf := StrAlloc(AStSize + 1);
          tempbuf := StrMove(tempbuf, buf2, AStSize);
          tempbuf[AStSize] := #0;
          Result := InternalCompareValues(buf1, tempbuf, DataType, loCaseInsensitive in Options);
          StrDispose(tempbuf);
        end;
    end;
  end;

  function LocateByIndexField(AIndex: TdxMemIndexE; AField: TField; AValue: Variant) : Integer;
  var
    fOldSortOptions : TdxSortOptions;
    FStSize : Integer;
    mField: TdxMemFieldE;
    fBuf: PChar;
  begin
    AllocPCharByVariant(AValue, AField, fBuf);
    fOldSortOptions := SortOptions;
    if loCaseInsensitive in  Options then
      Include(FSortOptions, soCaseInsensitive);

    if AIndex = nil then
      GotoNearest(fBuf, soDesc in SortOptions, Result)
    else AIndex.GotoNearest(fBuf, Result);
    if (Result > -1) and (AField.DataType in [ftString{$IFDEF WIDESTRING}, ftWideString{$ENDIF}])then
    begin
      FStSize := StrLen(fBuf);
      mField := FData.IndexOf(AField);
      if CompareLocStr(AField.DataType, fBuf, mField.Values[Result], FStSize) <> 0 then
        Result := -1;
    end;

    FSortOptions := fOldSortOptions;
    FreePChar(AField, FBuf);
 end;

 procedure PrepareLocate;
 begin
   CheckBrowseMode;
   CursorPosChanged;
   UpdateCursorPos;
 end;

 function GetLocateValue(Index: Integer): Variant;
 begin
   if VarIsArray(KeyValues) then
     Result := KeyValues[Index]
   else Result := KeyValues;
 end;

var
  buf : PChar;
  fValueList, fFieldList, fmFieldList : TList;
  StartId : Integer;
  Field : TField;
  i, j, k, RealRec, RealRecordCount : Integer;
  StSize : Integer;
  IsIndexed  : Boolean;
begin
  Result := -1;
  if not CheckFields(KeyFields) then
    raise Exception.CreateFmt(SFieldNotFound, [KeyFields]);
  if (RecordCount = 0) then exit;

  Field := FindField(KeyFields);

  if ((Field <> nil) and VarIsArray(KeyValues)) or
  ((Field = nil) and not VarIsArray(KeyValues))  then
    exit;

  PrepareLocate;

  if (Field <> nil) and not FIsFiltered
  and ((Field = FSortedField) or (Indexes.GetIndexByField(Field) <> nil))
  and CompareLocate_SortCaseSensitive then
  begin
    if (Field = FSortedField) then
      Result := LocateByIndexField(nil, Field, KeyValues)
    else Result := LocateByIndexField(Indexes.GetIndexByField(Field), Field, KeyValues);
    exit;
  end;

  fFieldList := TList.Create;
  fValueList := TList.Create;
  fmFieldList := TList.Create;
  GetFieldList(fFieldList, KeyFields);
  for i := 0 to fFieldList.Count - 1 do
  begin
     if VarIsNull(GetLocateValue(i)) then
      fValueList.Add(nil)
    else
    begin
      AllocPCharByVariant(GetLocateValue(i), TField(fFieldList[i]), Buf);
      fValueList.Add(buf);
    end;
    fmFieldList.Add(FData.IndexOf(TField(fFieldList[i])));
  end;

  StartId := 0;
  IsIndexed := False;
  if not FIsFiltered then
  begin
    RealRecordCount := FData.RecordCount - 1;
    if CompareLocate_SortCaseSensitive
    and ((TField(fFieldList[0]) = FSortedField)
    or (Indexes.GetIndexByField(TField(fFieldList[0])) <> nil)) then
    begin
      Field := TField(fFieldList[0]);
      if (Field = FSortedField) then
        StartId := LocateByIndexField(nil, Field, GetLocateValue(0))
      else StartId := LocateByIndexField(Indexes.GetIndexByField(Field), Field, KeyValues);
      IsIndexed := True;
    end;
  end else RealRecordCount := FFilterList.Count - 1;

  if StartId > -1 then
  begin
    for i := StartId to RealRecordCount do
    begin
      if not FIsFiltered then
        RealRec := i
      else RealRec := Integer(FFilterList[i]) - 1;
      j := 0;
      for k := 0 to fFieldList.Count - 1 do
      if (TField(fFieldList[k]) <> nil) then begin
        if (fValueList[k] = nil) then
        begin
          if (TdxMemFieldE(fmFieldList[k]).HasValues[RealRec] <> #0) then
            j := -1;
        end
        else
        begin
          if (TField(fFieldList[k]).DataType in [ftString{$IFDEF WIDESTRING}, ftWideString{$ENDIF}])
          and (Options <> []) then
          begin
            {$IFDEF WIDESTRING}
            if(TField(fFieldList[k]).DataType = ftWideString) then
              StSize := Length(PWideString(PChar(fValueList[k]))^)
            else
            {$ENDIF}
              StSize := StrLen(PChar(fValueList[k]));
              j := CompareLocStr(TField(fFieldList[k]).DataType,
                PChar(fValueList[k]), TdxMemFieldE(fmFieldList[k]).Values[RealRec], StSize)
          end else j := InternalCompareValues(PChar(fValueList[k]), TdxMemFieldE(fmFieldList[k]).Values[RealRec], TField(fFieldList[k]).DataType, loCaseInsensitive in Options);
        end;
        if IsIndexed and (k = 0) and (j <> 0) then
        begin
         RealRec := -1;
         break;
        end;
        if j <> 0 then break;
      end;
      if RealRec = -1 then
        break;
      if j = 0 then
      begin
        Result := i;
        break;
      end;
    end;
  end;

  for i := 0 to fValueList.Count - 1 do
    FreePChar(TField(fFieldList[i]), fValueList[i]);

  fFieldList.Free;
  fValueList.Free;
  fmFieldList.Free;
end;

function TdxMemDataE.Locate(const KeyFields: string; const KeyValues: Variant;
           Options: TLocateOptions): Boolean;
var
  AIndex: Integer;
begin
  AIndex := InternalLocate(KeyFields, KeyValues, Options);
  Result := AIndex > -1;
  if Result then
  begin
    Inc(AIndex);
    if(RecNo <> AIndex) then
     RecNo := AIndex
    else Resync([]);
  end;
end;

function TdxMemDataE.Seek(const KeyFields: String;
  const KeyValues: Variant; Options: TLocateOptions;
  var ResultAry: TIntegerDynArray): Boolean;   //根据Locate改写,用于查询多条满足条件的记录。sha
var
  i: Integer;
begin   
  ResultAry := InternalSeek(KeyFields, KeyValues, Options);
  Result :=length(ResultAry) > 0;
  if Result then
  begin
    for i:= 0 to length(ResultAry)-1 do
      Inc(ResultAry[i]);
   { if(RecNo <> AIndex) then
     RecNo := AIndex
    else Resync([]);}
  end;
end;

function TdxMemDataE.Lookup(const KeyFields: string; const KeyValues: Variant;
    const ResultFields: string): Variant;
var
  Field : TField;
  mField : TdxMemFieldE;
  FLookupIndex: Integer;
begin
  Field := FindField(ResultFields);
  if(Field is TStringField) then
    Result := ''
  else Result := False;
  if(Field <> Nil)  then
  begin
    FLookupIndex := InternalLocate(KeyFields, KeyValues, []);
    if (FLookupIndex > -1) then
    begin
      if not (Field is TBlobField) then
      begin
        mField := FData.IndexOf(Field);
        if (mField <> nil) then
          Result := GetVariantValue(mField.Values[FLookupIndex], Field.DataType);
      end else
      begin
        Result := PMemBlobDataArray(FBlobList[FLookupIndex])[Field.Offset];
      end;
    end;
  end;
end;

function TdxMemDataE.GetRecNoByFieldValue(Value : Variant; FieldName : String) : Integer;
var
  Buf : Pointer;
  Field : TField;
  mField : TdxMemFieldE;
  i : Integer;
begin
  Result := -1;
  Field := FindField(FieldName);
  if(Field <> nil) then
  begin
    buf := nil;
    mField := FData.IndexOf(Field);
    if (mField <> nil) then
    try
      GetMem(buf, Field.DataSize);
      DisableControls;
      Insert;
      Field.Value := Value;
      FData.GetActiveBuffer(ActiveBuffer, buf, Field);
      Cancel;
      EnableControls;
      for i := 0 to FData.RecordCount - 1 do
        if(CompareValues(PChar(Buf), mField.Values[i], Field.DataType) = 0) then
        begin
          Result := i + 1;
          break;
        end;
    finally
      FreeMem(buf, Field.DataSize);
    end;
  end;
end;

function TdxMemDataE.SupportedFieldType(AType: TFieldType): Boolean;
begin
  Result := AType in [ftString, ftSmallint, ftInteger, ftWord, ftBoolean,
    ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime, ftAutoInc,
    ftBlob, ftMemo, ftGraphic, ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary
    {$IFDEF WIDESTRING}, ftWideString{$ENDIF}{$IFDEF DELPHI5} , ftLargeInt {$ENDIF}];
end;

procedure TdxMemDataE.InternalOpen;
var
  i : Integer;
begin
  for i := 0 to FieldCount - 1 do
    if not SupportedFieldType(Fields[i].DataType) then
    begin
      DatabaseErrorFmt('Unsupported field type: %s', [Fields[i].FieldName]);
      exit;
    end;

  FillBookMarks;

  FCurRec := -1;
  FFilterCurRec := -1;

  FRecInfoOfs := 0;
  for i := 0 to FieldCount - 1 do
    if not Fields[i].IsBlob then
      Inc(FRecInfoOfs, Fields[i].DataSize + 1);

  FRecBufSize := FRecInfoOfs + SizeOf(TdxRecInfo);
  BookmarkSize := SizeOf(Integer);

  InternalInitFieldDefs;

  if DefaultFields then CreateFields;

  for i := 0 to FieldCount - 1 do
   if not Fields[i].IsBlob then
     FData.Add(Fields[i]);

  FData.FValues := TList.Create;
  BindFields(True);
  FActive := True;
  MakeSort;
  Indexes.CheckFields;
end;

procedure TdxMemDataE.InternalClose;
begin
  if (csDestroying in ComponentState) then exit;

  FData.Clear;
  FBookMarks.Clear;
  FFilterList.Clear;
  BlobClear;
  FSortedField := nil;


  if DefaultFields then DestroyFields;

  FLastBookmark := 0;
  FCurRec := -1;
  FFilterCurRec := -1;
  FActive := False;
end;

function TdxMemDataE.IsCursorOpen: Boolean;
begin
  Result := FActive;
end;

procedure TdxMemDataE.InternalInitFieldDefs;
var
  i : Integer;
begin
  FieldDefs.Clear;
  for i := 0 to  FieldCount - 1 do
    with Fields[i] do
      if not (Calculated  or Lookup) then
        FieldDefs.Add(FieldName, DataType, Size, Required)
      else
        if Calculated then
          FData.FCalcFields.Add(Fields[i]); 
end;

procedure TdxMemDataE.InternalHandleException;
begin
  Application.HandleException(Self);
end;

procedure TdxMemDataE.InternalGotoBookmark(Bookmark: Pointer);
var
  Index, IndexF: Integer;
begin
  Index := FBookMarks.IndexOf(TObject(PInteger(Bookmark)^));
  if Index > -1 then
  begin
    if FIsFiltered then
    begin
      IndexF := FFilterList.IndexOf(Pointer(Index + 1));
      if(IndexF > -1) then
      begin
        FFilterCurRec := IndexF;
        FCurRec := Index;
      end;
    end else FCurRec := Index
  end else
    DatabaseError('Bookmark not found');
end;

procedure TdxMemDataE.InternalSetToRecord(Buffer: PChar);
begin
  InternalGotoBookmark(@PdxRecInfo(Buffer + FRecInfoOfs).Bookmark);
end;

function TdxMemDataE.GetBookmarkFlag(Buffer: PChar): TBookmarkFlag;
begin
  Result := PdxRecInfo(Buffer + FRecInfoOfs).BookmarkFlag;
end;

procedure TdxMemDataE.SetBookmarkFlag(Buffer: PChar; Value: TBookmarkFlag);
begin
  PdxRecInfo(Buffer + FRecInfoOfs).BookmarkFlag := Value;
end;

procedure TdxMemDataE.GetBookmarkData(Buffer: PChar; Data: Pointer);
begin
  PInteger(Data)^ := PdxRecInfo(Buffer + FRecInfoOfs).Bookmark;
end;

procedure TdxMemDataE.SetBookmarkData(Buffer: PChar; Data: Pointer);
begin
  PdxRecInfo(Buffer + FRecInfoOfs).Bookmark := PInteger(Data)^;
end;

function TdxMemDataE.GetCurrentRecord(Buffer: PChar): Boolean;
begin
  if ActiveBuffer <> nil then
  begin
    Move(ActiveBuffer^, Buffer^, RecordSize);
    Result := True;
  end else Result := False;
end;

function TdxMemDataE.GetRecordSize: Word;
begin
  Result := FRecInfoOfs;
end;

procedure TdxMemDataE.Loaded;
begin
  inherited Loaded;
  Indexes.AfterMemdataLoaded;
  if Active and (Persistent.Option = poLoad) then
    Persistent.LoadData;
end;

function TdxMemDataE.AllocRecordBuffer: PChar;
{$IFDEF WIDESTRING}
var
  buf: PChar;
  ws: PWideChar;
  i: Integer;
{$ENDIF}
begin
  GetMem( Result, FRecBufSize + BlobFieldCount * SizeOf(Pointer));
  {$IFDEF WIDESTRING}
  for i := 0 to FData.FWideStringFields.Count - 1 do
  begin
    buf := Result + TdxMemFieldE(FData.FWideStringFields[i]).FOffSet;
    ws := SysAllocString(nil);
    Move(ws, (buf + 1)^, SizeOf(WideString));
  end;
  {$ENDIF}
  if BlobFieldCount > 0 then
    Initialize(PMemBlobDataArray(Result + FRecBufSize)[0], BlobFieldCount);
end;

procedure TdxMemDataE.FreeRecordBuffer(var Buffer: PChar);
{$IFDEF WIDESTRING}
var
  buf: PChar;
  i: Integer;
{$ENDIF}
begin
  if BlobFieldCount > 0 then
    Finalize(PMemBlobDataArray(Buffer + FRecBufSize)[0], BlobFieldCount);
  {$IFDEF WIDESTRING}
  if (FData <> nil) then
  begin
    for i := 0 to FData.FWideStringFields.Count - 1 do
    begin
      buf := Buffer + TdxMemFieldE(FData.FWideStringFields[i]).FOffSet;
      SysFreeString(PWideChar(Pointer(buf + 1)^));
    end;
  end;
  {$ENDIF}
  FreeMem(Buffer, FRecBufSize + BlobFieldCount * SizeOf(Pointer));
  Buffer := nil;
end;

function TdxMemDataE.GetRecord(Buffer: PChar; GetMode: TGetMode;
  DoCheck: Boolean): TGetResult;
begin
  if (FData = nil) then
  begin
    Result := grError;
    exit;
  end;
  if FData.RecordCount < 1 then
    Result := grEOF else
  begin
    Result := grOK;
    if Not FIsFiltered then
      case GetMode of
        gmNext:
          if FCurRec >= RecordCount - 1  then
            Result := grEOF else
            Inc(FCurRec);
        gmPrior:
          if FCurRec <= 0 then
            Result := grBOF else
            Dec(FCurRec);
        gmCurrent:
          if (FCurRec < 0) or (FCurRec >= RecordCount) then
            Result := grError;
        else GetCalcFields(Buffer);
      end
    else
    begin
      case GetMode of
        gmNext:
          if FFilterCurRec >= RecordCount - 1 then
            Result := grEOF else
            Inc(FFilterCurRec);
        gmPrior:
          if FFilterCurRec <= 0 then
            Result := grBOF else
            Dec(FFilterCurRec);
        gmCurrent:
          if (FFilterCurRec < 0) or (FFilterCurRec >= RecordCount) then
            Result := grError;
        else GetCalcFields(Buffer);
      end;
      if (Result = grOK) then
        FCurRec := Integer(FFilterList[FFilterCurRec]) - 1
      else FCurRec := -1;
    end;

    if Result = grOK then
    begin
      FData.GetBuffer(Buffer, FCurRec);
      with PdxRecInfo(Buffer + FRecInfoOfs)^ do
      begin
        BookmarkFlag := bfCurrent;
        Bookmark := Integer(FBookMarks[FCurRec]);
      end;
      GetMemBlobData(Buffer);      
    end else
      if (Result = grError) and DoCheck then DatabaseError('No Records');
  end;
end;

procedure TdxMemDataE.InternalInitRecord(Buffer: PChar);
var
  i : Integer;
begin
  FillChar(Buffer^, FRecBufSize, 0);
  for i := 0 to BlobFieldCount - 1 do
    PMemBlobDataArray(Buffer + FRecBufSize)[i] := '';
end;

function TdxMemDataE.GetActiveRecBuf(var RecBuf: PChar): Boolean;
begin
  case State of
    dsBrowse: if IsEmpty then RecBuf := nil else RecBuf := ActiveBuffer;
    dsEdit, dsInsert: RecBuf := ActiveBuffer;
    dsCalcFields: RecBuf := CalcBuffer;
  else
    RecBuf := nil;
  end;
  Result := RecBuf <> nil;
end;

function TdxMemDataE.GetFieldData(Field: TField; Buffer: Pointer): Boolean;
var
  RecBuf: PChar;
  BufIsNil : Boolean;
begin
  Result := False;
  if not GetActiveRecBuf(RecBuf) then Exit;

  if Field.IsBlob then
  begin
      Result := Length(GetBlobData(Field, RecBuf)) > 0;
      exit;
  end;

  BufIsNil := Buffer = nil;
  if BufIsNil then
   GetMem(Buffer, Field.DataSize);
  try
    Result := FData.GetActiveBuffer(RecBuf, Buffer, Field)
  finally
    if BufIsNil then
      FreeMem(Buffer, Field.DataSize);
  end;
end;

{$IFDEF DELPHI5}
function TdxMemDataE.GetFieldData(Field: TField; Buffer: Pointer; NativeFormat: Boolean): Boolean;
begin
  if (Field.DataType = ftWideString) then
    Result := GetFieldData(Field, Buffer)
  else Result :=  inherited GetFieldData(Field, Buffer, NativeFormat)
end;
{$ENDIF}

procedure TdxMemDataE.SetFieldData(Field: TField; Buffer: Pointer);
var
  RecBuf : PChar;
begin
  if not (State in dsWriteModes) then
  {$IFDEF DELPHI4}
    DatabaseError(SNotEditing, Self);
  {$ELSE}
    DatabaseError(SNotEditing);
  {$ENDIF}
  if not GetActiveRecBuf(RecBuf) then Exit;

  Field.Validate(Buffer);

  FData.SetActiveBuffer(RecBuf, Buffer, Field);

  if not (State in [dsCalcFields, dsFilter, dsNewValue]) then
    DataEvent(deFieldChange, Longint(Field));
end;

{$IFDEF DELPHI5}
procedure TdxMemDataE.SetFieldData(Field: TField; Buffer: Pointer; NativeFormat: Boolean);
begin
  if (Field.DataType = ftWideString) then
    SetFieldData(Field, Buffer)
  else inherited SetFieldData(Field, Buffer, NativeFormat)
end;
{$ENDIF}

{$IFDEF BCD}
(*
function TdxMemDataE.BCDToCurr(BCD: Pointer; var Curr: Currency): Boolean;
begin
  Move(BCD^, Curr, SizeOf(Currency));
  Result := True;
end;

function TdxMemDataE.CurrToBCD(const Curr: Currency; BCD: Pointer; Precision, Decimals: Integer): Boolean;
begin
  Move(Curr, BCD^, SizeOf(Currency));
  Result := True;
end;
*)
{$ENDIF}

procedure TdxMemDataE.InternalFirst;
begin
  FCurRec := -1;
  FFilterCurRec := -1;
end;

procedure TdxMemDataE.InternalLast;
begin
  if not FIsFiltered then
    FCurRec := FData.RecordCount
  else begin
    FFilterCurRec := RecordCount;
    FCurRec := FData.RecordCount;
  end;
end;

procedure TdxMemDataE.DoAfterCancel;
begin
  if not IsLoading then
    inherited DoAfterCancel;
end;

procedure TdxMemDataE.DoAfterClose;
begin
  if not IsLoading then
    inherited DoAfterClose;
end;

procedure TdxMemDataE.DoAfterInsert;
begin
  if not IsLoading then
    inherited DoAfterInsert;
end;

procedure TdxMemDataE.DoAfterOpen;
begin
  if (Persistent.Option = poActive) then
    Persistent.LoadData;
  if not IsLoading then
    inherited DoAfterOpen;
end;

procedure TdxMemDataE.DoAfterPost;
begin
  if not IsLoading then
    inherited DoAfterPost;
end;

procedure TdxMemDataE.DoBeforeClose;
begin
  if not IsLoading then
    inherited DoBeforeClose;
end;

procedure TdxMemDataE.DoBeforeInsert;
begin
  if not IsLoading then
    inherited ;
end;

procedure TdxMemDataE.DoBeforeOpen;
begin
  if not IsLoading then
    inherited ;
end;

procedure TdxMemDataE.DoBeforePost;
begin
  if not IsLoading then
    inherited DoBeforePost;
end;

procedure TdxMemDataE.DoOnNewRecord;
begin
  if not IsLoading then
    inherited DoOnNewRecord;
end;

procedure TdxMemDataE.InternalAddFilterRecord;
var
  i : Integer;
begin
  if Assigned(OnFilterRecord) then
  begin
    i := FCurRec;
    if i < 0 then
     i := 0;
    if(i >= FFilterList.Count) then
    begin
      if (FCurRec = -1) then
        FCurRec := 0;
      FFilterList.Add(Pointer(FCurRec + 1));
      FFilterCurRec := FFilterList.Count - 1;
    end else
    begin
      FFilterList.Insert(i, Pointer(FCurRec + 1));
      FFilterCurRec := i;
      Inc(i);
      while i < FFilterList.Count  do
      begin
        FFilterList[i] := Pointer(Integer(FFilterList[i]) + 1);
        Inc(i);
      end;
    end;
  end;
end;

procedure TdxMemDataE.MakeRecordSort;
var
  mField : TdxMemFieldE;
  NewCurRec : Integer;


  function GetValue(Index : Integer) : PChar;
  begin
    Result := mField.Values[Index];
  end;

  procedure ExchangeLists;
  var
    i: Integer;
    NewFilterCurRec: Integer;
  begin
    FData.FValues.Move(FCurRec, NewCurRec);
    FBookMarks.Move(FCurRec, NewCurRec);
    if FBlobList.Count > 0 then
      FBlobList.Move(FCurRec, NewCurRec);
    if FIsFiltered then
    begin
      NewFilterCurRec := -1;
      for i := 0 to FFilterList.Count - 1 do
        if (NewCurRec <= (Integer(FFilterList[i]) - 1)) then
        begin
          NewFilterCurRec := i;
          break;
        end;
      if (NewFilterCurRec = -1) then
        NewFilterCurRec := FFilterList.Count - 1;
      FFilterList.Move(FFilterCurRec, NewFilterCurRec);
      FFilterList[NewFilterCurRec] := Pointer(NewCurRec + 1);
      if (FFilterCurRec > NewFilterCurRec) then
        for i := NewFilterCurRec + 1 to FFilterCurRec do
          FFilterList[i] := Pointer(Integer(FFilterList[i]) + 1);
      if (FFilterCurRec < NewFilterCurRec) then
        for i := FFilterCurRec to NewFilterCurRec - 1 do
          FFilterList[i] := Pointer(Integer(FFilterList[i]) - 1);
    end;
    FCurRec := NewCurRec;
  end;

var
  dx : Integer;
begin
  if FLoadFlag or not FActive or (FData.RecordCount < 2) then exit;
  if(FSortedField <> nil) then
  begin
    mField := FData.IndexOf(FSortedField);
    NewCurRec := -1;
    if (mField <> nil) then
    begin
      if not (soDesc in FSortOptions) then
        dx := 1
      else dx := -1;

      if(FCurRec > 0) and
      (CompareValues(GetValue(FCurRec), GetValue(FCurRec - 1), FSortedField.DataType) = -dx) then
        FGotoNearestMax := FCurRec - 1
      else
        if (FCurRec < FData.RecordCount - 1) then
          FGotoNearestMin := FCurRec + 1;
      GotoNearest(GetValue(FCurRec), (soDesc in FSortOptions), NewCurRec);
      FGotoNearestMax := -1;
      FGotoNearestMin := -1;
      if NewCurRec = -1 then
        NewCurRec := 0;
      if (fCurRec < NewCurRec)
      and (CompareValues(GetValue(NewCurRec), GetValue(FCurRec), FSortedField.DataType) = dx) then
        NewCurRec := NewCurRec - 1;
      if NewCurRec = -1 then
        NewCurRec := 0;
      if NewCurRec = fData.RecordCount then
        NewCurRec := fData.RecordCount - 1;
      ExchangeLists;
    end;
  end;
end;

procedure TdxMemDataE.GetLookupFields(List: TList);
var
  i: Integer;
begin
  for i := 0 to FieldCount - 1 do
    if(Fields[i].Lookup)
    and (Fields[i].LookupDataSet <> nil)
    and (Fields[i].LookupDataSet.Active)then
    begin
      List.Add(Fields[i]);
    end;
end;

procedure TdxMemDataE.InternalRefresh;
var
  FSaveRecNo : Integer;
  i, j : Integer;
  LList: TList;
begin
  LList := TList.Create;
  GetLookupFields(LList);
  if (CalcFieldsSize <> 0) and (RecordCount > 0)
  and (Assigned(OnCalcFields) or (LList.Count > 0)) then
  begin
    FLoadFlag := True;
    FSaveRecNo := RecNo;
    DisableControls;
    for i := 1 to RecordCount do
    begin
      RecNo := i;
      Edit;
      DoOnCalcFields;

      for j := 0 to LList.Count - 1 do
        TField(LList[j]).Value := TField(LList[j]).LookupDataSet.Lookup(TField(LList[j]).LookupKeyFields,
          FindField(TField(LList[j]).KeyFields).Value, TField(LList[j]).LookupResultField);

      Post;
    end;
    RecNo := FSaveRecNo;
    EnableControls;
    FLoadFlag := False;
  end;
  LList.Free;
end;

procedure TdxMemDataE.InternalPost;
var
  Buf : Pointer;
  IsMakeSort : Boolean;
  mField : TdxMemFieldE;
begin
  FSaveChanges := True;
  IsMakeSort := FSortedField <> nil;
  if State = dsEdit then
  begin
    if IsMakeSort then
    begin
      mField := FData.IndexOf(FSortedField);
      buf := AllocMem(mField.FDataSize);
      if FData.GetActiveBuffer(ActiveBuffer, Buf, FSortedField) then
        IsMakeSort := CompareValues(mField.Values[FCurRec],
                   Buf, FSortedField.DataType) <> 0
      else IsMakeSort := False;
      FreeMem(Buf);
    end;
    FData.SetBuffer(ActiveBuffer, FCurRec);
  end else
  begin
    Inc(FLastBookmark);
    if (FCurRec < 0) then
      FCurRec := 0;
    FData.InsertRecord(ActiveBuffer, FCurRec, False);
    FBookMarks.Add(Pointer(FLastBookmark));
    if BlobFieldCount > 0 then
    begin
      if (FCurRec < 0) or (FCurRec = RecordCount - 1)  then
        FBlobList.Add(nil)
      else FBlobList.Insert(FCurRec, nil);
    end;
    InternalAddFilterRecord;
  end;

  if BlobFieldCount > 0 then
    SetMemBlobData(ActiveBuffer);

  if IsMakeSort then
    MakeRecordSort;
  UpdateFilterRecord;
  if (State = dsEdit) then
    Indexes.UpdateRecord(Data.FValues[fCurRec])
  else Indexes.SetIsDirty;
end;

{$IFDEF DELPHI4}
procedure TdxMemDataE.InternalInsert;
var
  buf: PChar;
  Value: Integer;
  mField: TdxMemFieldE;
begin
  if (FRecIdField <> nil) then
  begin
    mField := FData.IndexOf(FRecIdField);
    if (mField <> nil) then
    begin
      buf := ActiveBuffer + mField.fOffSet;
      Value := mField.FMaxIncValue + 1;
      buf[0] := Char(1);
      Move(Value, (buf + 1)^, mField.FDataSize);

    end;
  end;
end;
{$ENDIF}

procedure TdxMemDataE.InternalAddRecord(Buffer: Pointer; Append: Boolean);
begin
  FSaveChanges := True;
  Inc(FLastBookmark);
  if Append then InternalLast;
  FData.InsertRecord(ActiveBuffer, FCurRec, True);
  FBookMarks.Add(Pointer(FLastBookmark));

  if BlobFieldCount > 0 then
  begin
    if Append then
      FBlobList.Add(nil)
    else FBlobList.Insert(FCurRec, nil);
    SetMemBlobData(Buffer);
  end;

  InternalAddFilterRecord;
end;

procedure TdxMemDataE.InternalDelete;
var
  i : Integer;
  p : PChar;
begin
  FSaveChanges := True;
  Indexes.DeleteRecord(FData.FValues.List^[FCurRec]);
  FData.DeleteRecord(FCurRec);
  FBookMarks.Delete(FCurRec);

  if BlobFieldCount > 0 then
  begin
    p := FBlobList[FCurRec];
    if (p <> nil) then
    begin
      Finalize(PMemBlobDataArray(p)[0], BlobFieldCount);
      FreeMem(FBlobList[FCurRec], BlobFieldCount * SizeOf(Pointer));
    end;
    FBlobList.Delete(FCurRec);
  end;

  if not FIsFiltered then
  begin
    if FCurRec >= FData.RecordCount then
      Dec(FCurRec);
  end else
  begin
    FFilterList.Delete(FFilterCurRec);
    if(FFilterCurRec < FFilterList.Count) then
      for i := FFilterCurRec to FFilterList.Count - 1 do
        FFilterList[i] := Pointer(Integer(FFilterList[i]) - 1);
    if FFilterCurRec >= RecordCount then
      Dec(FFilterCurRec);
    if(FFilterCurRec > -1) then
      FCurRec := Integer(FFilterList[FFilterCurRec])
    else FCurRec := -1;
  end;
end;

function TdxMemDataE.GetRecordCount: Longint;
begin
  if Not FIsFiltered then
    Result := FData.RecordCount
  else Result := FFilterList.Count;
end;

function TdxMemDataE.GetRecNo: Longint;
begin
  UpdateCursorPos;
  if (FCurRec = -1) and (RecordCount > 0) then
    Result := 1 else
  begin
    if Not FIsFiltered then
      Result := FCurRec + 1
    else Result := FFilterCurRec + 1;
  end;
end;

procedure TdxMemDataE.SetRecNo(Value: Integer);
var
  NewCurRec : Integer;
begin
  if Active then
    CheckBrowseMode;
  if (Value > 0) and (Value <= FData.RecordCount) then
  begin
    DoBeforeScroll;
    if Not FIsFiltered then
      NewCurRec := Value - 1
    else begin
      FFilterCurRec := Value - 1;
      NewCurRec := Integer(FFilterList[FFilterCurRec]) - 1;
    end;
    if (NewCurRec <> FCurRec) then
    begin
      FCurRec := NewCurRec;
      Resync([rmCenter]);
      DoAfterScroll;
    end;
  end;
end;

procedure TdxMemDataE.SetFilteredRecNo(Value: Integer);
var
  Index : Integer;
begin
  Index := FFilterList.IndexOf(Pointer(Value));
  if Index >= 0 then
    SetRecNo(Index + 1);
end;

function TdxMemDataE.GetCanModify: Boolean;
begin
  Result := not FReadOnly or FLoadFlag;
end;

procedure TdxMemDataE.ClearCalcFields(Buffer: PChar);
var
  i : Integer;
  mField: TdxMemFieldE;
begin
  if (Data.Count < 2) or (State = dsCalcFields) then exit;
  for i := 1 to Data.FCalcFields.Count - 1 do
  begin
    mField := fData.IndexOf(TField(FData.FCalcFields[i]));
    Buffer[mField.FOffSet] := #0;
  end;
end;

function TdxMemDataE.GetFieldClass(FieldType: TFieldType): TFieldClass;
begin
  Result := inherited GetFieldClass(FieldType);
end;

function TdxMemDataE.GetStringValue(const Buffer : PChar) : String;
begin
  Result := Buffer;
end;

{$IFDEF WIDESTRING}
function TdxMemDataE.GetWideStringValue(const Buffer : PChar) : WideString;
begin
  Result := WideString(Buffer);
end;
{$ENDIF}

function TdxMemDataE.GetVariantValue(const Buffer : PChar; DataType : TFieldType) : Variant;
begin
   case DataType of
    ftString:  Result := GetStringValue(Buffer);
    {$IFDEF WIDESTRING}
    ftWideString: Result := GetWideStringValue(Buffer);
    {$ENDIF}
    ftSmallint, ftInteger, ftWord, ftAutoInc:
        Result := GetIntegerValue(Buffer, DataType);
    ftFloat, ftCurrency, ftDate, ftTime, ftDateTime:
        Result := GetFloatValue(Buffer);
    ftBCD: Result := GetFloatValue(Buffer);
    ftBoolean: Result := GetBooleanValue(Buffer);
    {$IFDEF DELPHI5}
    ftLargeInt: Result := LongInt(GetLargeIntValue(Buffer, DataType));
    {$ENDIF}
    else Result := NULL;
  end;
end;

function TdxMemDataE.GetIntegerValue(const Buffer : PChar; DataType : TFieldType) : Integer;
var
  Data: record
    case Integer of
      0: (I: Smallint);
      1: (W: Word);
      2: (L: Longint);
  end;
  FSize : Integer;
begin
  case DataType of
    ftSmallint: FSize := SizeOf(SmallInt);
    ftWord: FSize := SizeOf(Word);
  else
    FSize := SizeOf(LongInt);
  end;
  Move(Buffer^, Data, FSize);
  case DataType of
    ftSmallint: Result := Data.I;
    ftWord: Result := Data.W;
  else
    Result := Data.L;
    end;
end;

{$IFDEF DELPHI5}
function TdxMemDataE.GetLargeIntValue(const Buffer : PChar; DataType : TFieldType) : Int64;
begin
  Result := 0;
  Copy(Buffer^, Result, SizeOf(Int64));
end;
{$ENDIF}


function TdxMemDataE.GetFloatValue(const Buffer : PChar) : Double;
begin
  Move(Buffer^, Result, SizeOf(Double));
end;

function TdxMemDataE.GetDateTimeValue(const Buffer : PChar; DataType : TFieldType) : TDateTime;
var
  TimeStamp: TTimeStamp;
  Data: TDateTimeRec;
begin
  Move(Buffer^, Data, SizeOf(Double));
  case DataType of
    ftDate:
       begin
          TimeStamp.Time := 0;
          TimeStamp.Date := Data.Date;
        end;
      ftTime:
        begin
          TimeStamp.Time := Data.Time;
          TimeStamp.Date := DateDelta;
        end;
    else
      try
        TimeStamp := MSecsToTimeStamp(Data.DateTime);
      except
        TimeStamp.Time := 0;
        TimeStamp.Date := 0;
      end;
  end;
  Result := TimeStampToDateTime(TimeStamp);
end;


function TdxMemDataE.GetBooleanValue(const Buffer : PChar) : Boolean;
begin
  Move(Buffer^, Result, SizeOf(Boolean));
end;

function TdxMemDataE.CompareValues(const Buffer1, Buffer2 : PChar; DataType : TFieldType) : Integer;
begin
  Result := InternalCompareValues(Buffer1, Buffer2, DataType, soCaseInsensitive in FSortOptions);
end;

function TdxMemDataE.InternalCompareValues(const Buffer1, Buffer2 : PChar;
        DataType : TFieldType;  IsCaseInsensitive: Boolean) : Integer;
var
  In1, In2 : Integer;
  Db1, Db2 : Double;
  Bool1, Bool2 : Boolean;
{$IFDEF DELPHI5}
  largeint1, largeint2 : Int64;
{$ENDIF}
begin
  case DataType of
    ftString:
      begin
        if (IsCaseInSensitive) then
          Result := StrIComp(Buffer1, Buffer2)
        else Result := StrComp(Buffer1, Buffer2);
        if(Result <> 0) then
          Result := Result div abs(Result);
      end;
    {$IFDEF WIDESTRING}
    ftWideString:
      begin
        if (IsCaseInSensitive) then
          Result := AnsiCompareText(String(PWideString(Buffer1)^), String(PWideString(Buffer2)^))
        else Result := AnsiCompareStr(String(PWideString(Buffer1)^), String(PWideString(Buffer2)^));
        if(Result <> 0) then
          Result := Result div abs(Result);
      end;
   {$ENDIF}
    ftSmallint, ftInteger, ftWord, ftAutoInc:
      begin
        In1 := GetIntegerValue(Buffer1, DataType);
        In2 := GetIntegerValue(Buffer2, DataType);
        if(In1 > In2) then Result := 1
          else if(In1 < In2) then Result := -1
            else Result := 0;
      end;
    {$IFDEF DELPHI5}
    ftLargeInt:
      begin
        largeint1 := GetIntegerValue(Buffer1, DataType);
        largeint2 := GetIntegerValue(Buffer2, DataType);
        if(largeint1 > largeint2) then Result := 1
          else if(largeint1 < largeint2) then Result := -1
            else Result := 0;
      end;
    {$ENDIF}
    ftFloat, ftCurrency, ftBCD:
      begin
        Db1 := GetFloatValue(Buffer1);
        Db2 := GetFloatValue(Buffer2);
        if(Db1 > Db2) then Result := 1
          else if(Db1 < Db2) then Result := -1
            else Result := 0;
      end;
    ftDate, ftTime, ftDateTime:
      begin
        Db1 := GetDateTimeValue(Buffer1, DataType);
        Db2 := GetDateTimeValue(Buffer2, DataType);
        if(Db1 > Db2) then Result := 1
          else if(Db1 < Db2) then Result := -1
            else Result := 0;
      end;
    ftBoolean:
      begin
        Bool1 := GetBooleanValue(Buffer1);
        Bool2 := GetBooleanValue(Buffer2);
        if(Bool1 > Bool2) then Result := 1
          else if(Bool1 < Bool2) then Result := -1
            else Result := 0;
      end;
    else Result := 0;
  end;
end;

function TdxMemDataE.GetSortOptions : TdxSortOptions;
begin
  Result := FSortOptions;
end;

procedure TdxMemDataE.SetSortedField(Value : String);
begin
  if(FSortedFieldName <> Value) then
  begin
    FSortedFieldName := Value;
    MakeSort;
  end else FSortedField := FindField(FSortedFieldName);
end;

procedure TdxMemDataE.SetSortOptions(Value : TdxSortOptions);
begin
  if(FSortOptions <> Value) then
  begin
    FSortOptions := Value;
    MakeSort;
  end;
end;

procedure TdxMemDataE.SetIndexes(Value : TdxMemIndexEes);
begin
  fIndexes.Assign(Value);
end;

procedure TdxMemDataE.SetPersistent(Value: TdxMemPersistentE);
begin
  fPersistent.Assign(Value);
end;

procedure TdxMemDataE.MakeSort;
var
  mField : TdxMemFieldE;
  List: TList;
begin
  FSortedField := nil;
  if FLoadFlag or not FActive then exit;
  FSortedField := FindField(FSortedFieldName);
  if(FSortedField <> nil) then
  begin
    mField := FData.IndexOf(FSortedField);
    if (mField <> nil) then
    begin
      UpdateCursorPos;
      List := TList.Create;
      List.Add(FBookMarks);
      if FBlobList.Count > 0 then
        List.Add(FBlobList);
      try
        DoSort(FData.FValues, mField.FValueOffSet, mField.FDataSize,
                FSortedField.DataType, soDesc in FSortOptions, List);
      finally
        List.Free;
      end;
      UpdateFilters;
      if not FIsFiltered then
        SetRecNo(FCurRec + 1);
      if Active then
        Resync([]);
    end;
  end;
end;

procedure TdxMemDataE.DoSort(List : TList; AOffSet : Integer; Size : Integer;
                DataType : TFieldType; FlagDesc : Boolean; ExhangeList: TList);

  function CompareNodes(const V1, V2 : Pointer; vI1, vI2 : PChar) : Integer;
  begin
    Result := CompareValues(PChar(V1), PChar(V2), DataType);

    if (Result = 0) and (FRecIdField <> nil) then
    begin
      Result := CompareValues(vI1 + 1, vI2 + 1, FRecIdField.DataType); 
    end;

    if FlagDesc then Result := - Result;
  end;

  procedure QuickSort(L : TList; iLo, iHi: Integer);
  var
    Lo, Hi, M : Integer;
    Mid, T : PChar;

    procedure DoExchangeList(FList : TList);
    begin
      T := FList[Lo];
      FList[Lo] := FList[Hi];
      FList[Hi] := T;
    end;
  var
    i: Integer;
  begin
    Lo := iLo;
    Hi := iHi;
    M := (Lo + Hi) div 2;
    Mid := PChar(L[M]);
    repeat
      while (Lo < iHi) do
      begin
        if CompareNodes(PChar(L[Lo]) + AOffSet, Mid + AOffSet, PChar(L[Lo]), Mid) < 0 then
          Inc(Lo)
        else break;
      end;
      while (Hi > iLo) do
      begin
        if CompareNodes(PChar(L[Hi]) + AOffSet, Mid + AOffSet, PChar(L[Hi]), Mid) > 0 then
          Dec(Hi)
        else break;
      end;    
      if Lo <= Hi then
      begin
        DoExchangeList(L);
        if (ExhangeList <> nil) then
        begin
          for i := 0 to ExhangeList.Count - 1 do
            DoExchangeList(TList(ExhangeList.List^[i]));
        end;
        Inc(Lo);
        Dec(Hi);
      end;
    until Lo > Hi;
    if Hi > iLo then QuickSort(L, iLo, Hi);
    if Lo < iHi then QuickSort(L, Lo, iHi);
  end;

begin
  if List.Count > 0 then
    QuickSort(List, 0, List.Count-1);
end;

function TdxMemDataE.InternalGotoNearest(List : TList; AOffSet : Integer; DataType : TFieldType;
        const Buffer : PChar; IsDesc : Boolean; var Index : Integer) : Boolean;
var
  Min, Max, cmp : Integer;
  St1, St2 : String;
  {$IFDEF WIDESTRING}
  wSt1, wSt2 : WideString;
  {$ENDIF}
begin
  Result := False;

  if (List.Count = 0)
  or ((IsDesc or (CompareValues(PChar(List[0]) + AOffSet, Buffer, DataType) > 0))
  and (not IsDesc or (CompareValues(PChar(List[0]) + AOffSet, Buffer, DataType) < 0))) then begin
    if (DataType = ftString) then
    begin
      Index := -1;
      St1 := GetStringValue(PChar(List[0]) + AOffSet);
      St2 := GetStringValue(Buffer);
      if Length(St1) > Length(St2) then
        St1 := Copy(St1, 1, Length(St2))
      else St2 := Copy(St2, 1, Length(St1));
      if (soCaseInsensitive in FSortOptions) then
        cmp := AnsiCompareText(St1, St2)
      else cmp := AnsiCompareStr(St1, St2);
      if (cmp = 0) then
        Index := 0;
    end;
    {$IFDEF WIDESTRING}
    if (DataType = ftWideString) then
    begin
      Index := -1;
      wSt1 := PWideString(PChar(List[0]) + AOffSet)^;
      wSt2 := GetWideStringValue(Buffer);
      if Length(wSt1) > Length(wSt2) then
        wSt1 := Copy(wSt1, 1, Length(wSt2))
      else wSt2 := Copy(wSt2, 1, Length(wSt1));
      {$IFNDEF DELPHI6}
      if (soCaseInsensitive in FSortOptions) then
        cmp := AnsiStrIComp(PChar(wSt1), PChar(wSt2))
      else cmp := AnsiStrComp(PChar(wSt1), PChar(wSt2));
      {$ELSE}
        if (soCaseInsensitive in FSortOptions) then
          cmp := AnsiCompareText(wSt1, wSt2)
        else cmp := AnsiCompareStr(wSt1, wSt2);
      {$ENDIF}
      if (cmp = 0) then
        Index := 0;
    end;
    {$ENDIF}
    exit;
  end;

  if (IsDesc or (CompareValues(Buffer, PChar(List.Last) + AOffSet, DataType) > 0))
  and (not IsDesc or (CompareValues(Buffer, PChar(List.Last) + AOffSet, DataType) < 0))then begin
    Index := List.Count - 1;
    Exit;
  end;

  if FGotoNearestMin = -1 then
    Min := 0
  else Min := FGotoNearestMin;
  if FGotoNearestMax = -1 then
    Max := List.Count - 1
  else Max := FGotoNearestMax;

  repeat
    if ((Max - Min) = 1) then begin
      if(Min = Index) then Min := Max;
      if(Max = Index) then Max := Min;
    end;
    Index := Min + ((Max - Min) div 2);
    cmp := CompareValues(Buffer, PChar(List[Index]) + AOffSet, DataType);
    if cmp = 0 then break;
    if IsDesc then
      cmp := cmp * -1;
    if (cmp > 0) then
      Min := Index
    else  Max := Index;
  until (Min = Max);

  cmp := CompareValues(Buffer, PChar(List[Index]) + AOffSet, DataType);
  if IsDesc then
    cmp := cmp * -1;
  if Not (cmp = 0) then begin
    if (Index < List.Count - 1) And (cmp > 0) then
     Inc(Index);
  end else
  begin
    while (Index > 0)
    and (CompareValues(Buffer, PChar(List[Index - 1]) + AOffSet, DataType) = 0) do
      Dec(Index);
    Result := True;
  end;
end;

function TdxMemDataE.GotoNearest(const Buffer : PChar; IsDesc : Boolean; var Index : Integer) : Boolean;
begin
  Index := -1;
  Result := False;
  if FLoadFlag then exit;

  if(FSortedField <> nil) then
    Result := InternalGotoNearest(FData.FValues, FData.IndexOf(FSortedField).FValueOffSet,
        FSortedField.DataType, Buffer, IsDesc, Index);
end;


procedure TdxMemDataE.SetOnFilterRecord(const Value: TFilterRecordEvent);
begin
  inherited SetOnFilterRecord(Value);
  UpdateFilters;
end;

procedure TdxMemDataE.UpdateFilterRecord;
var
  Accepted : Boolean;
begin
  if not Assigned(OnFilterRecord) then exit;
  Accepted := True;
  OnFilterRecord(self, Accepted);
  if not Accepted and (FFilterCurRec > -1) and (FFilterCurRec < FFilterList.Count) then
  begin
    FFilterList.Delete(FFilterCurRec);
    FIsFiltered := True;   
  end;
end;

procedure TdxMemDataE.UpdateFilters;
var
  Accepted, OldControlsDisabled : Boolean;
  fCount : Integer;
begin
  if not Active then exit;
  OldControlsDisabled := ControlsDisabled;
  if not OldControlsDisabled then
    DisableControls;

  if not FProgrammedFilter then
  begin
    FFilterList.Clear;
    if Assigned(OnFilterRecord) then
    begin
      FIsFiltered := False;
      First;
      fCount := 1;
      while not EOF do
      begin
        Accepted := True;
        OnFilterRecord(self, Accepted);
        if(Accepted) then
          FFilterList.Add(Pointer(fCount));
        Inc(fCount);
        Next;
      end;
    end;  
  end;

  ClearBuffers;

  FIsFiltered := ((FFilterList.Count <> FData.RecordCount)
        and ((FFilterList.Count > 0) or FProgrammedFilter))
        or Assigned(OnFilterRecord);
  if(FIsFiltered) then
  begin
    if(RecordCount > 0) then
      RecNo := 1;
    if FFilterCurRec >= FFilterList.Count then
      FFilterCurRec := FFilterList.Count -1;
    Resync([]);
  end else First;

  if not OldControlsDisabled then
    EnableControls;
end;

function TdxMemDataE.GetValueCount(FieldName : String; Value : Variant) : Integer;
var
  buf : PCHAR;
  i : Integer;
  FieldType : TFieldType;
  mField : TdxMemFieldE;
  Field : TField;
begin
  Result := -1;
  Field := FindField(FieldName);
  if (Field = nil) then exit;

  GetMem(buf, Field.DataSize);
  try
    mField := FData.IndexOf(Field);
    if VariantToMemDataValue(Value, buf, Field) and (mField <> nil) then
    begin
      Result := 0;
      FieldType := Field.DataType;
      for i := 0 to FData.RecordCount - 1 do
        if CompareValues(buf, mField.Values[i], FieldType) = 0 then
          Inc(Result);
    end;
  finally
    FreeMem(buf);
  end;
end;

procedure TdxMemDataE.FillBookMarks;
var
  i : Integer;
begin
  FBookMarks.Clear;
  for i := 1 to FData.RecordCount do
    FBookMarks.Add(Pointer(i));
  FLastBookmark := FData.RecordCount;
end;

procedure TdxMemDataE.MoveCurRecordTo(Index : Integer);
var
  i, FRealRec, FRealIndex : Integer;
begin
  if(Index > 0) and (Index < RecordCount) and (RecNo <> Index) then
  begin
      if not FIsFiltered then
      begin
        FRealRec := FCurRec;
        FRealIndex := Index - 1;
      end else
      begin
        FRealRec := Integer(FFilterList[FFilterCurRec]) - 1;
        FRealIndex := Integer(FFilterList[Index - 1]) - 1;
      end;
    FData.FValues.Move(FRealRec, FRealIndex);
    FBookMarks.Move(FRealRec, FRealIndex);
    if FBlobList.Count > 0 then
      FBlobList.Move(FRealRec, FRealIndex);
    if FIsFiltered then
    begin
      if RecNo <  Index then
      begin
        for i := RecNo to Index - 1 do
          FFilterList[i] := Pointer(Integer(FFilterList[i]) - 1);
      end else
      begin
        for i := RecNo - 2 downto Index - 1  do
          FFilterList[i] := Pointer(Integer(FFilterList[i]) + 1);
      end;
      FFilterList[FFilterCurRec] := Pointer(FRealIndex + 1);
      FFilterList.Move(FFilterCurRec, Index - 1);
    end;
    SetRecNo(Index);
  end;
end;

procedure TdxMemDataE.SaveToTextFile(FileName : String);
var
  Sts : TStringList;
  St : String;
  i : Integer;
  bm : TBookMark;
  List : TList;
begin
  if Not Active then exit;

  Sts := TStringList.Create;
  List := TList.Create;
  DisableControls;
  bm := GetBookmark;
  St := '';
  for i := 0 to FieldCount - 1 do
    if not Fields[i].Calculated and not Fields[i].Lookup and not Fields[i].IsBlob then
      List.Add(Fields[i]);
  for i := 0 to List.Count - 1 do
  begin
    if i <> 0 then
      St := St + FDelimiterChar;
    St := St + TField(List[i]).FieldName;
  end;
  Sts.Add(St);
  First;
  while not EOF do
  begin
    St := '';
    for i := 0 to List.Count - 1 do
    begin
      if i <> 0 then
        St := St + FDelimiterChar;
      St := St + TField(List[i]).Text;
    end;
    Sts.Add(St);
    Next;
  end;
  GotoBookmark(bm);
  FreeBookmark(bm);
  EnableControls;
  List.Free;
  try
    Sts.SaveToFile(FileName);
  except
    raise;
  end;
  Sts.Free;
end;

procedure TdxMemDataE.LoadFromTextFile(FileName : String);
var
  Sts : TStringList;
  St, St1 : String;
  i, j, p : Integer;
  List : TList;
  Field : TField;
begin
  Sts := TStringList.Create;
  try
    Sts.LoadFromFile(FileName);
  except
    raise;
  end;
  if(Sts.Count = 0) then
  begin
    Sts.Free;
    exit;
  end;
  FLoadFlag := True;
  DisableControls;
  Close;
  Open;
  List := TList.Create;
  St := Sts[0];
  p := 1;
  while (St <> '') and (p > 0) do
  begin
    p := Pos(FDelimiterChar, St);
    if(p = 0) then
      St1 := St
    else begin
      St1 := Copy(St, 1, p - 1);
      St :=  Copy(St, p + 1, 1000);
    end;
    Field := FindField(St1);
    if(Field <> nil) and (Field.Calculated or Field.Lookup or Field.IsBlob) then
      Field := nil;
    List.Add(Field);
  end;

  for i := 1 to Sts.Count - 1 do
  begin
    Append;
    St := Sts[i];
    p := 1;
    j := 0;
    while (St <> '') and (p > 0) do
    begin
      p := Pos(FDelimiterChar, St);
      if(p = 0) then
        St1 := St
      else begin
        St1 := Copy(St, 1, p - 1);
        St :=  Copy(St, p + 1, 1000);
      end;
      if(List[j] <> nil) and (St1 <> '') then
        try
          TField(List[j]).Text := St1;
        except
          List[j] := nil;
          raise;
        end;
      Inc(j);
    end;
    Post;
  end;
  FLoadFlag := False;
  First;
  MakeSort;
  EnableControls;
  List.Free;
  Sts.Free;
end;

function GetNoByFieldType(FieldType : TFieldType) : Integer;
const
  dxFieldType : array [TFieldType] of Integer =
    (-1, //ftUnknown
     1, //ftString
     2, //ftSmallint
     3, //ftInteger
     4, //ftWord,
     5, //ftBoolean,
     6, //ftFloat,
     7, //ftCurrency,
     8, //ftBCD,
     9,  //ftDate,
     10, //ftTime,
     11, //ftDateTime,
     -1, //ftBytes,
     -1, //ftVarBytes,
     12, //ftAutoInc,
     13, // ftBlob,
     14, //ftMemo,
     15, //ftGraphic,
     16, //ftFmtMemo,
     17, //ftParadoxOle,
     18, //ftDBaseOle,
     19, //ftTypedBinary
     -1 //  ftCursor
     {$IFDEF DELPHI4}
       ,-1, //ftFixedChar
        20, //ftWideString
        21, //ftLargeInt
        -1, //ftADT
        -1, //ftArray
        -1, //ftReference
        -1  //ftDataSet
       {$IFDEF DELPHI5}
       ,-1, // tOraBlob
        -1, // ftOraClob
        -1, // ftVariant
        -1, //ftInterface
        -1, //ftIDispatch
        -1  //ftGuid
        {$IFDEF DELPHI6}
           , -1 //ftTimeStamp
           , -1 //ftFMTBcd
        {$ENDIF}
       {$ENDIF}
     {$ENDIF}
);
begin
  Result := dxFieldType[FieldType];
end;

{$IFNDEF DELPHI5}
  const SupportFieldCount = 19;
{$ELSE}
  {$IFNDEF WIDESTRING}
    const SupportFieldCount = 20;
  {$ELSE}
    const SupportFieldCount = 21;
  {$ENDIF}
{$ENDIF}

function GetFieldTypeByNo(No : Integer) : TFieldType;
const
  dxFieldType : array [1..SupportFieldCount] of TFieldType =
    (ftString, ftSmallint, ftInteger, ftWord, ftBoolean, ftFloat, ftCurrency, ftBCD,
     ftDate, ftTime, ftDateTime, ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo,
     ftParadoxOle, ftDBaseOle, ftTypedBinary{$IFDEF WIDESTRING},ftWideString{$ENDIF}{$IFDEF DELPHI5}, ftLargeInt{$ENDIF});
begin
  if(No < 1) or (No > SupportFieldCount) then
     result := ftUnknown
  else Result := dxFieldType[No];
end;

procedure TdxMemDataE.SaveToStream(Stream : TStream);
var
  i, j, ibuf, blobIndex : Integer;
  iByte : SmallInt;
  List : TList;
  verfl : Double;
  mField : TdxMemFieldE;
  mFields : TList;
begin
  if Not Active then exit;

  List := TList.Create;
  for i := 1 to FieldCount - 1 do
  begin
    if not Fields[i].Lookup and not Fields[i].Calculated then
      List.Add(Fields[i]);
  end;
  ibuf := List.Count;
  Stream.Write('Ver', 3);
  verfl := MemDataVer;
  Stream.Write(verfl, sizeof(Double));
  Stream.Write(ibuf, 4);


  for i := 0 to List.Count - 1 do
  begin
    {$IFDEF WIDESTRING}
    if(TField(List[i]).DataType = ftWideString) then
      ibuf := TField(List[i]).Size
    else ibuf := TField(List[i]).DataSize;
    {$ELSE}
    ibuf := TField(List[i]).DataSize;
    {$ENDIF}
    Stream.Write(ibuf, 4);
    iByte := GetNoByFieldType(TField(List[i]).DataType);
    Stream.Write(iByte, 2);
    iByte := Length(TField(List[i]).FieldName) + 1;
    Stream.Write(iByte, 2);
    Stream.Write(PChar(TField(List[i]).FieldName)^, iByte);
  end;

  mFields := TList.Create;
  try
    for j := 0 to List.Count - 1 do
      mFields.Add(FData.IndexOf(TField(List[j])));
    for i := 0 to FData.RecordCount - 1 do
    begin
      blobIndex := 0;
      for j := 0 to List.Count - 1 do
      begin
        if not TField(List[j]).IsBlob then
        begin
          mField := TdxMemFieldE(mFields[j]);
          if(TField(List[j]).DataType in [ftString{$IFDEF WIDESTRING}, ftWideString{$ENDIF}]) then
          begin
            if (TField(List[j]).DataType = ftString) then
            begin
              iBuf := StrLen(mField.Values[i]) + 1;
              Stream.Write(iBuf, 4);
              Stream.Write(mField.Values[i]^, iBuf);
            end else
            begin
            {$IFDEF WIDESTRING}
              if ((mField.Values[i] - 1)[0] = Char(1)) then
              begin
                iBuf := Length(PWideString(Pointer(mField.Values[i]))^);
                Stream.Write(iBuf, 4);
                Stream.Write((mField.Values[i] - 1)^, 1);
                Stream.Write(PWideString(Pointer(mField.Values[i])^)^, iBuf * 2);
              end;  
            {$ENDIF}
            end;
          end else
          begin
            Stream.Write((mField.Values[i] - 1)^, 1);
            Stream.Write(mField.Values[i]^, TField(List[j]).DataSize);
          end;
        end else
        begin
          if (PMemBlobDataArray(FBlobList[i]) <> nil) then
            iBuf := Length(PMemBlobDataArray(FBlobList[i])[blobIndex])
          else iBuf := 0;
          Stream.Write(iBuf, 4);
          if (iBuf > 0) then
            Stream.Write(PChar(PMemBlobDataArray(FBlobList[i])[blobIndex])^, iBuf);
          Inc(blobIndex);
        end;
      end;
    end;
  finally
    List.Free;
    mFields.Free;
  end;
end;

procedure TdxMemDataE.SaveToBinaryFile(FileName : String);
var
  fMem : TMemoryStream;
begin
  if Not Active then exit;

  fMem := TMemoryStream.Create;
  SaveToStream(fMem);
  try
    fMem.SaveToFile(FileName);
  except
    raise;
  end;
  fMem.Free;
end;

procedure TdxMemDataE.CreateFieldsFromStream(Stream : TStream);
var
  i, j, Count : Integer;
  fbuf : PChar;
  AField : TField;
  iByte, iByte1 : SmallInt;
  VerNo : Double;
begin
  Close;

  fbuf := StrAlloc(255);
  Stream.Read(fbuf^, 3);
  fbuf[3] := #0;
  if fbuf = 'Ver' then
  begin
    Stream.Read(VerNo, sizeof(Double));
    if VerNo < 1 then
      VerNo := 1;
  end
  else begin
    Stream.Position := 0;
    VerNo := 0;
  end;

  Stream.Read(Count, 4);

  for i := 0 to Count - 1 do
  begin
    if (Stream.Read(j, 4) < 4) then
      break;
    if (Stream.Read(iByte, 2) < 2) then
      break;
    if (Stream.Read(iByte1, 2) < 2) then
      break;
    if( Stream.Read(fbuf^, iByte1) < iByte1) then
      break;

    AField := FindField(String(fbuf));
    if AField = nil then
    begin
      if (GetFieldTypeByNo(iByte) <> ftUnknown) then
      begin
        AField := GetFieldClass(GetFieldTypeByNo(iByte)).Create(self);
        with AField do
        begin
          FieldName := String(fbuf);
          DataSet := self;
          //Name := self.Name + String(fbuf);
          Calculated := False;
          {$IFDEF WIDESTRING}
          if (AField.DataType = ftWideString) then
            Size := j;
          {$ENDIF}
          if (AField.DataType = ftString) then
            Size := j - 1;
        end;
      end;  
    end;
  end;

  StrDispose(fbuf);
end;


type
  TdxReadFieldE = class
  private
    Field : TField;
    fSize : Integer;
    tSize : Integer;
    buffer : PChar;
    FieldTypeNo : Integer;
    BlobData : TMemBlobData;
    HasValue : Byte;
    DataType: TFieldType;
  end;


procedure TdxMemDataE.LoadFromStream(Stream : TStream);
var
  i, j, ibuf, Count : Integer;
  fbuf : PChar;
  List : TList;
  AField : TField;
  EOFFlag : Boolean;
  dxrField : TdxReadFieldE;
  iByte, iByte1 : SmallInt;
  p : Pointer;
  VerNo : Double;
  mField : TdxMemFieldE;
{$IFDEF WIDESTRING}
  pwideCh : PChar;
  wS : WideString;
{$ENDIF}

  function GetReadFieldByField(AField : TField) : TdxReadFieldE;
  var
    i : Integer;
  begin
    Result := nil;
    for i := 0 to List.Count - 1 do
      if(TdxReadFieldE(List[i]).Field = AField) then
      begin
        Result := TdxReadFieldE(List[i]);
        break;
      end;
  end;
var
  mFields : TList;
  testreadfield: TdxReadFieldE;
begin

  DisableControls;
  Close;
  Open;

  fbuf := StrAlloc(255);
  Stream.Read(fbuf^, 3);
  fbuf[3] := #0;
  if fbuf = 'Ver' then
  begin
    Stream.Read(VerNo, SizeOf(Double));
    if VerNo < 1 then
      VerNo := 1;
  end else begin
    Stream.Position := 0;
    VerNo := 0;
  end;
  Stream.Read(Count, 4);
  List := TList.Create;
  ibuf := 0;
  for i := 0 to Count - 1 do
  begin
    if (Stream.Read(j, 4) < 4) then
      break;
    if (Stream.Read(iByte, 2) < 2) then
      break;
    if (Stream.Read(iByte1, 2) < 2) then
      break;
    if(iByte1 > 255) then
      raise Exception.Create(IncorrectedData);
    if( Stream.Read(fbuf^, iByte1) < iByte1) then
      break;

    AField := FindField(String(fbuf));
    if(AField <> nil) then
    begin
      Inc(ibuf);
      List.Add(TdxreadFieldE.Create);
      with TdxReadFieldE(List.Last) do
      begin
        Field := AField;
        fSize := j;
        if(fSize < AField.DataSize) then
          tSize := AField.DataSize
        else tSize := fSize;
        {$IFDEF WIDESTRING}
        if (Field.DataType = ftWideString) then
           Buffer := StrAlloc(SizeOf(WideString))
         else  Buffer := StrAlloc(tSize + 1);
        {$ELSE}
        Buffer := StrAlloc(tSize + 1);
        {$ENDIF}
        HasValue := 1;
      end;
    end else  begin
      List.Add(TdxreadFieldE.Create);
      with TdxReadFieldE(List.Last) do
      begin
        Field := nil;
        fSize := j;
        buffer := nil;
        FieldTypeNo := iByte;
        DataType := GetFieldTypeByNo(iByte);
      end;
    end;
  end;

  StrDispose(fbuf);

  EOFFlag := not ((Stream.Position < Stream.Size) and (ibuf > 0));

  mFields := TList.Create;
  try
    for i := 0 to FieldCount - 1 do
      mFields.Add(FData.IndexOf(Fields[i]));
    Count := 1;
    while not EOFFlag do
    begin

      for i := 0 to List.Count - 1 do
        if not EOFFlag then
        begin
          testreadfield := TdxReadFieldE(List[i]);
          with testreadfield do
          begin

            if(Field <> nil) then begin
              if(Field.DataType in [ftString{$IFDEF WIDESTRING}, ftWideString{$ENDIF}]) or Field.IsBlob then
              begin
                EOFFlag := Stream.Read(ibuf, 4) <> 4;
                if not EOFFlag then
                begin
                  if not Field.IsBlob then
                  begin
                    if(Field.DataType = ftString) then
                    begin
                      if ibuf > tsize then
                      begin
                        Stream.Read(buffer^, tsize);
                        Stream.Position := Stream.Position + (ibuf-tsize);
                        EOFFlag := Stream.Position >= Stream.Size;
                      end
                      else EOFFlag := Stream.Read(buffer^, ibuf) <> ibuf;
                    end else
                    begin
                    {$IFDEF WIDESTRING}
                       Stream.Read(HasValue, 1);
                       if (HasValue = 1) then
                       begin
                         pwideCh := StrAlloc(ibuf * 2 + 1);
                         EOFFlag := Stream.Read(Pointer(pWideCh)^, ibuf * 2) <> ibuf * 2;
                         wS := SysAllocStringByteLen(pWideCh, ibuf * 2);
                         strDispose(pWideCh);
                         Move(wS, buffer^, SizeOf(WideString));
//                          move(ws,buffer^,Length(ws)+1);
                       end;
                    {$ENDIF}
                    end;
                  end else begin
                    BlobData := '';
                    if Length(BlobData) < ibuf then
                      SetLength(BlobData, ibuf);
                    EOFFlag := Stream.Read(PChar(BlobData)^, ibuf) <> ibuf
                  end;
                end;
              end else
              begin
                if VerNo > 0 then
                  Stream.Read(HasValue, 1);
                EOFFlag := Stream.Read(buffer^, fSize) <> fSize;
              end;
            end else
            begin
              if (TdxReadFieldE(List[i]).DataType in [ftString{$IFDEF WIDESTRING}, ftWideString{$ENDIF}, ftBlob,
              ftMemo, ftGraphic, ftFmtMemo, ftParadoxOle, ftDBaseOle, ftTypedBinary]) then
              begin
                Stream.Read(ibuf, 4);
                Stream.Position := Stream.Position + ibuf;
              end else
              begin
                if VerNo > 0 then
                  Stream.Position := Stream.Position + 1;
                Stream.Position := Stream.Position + fSize;
              end;
            end;
          end;
        end;
      if EOFFlag then   break;

      Data.Items[0].AddValue(@Count);
      if BlobFieldCount > 0 then
      begin
        GetMem(p, BlobFieldCount * SizeOf(Pointer));
        Initialize(PMemBlobDataArray(p)[0], BlobFieldCount);
        FBlobList.Add(p);
      end;
      j := 0;
      for i := 1 to FieldCount - 1 do
      begin
        dxrField := GetReadFieldByField(Fields[i]);
        mField := TdxMemFieldE(mFields[i]);
        if (mField <> nil) then
        begin
          if(dxrField <> nil) and (dxrField.HasValue <> 0) then
          begin
            {$IFDEF WIDESTRING}
            if(mField.FField.DataType = ftWideString) then
            begin
               mField.AddValue(PChar(PWideString(dxrField.Buffer)));
               SysFreeString(PWideChar(Pointer(dxrField.Buffer)^)); 
             end else mField.AddValue(dxrField.Buffer);
             {$ELSE}
               mField.AddValue(dxrField.Buffer)
            {$ENDIF}
          end else mField.AddValue(nil);
        end else begin
          if (FBlobList.Last <> nil) and (dxrField <> nil) then
            PMemBlobDataArray(FBlobList.Last)[j] := dxrField.BlobData;
          Inc(j);
        end;
      end;

      Inc(Count);
      EOFFlag := Stream.Position >= Stream.Size;      
    end;

  finally
    mFields.Free;
  end;
  FillBookmarks;

  for i := 0 to List.Count - 1 do
    with TdxReadFieldE(List[i]) do
    begin
      if(Field <> nil) then
        StrDispose(buffer);
      Free;
    end;

  List.Free;
  MakeSort;
  UpdateFilters;
  if not FIsFiltered then
    First;
  Resync([]);
  Refresh;
  EnableControls;
end;

procedure TdxMemDataE.LoadFromBinaryFile(FileName : String);
var
  fMem : TMemoryStream;
begin
  fMem := TMemoryStream.Create;
  try
    fMem.LoadFromFile(FileName);
  except
    fMem.Free;
    exit;
  end;

  LoadFromStream(fMem);
  fMem.Free;
end;

function TdxMemDataE.CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
begin
  Result := TMemBlobStream.Create(TBlobField(Field), Mode);
end;


procedure TdxMemDataE.CloseBlob(Field: TField);
var
  i : Integer;
begin
  if (FBlobList <> nil) and (FCurRec >= 0) and (FCurRec < RecordCount) and (State = dsEdit) then
  begin
    i := FCurRec;
    PMemBlobDataArray(ActiveBuffer + FRecBufSize)[Field.Offset] :=
      PMemBlobDataArray(FBlobList[i])[Field.Offset]
  end else PMemBlobDataArray(ActiveBuffer + FRecBufSize)[Field.Offset] := '';
end;

procedure TdxMemDataE.BlobClear;
var
  i : Integer;
  p : PChar;
begin
  if BlobFieldCount > 0 then
    for i := 0 to FBlobList.Count - 1 do
    begin
      p := FBlobList[i];
      if(p <> nil) then
      begin
        Finalize(PMemBlobDataArray(p)[0], BlobFieldCount);
        FreeMem(FBlobList[i], BlobFieldCount * SizeOf(Pointer));
      end;
    end;
  FBlobList.Clear;
end;

function TdxMemDataE.GetBlobData(Field: TField; Buffer: PChar): TMemBlobData;
begin
  Result := PMemBlobDataArray(Buffer + FRecBufSize)[Field.Offset];
end;

procedure TdxMemDataE.SetBlobData(Field: TField; Buffer: PChar; const Value: TMemBlobData);
begin
  if (Buffer = ActiveBuffer) and (State <> dsFilter) then
    PMemBlobDataArray(Buffer + FRecBufSize)[Field.Offset] := Value;
end;

function TdxMemDataE.GetActiveBlobData(Field: TField): TMemBlobData;
var
  i : Integer;
begin
  Result := '';
  i := FCurRec;
  if (i < 0) and (RecordCount > 0) then i := 0
  else if i >= RecordCount then i := RecordCount - 1;
  if (i >= 0) and (i < RecordCount) then
  begin
    if FIsFiltered then
      i := Integer(FFilterList[FFilterCurRec]) - 1;
    Result := PMemBlobDataArray(FBlobList[i])[Field.Offset];
  end;
end;

procedure TdxMemDataE.GetMemBlobData(Buffer : PChar);
var
  i, j : Integer;
begin
  if BlobFieldCount > 0 then
  begin
    if (FCurRec >= 0) and (FCurRec < FData.RecordCount) then
    begin
      j := FCurRec;
      for i := 0 to BlobFieldCount - 1 do
        if FBlobList[j] <> nil then
          PMemBlobDataArray(Buffer + FRecBufSize)[i] := PMemBlobDataArray(FBlobList[j])[i]
        else PMemBlobDataArray(Buffer + FRecBufSize)[i] := '';
    end;
  end;
end;

procedure TdxMemDataE.SetMemBlobData(Buffer : PChar);
var
  p : PChar;
  i, Pos : Integer;
begin
  if BlobFieldCount > 0 then
  begin
    Pos := FCurRec;
    if (Pos < 0) and (FData.RecordCount > 0) then Pos := 0
    else if Pos >= FData.RecordCount then Pos := FData.RecordCount - 1;
    if (Pos >= 0) and (Pos < FData.RecordCount) then
    begin
      p := FBlobList[Pos];
      if p = nil then
      begin
        GetMem(p, BlobFieldCount * SizeOf(Pointer));
        Initialize(PMemBlobDataArray(p)[0], BlobFieldCount);
      end;
      for i := 0 to BlobFieldCount - 1 do
        PMemBlobDataArray(p)[i] := PMemBlobDataArray(Buffer + FRecBufSize)[i];
      FBlobList[Pos] := p;
    end;
  end;
end;

procedure TdxMemDataE.CreateFieldsFromDataSet(DataSet : TDataSet);
var
  AField : TField;
  i : Integer;
begin
  if (DataSet = nil) or (DataSet.FieldCount = 0) then exit;
  Close;
  while FieldCount > 1 do
    Fields[FieldCount - 1].Free;
  if DataSet.FieldCount > 0 then
  begin
    for i := 0 to DataSet.FieldCount - 1 do
      if SupportedFieldType(DataSet.Fields[i].DataType)
      and (CompareText(DataSet.Fields[i].FieldName, 'RECID') <> 0) then
      begin
        if DataSet.Fields[i].DataType = ftWideString then
          AField := TStringField.Create(Self)
        else
          AField := DefaultFieldClasses[DataSet.Fields[i].DataType].Create(self);
        with  DataSet.Fields[i] do
        begin
          AField.Name := self.Name + FieldName;
          AField.FieldName := FieldName;
          if AField is TStringField then
            TStringField(AField).Size := Size;
          if AField is TBlobField then
            TBlobField(AField).Size := Size;
          if AField is TFloatField then
          begin
            TFloatField(AField).Currency := TFloatField(DataSet.Fields[i]).Currency;
            TFloatField(AField).Precision := TFloatField(DataSet.Fields[i]).Precision;
          end;
          AField.DataSet := self;
          AField.Calculated := Calculated;
          AField.Lookup := Lookup;
          if Lookup then
          begin
            AField.KeyFields := KeyFields;
            AField.LookupDataSet := LookupDataSet;
            AField.LookupKeyFields := LookupKeyFields;
            AField.LookupResultField := LookupResultField;
          end;
        end;
      end;
  end else
  begin
    DataSet.FieldDefs.Update;
    for i := 0 to DataSet.FieldDefs.Count - 1 do
      if SupportedFieldType(DataSet.FieldDefs[i].DataType) then
      begin
        AField := DefaultFieldClasses[DataSet.Fields[i].DataType].Create(self);
        with  DataSet.FieldDefs[i] do 
        begin
          AField.Name := self.Name + Name;
          AField.FieldName := Name;
          if AField is TStringField then
                TStringField(AField).Size := Size;
          if AField is TBlobField then
                TBlobField(AField).Size := Size;
          AField.DataSet := self;
        end;
      end;
  end;
end;

procedure TdxMemDataE.LoadFromDataSet(DataSet : TDataSet);
var
  i : Integer;
  AField : TField;
begin
  if (DataSet = nil) or (DataSet.FieldCount = 0) or not DataSet.Active then exit;
  if FieldCount < 2 then
    CreateFieldsFromDataSet(DataSet);
  DataSet.DisableControls;
  DataSet.First;
  DisableControls;
  Open;
  while not DataSet.EOF do
  begin
    Append;
    for i := 0 to DataSet.FieldCount - 1 do
    begin
      AField := FindField(DataSet.Fields[i].FieldName);
      if(AField <> nil) and ((AField.DataType = DataSet.Fields[i].DataType) or
        ((AField.DataType = ftString)and(DataSet.Fields[i].DataType=ftWideString))) then
        AField.Value := DataSet.Fields[i].Value;
    end;
    Post;
    DataSet.Next;
  end;
  DataSet.EnableControls;
  EnableControls;
end;

function TdxMemDataE.InternalSeek(const KeyFields: string;
  const KeyValues: Variant; Options: TLocateOptions): TIntegerDynArray;

  function CompareLocate_SortCaseSensitive: Boolean;
  begin
    Result := ((loCaseInsensitive in Options) and (soCaseInsensitive in SortOptions))
     or ( not (loCaseInsensitive in Options) and not (soCaseInsensitive in SortOptions))
  end;

  procedure AllocPCharByVariant(AValue: Variant; AField: TField; var ABuf: PChar);
  {$IFDEF WIDESTRING}
   var
    ws : PWideChar;
  {$ENDIF}
  begin
    GetMem(ABuf, AField.DataSize);
    {$IFDEF WIDESTRING}
    if (AField.DataType = ftWideString) then
    begin
      ws := SysAllocString(nil);
      Move(ws, ABuf^, SizeOf(WideString));
    end;
    {$ENDIF}
    VariantToMemDataValue(AValue, ABuf, AField);
  end;

  procedure FreePChar(AField: TField; ABuf: PChar);
  begin
    if ABuf = nil then
     exit;
    {$IFDEF WIDESTRING}
    if (AField.DataType = ftWideString) then
      SysFreeString(PWideChar(Pointer(ABuf)^));
    {$ENDIF}
    FreeMem(ABuf, AField.DataSize);
  end;

  function CompareLocStr(DataType : TFieldType; buf1, buf2 : PChar; AStSize: Integer) : Integer;
  var
    tempbuf : PChar;
    fStr2Len : Integer;
  {$IFDEF WIDESTRING}
    tempwStr : WideString;
  {$ENDIF}
  begin
    Result := -1;
    {$IFDEF WIDESTRING}
    if (DataType = ftWideString) then
    begin
      fStr2Len := Length(PWideString(buf2)^);
      if fStr2Len = AStSize then
        Result := InternalCompareValues(buf1, buf2, DataType, loCaseInsensitive in Options)
      else
        if (loPartialKey in Options) and (fStr2Len > AStSize) then
        begin
          tempwStr := PWideString(buf2)^;
          SetLength(tempwStr, AStSize);
          Result := InternalCompareValues(buf1, PChar(@tempwStr), DataType, loCaseInsensitive in Options);
        end;
    end else
    {$ENDIF}
    begin
      fStr2Len := StrLen(buf2);
      if fStr2Len = AStSize then
        Result := InternalCompareValues(buf1, buf2, DataType, loCaseInsensitive in Options)
      else
        if (loPartialKey in Options) and (fStr2Len > AStSize) and (AStSize > 0) then
        begin
          tempbuf := StrAlloc(AStSize + 1);
          tempbuf := StrMove(tempbuf, buf2, AStSize);
          tempbuf[AStSize] := #0;
          Result := InternalCompareValues(buf1, tempbuf, DataType, loCaseInsensitive in Options);
          StrDispose(tempbuf);
        end;
    end;
  end;

  function LocateByIndexField(AIndex: TdxMemIndexE; AField: TField; AValue: Variant) : Integer;
  var
    fOldSortOptions : TdxSortOptions;
    FStSize : Integer;
    mField: TdxMemFieldE;
    fBuf: PChar;
  begin
    AllocPCharByVariant(AValue, AField, fBuf);
    fOldSortOptions := SortOptions;
    if loCaseInsensitive in  Options then
      Include(FSortOptions, soCaseInsensitive);

    if AIndex = nil then
      GotoNearest(fBuf, soDesc in SortOptions, Result)
    else AIndex.GotoNearest(fBuf, Result);
    if (Result > -1) and (AField.DataType in [ftString{$IFDEF WIDESTRING}, ftWideString{$ENDIF}])then
    begin
      FStSize := StrLen(fBuf);
      mField := FData.IndexOf(AField);
      if CompareLocStr(AField.DataType, fBuf, mField.Values[Result], FStSize) <> 0 then
        Result := -1;
    end;

    FSortOptions := fOldSortOptions;
    FreePChar(AField, FBuf);
 end;

 procedure PrepareLocate;
 begin
   CheckBrowseMode;
   CursorPosChanged;
   UpdateCursorPos;
 end;

 function GetLocateValue(Index: Integer): Variant;
 begin
   if VarIsArray(KeyValues) then
     Result := KeyValues[Index]
   else Result := KeyValues;
 end;

var
  buf : PChar;
  fValueList, fFieldList, fmFieldList : TList;
  StartId : Integer;
  Field : TField;
  i, j, k, RealRec, RealRecordCount : Integer;
  StSize : Integer;
  IsIndexed  : Boolean;
begin
  //Result := -1;
  SetLength(Result,0);
  if not CheckFields(KeyFields) then
    raise Exception.CreateFmt(SFieldNotFound, [KeyFields]);
  if (RecordCount = 0) then exit;

  Field := FindField(KeyFields);

  if ((Field <> nil) and VarIsArray(KeyValues)) or
  ((Field = nil) and not VarIsArray(KeyValues))  then
    exit;

  PrepareLocate;
  {以下这段是针对　排序字段（索引）的，现在只是要进行地物查询用。暂去掉不用 sha 2005-8-2
  if (Field <> nil) and not FIsFiltered
  and ((Field = FSortedField) or (Indexes.GetIndexByField(Field) <> nil))
  and CompareLocate_SortCaseSensitive then
  begin
    if (Field = FSortedField) then
      Result := LocateByIndexField(nil, Field, KeyValues)
    else Result := LocateByIndexField(Indexes.GetIndexByField(Field), Field, KeyValues);
    exit;
  end;    }

  fFieldList := TList.Create;
  fValueList := TList.Create;
  fmFieldList := TList.Create;
  try
    GetFieldList(fFieldList, KeyFields);
    for i := 0 to fFieldList.Count - 1 do
    begin
       if VarIsNull(GetLocateValue(i)) then
        fValueList.Add(nil)
      else
      begin
        //sha  2005-12-17 字段的长度　＜　查询地名长度，不查,否则在最后FreePChar时会出错
        if TField(fFieldList[i]).DataSize < Length(GetLocateValue(i)) then
          Continue;
        ////////////
        AllocPCharByVariant(GetLocateValue(i), TField(fFieldList[i]), Buf);
        fValueList.Add(buf);
      end;
      fmFieldList.Add(FData.IndexOf(TField(fFieldList[i])));
    end;

    ///////////　sha  2005-12-17
    if fValueList.count=0 then
      exit;
    ///////////

    StartId := 0;
    IsIndexed := False;
    if not FIsFiltered then
    begin
      RealRecordCount := FData.RecordCount - 1;
      if CompareLocate_SortCaseSensitive
      and ((TField(fFieldList[0]) = FSortedField)
      or (Indexes.GetIndexByField(TField(fFieldList[0])) <> nil)) then
      begin
        Field := TField(fFieldList[0]);
        if (Field = FSortedField) then
          StartId := LocateByIndexField(nil, Field, GetLocateValue(0))
        else StartId := LocateByIndexField(Indexes.GetIndexByField(Field), Field, KeyValues);
        IsIndexed := True;
      end;
    end else RealRecordCount := FFilterList.Count - 1;

    if StartId > -1 then
    begin
      for i := StartId to RealRecordCount do
      begin
        if not FIsFiltered then
          RealRec := i
        else RealRec := Integer(FFilterList[i]) - 1;
        j := 0;
        for k := 0 to fFieldList.Count - 1 do
        if (TField(fFieldList[k]) <> nil) then begin
          if (fValueList[k] = nil) then
          begin
            if (TdxMemFieldE(fmFieldList[k]).HasValues[RealRec] <> #0) then
              j := -1;
          end
          else
          begin
            if (TField(fFieldList[k]).DataType in [ftString{$IFDEF WIDESTRING}, ftWideString{$ENDIF}])
            and (Options <> []) then
            begin
              {$IFDEF WIDESTRING}
              if(TField(fFieldList[k]).DataType = ftWideString) then
                StSize := Length(PWideString(PChar(fValueList[k]))^)
              else
              {$ENDIF}
                StSize := StrLen(PChar(fValueList[k]));
                //================= //沙。2005-10-26 改注释　为以下语句
                //j := CompareLocStr(TField(fFieldList[k]).DataType,
                //    PChar(fValueList[k]), TdxMemFieldE(fmFieldList[k]).Values[RealRec], StSize)
                j:= -1;
                if Options=[loCaseInsensitive] then //全字匹配
                begin
                  if StSize = StrLen(TdxMemFieldE(fmFieldList[k]).Values[RealRec]) then
                    j := InternalCompareValues(
                      PChar(fValueList[k]),
                      TdxMemFieldE(fmFieldList[k]).Values[RealRec],
                      TField(fFieldList[k]).DataType,
                      true);
                end
                else    //模糊查找
                begin
                  if pos(PChar(fValueList[k]), TdxMemFieldE(fmFieldList[k]).Values[RealRec]) mod 2=1 then
                    j:=0;
                end;
                //================
            end else j := InternalCompareValues(PChar(fValueList[k]), TdxMemFieldE(fmFieldList[k]).Values[RealRec], TField(fFieldList[k]).DataType, loCaseInsensitive in Options);
          end;
          if IsIndexed and (k = 0) and (j <> 0) then
          begin
           RealRec := -1;
           break;
          end;
          if j <> 0 then break;
        end;
        if RealRec = -1 then
          break;
        if j = 0 then
        begin
          //Result := i;
          //break;
          SetLength(Result,length(Result)+1);
          Result[Length(Result)-1]:= i;
        end;
      end;
    end;

    for i := 0 to fValueList.Count - 1 do
      FreePChar(TField(fFieldList[i]), fValueList[i]);

  finally
    fFieldList.Free;
    fValueList.Free;
    fmFieldList.Free;
  end;
end;



{TMemBlobStream}
constructor TMemBlobStream.Create(Field: TBlobField; Mode: TBlobStreamMode);
begin
  FMode := Mode;
  FField := Field;
  FDataSet := TdxMemDataE(FField.DataSet);
  if not FDataSet.GetActiveRecBuf(FBuffer) then Exit;
  if not FField.Modified and (Mode <> bmRead) then
  begin
    FCached := True;
    if FField.ReadOnly then DatabaseErrorFmt(SFieldReadOnly, [FField.DisplayName]);
    if not (FDataSet.State in [dsEdit, dsInsert]) then DatabaseError(SNotEditing);
  end else FCached := (FBuffer = FDataSet.ActiveBuffer);
  FOpened := True;
  if Mode = bmWrite then Truncate;
end;

destructor TMemBlobStream.Destroy;
begin
  if FOpened then
    if FModified then FField.Modified := True;
  if FModified then
  try
    FDataSet.DataEvent(deFieldChange, Longint(FField));
  except
    Application.HandleException(Self);
  end;
end;

function TMemBlobStream.GetBlobSize: Longint;
begin
  Result := 0;
  if FOpened then
    if FCached then
      Result := Length(FDataSet.GetBlobData(FField, FBuffer))
    else Result :=  Length(FDataSet.GetActiveBlobData(FField));
end;

function TMemBlobStream.Read(var Buffer; Count: Longint): Longint;
begin
  Result := 0;
  if FOpened then
  begin
    if FCached then
    begin
      if Count > Size - FPosition then
        Result := Size - FPosition else
        Result := Count;
      if Result > 0 then
      begin
        Move(PChar(FDataSet.GetBlobData(FField, FBuffer))[FPosition], Buffer, Result);
        Inc(FPosition, Result);
      end;
    end else
    begin
      Move(PChar(FDataSet.GetActiveBlobData(FField))[FPosition], Buffer, Result);
      Inc(FPosition, Result);
    end;
  end;
end;

function TMemBlobStream.Write(const Buffer; Count: Longint): Longint;
var
  Temp: TMemBlobData;
begin
  Result := 0;
  if FOpened and FCached  then
  begin
    Temp := FDataSet.GetBlobData(FField, FBuffer);
    if Length(Temp) < FPosition + Count then
      SetLength(Temp, FPosition + Count);
    Move(Buffer, PChar(Temp)[FPosition], Count);
    FDataSet.SetBlobData(FField, FBuffer, Temp);
    Inc(FPosition, Count);
    Result := Count;
    FModified := True;
  end;
end;

function TMemBlobStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  case Origin of
    0: FPosition := Offset;
    1: Inc(FPosition, Offset);
    2: FPosition := GetBlobSize + Offset;
  end;
  Result := FPosition;
end;

procedure TMemBlobStream.Truncate;
begin
  if FOpened then begin
    FDataSet.SetBlobData(FField, FBuffer, '');
    FModified := True;
  end;
end;

{ TdxMemPersistentE }
procedure TdxMemPersistentE.Assign(Source: TPersistent);
begin
  if (Source is TdxMemPersistentE) then
  begin
    Option := TdxMemPersistentE(Source).Option;
    FStream.LoadFromStream(TdxMemPersistentE(Source).FStream);
  end else inherited;
end;

constructor TdxMemPersistentE.Create(AMemData: TdxMemDataE);
begin
  inherited Create;
  FStream := TMemoryStream.Create;
  FOption := poActive;
  FMemData := AMemData;
  FIsLoadFromPersistent := False;
end;

destructor TdxMemPersistentE.Destroy;
begin
  FStream.Free;

  inherited Destroy;
end;

procedure TdxMemPersistentE.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineBinaryProperty('Data', ReadData, WriteData, HasData);
end;

procedure TdxMemPersistentE.ReadData(Stream: TStream);
begin
  FStream.Clear;
  FStream.LoadFromStream(Stream);
end;

procedure TdxMemPersistentE.WriteData(Stream: TStream);
begin
  FStream.SaveToStream(Stream);
end;

function TdxMemPersistentE.HasData: Boolean;
begin
  Result := FStream.Size > 0;
end;

procedure TdxMemPersistentE.LoadData;
begin
  if HasData and not FIsLoadFromPersistent then
  begin
    FIsLoadFromPersistent := True;
    try
      FStream.Position := 0;
      FMemData.LoadFromStream(FStream);
    finally
      FIsLoadFromPersistent := False;
    end;
  end;
end;

procedure TdxMemPersistentE.SaveData;
begin
  FStream.Clear;
  FMemData.SaveToStream(FStream);
end;

end.
