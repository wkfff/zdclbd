unit SimplePicFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, RzBorder, Menus;

type
  TSimplePicFrm = class(TForm)
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    photoTip: string;
  end;

implementation
uses
  uGloabVar;
  
{$R *.dfm}

procedure TSimplePicFrm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, $F011, 0);
end;

procedure TSimplePicFrm.Image2Click(Sender: TObject);
begin
  Close;
end;

procedure TSimplePicFrm.Image1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TSimplePicFrm.N1Click(Sender: TObject);
begin
  if (photoTip <> '') then
  begin
    try
      Image1.Picture.SaveToFile(ExePath+'Photo\' + photoTip + '.jpg');
      ShowTips('保存成功！'#13#10 + '保存位置：' + ExePath + 'Photo'#13#10 + '　文件名：' + photoTip + '.jpg', Image2);
    except

    end;
  end;
end;

end.
