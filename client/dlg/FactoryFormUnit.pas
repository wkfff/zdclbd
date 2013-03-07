unit FactoryFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TFactoryForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    ButtonFont: TButton;
    EditFont: TLabeledEdit;
    EditName: TLabeledEdit;
    EditX: TLabeledEdit;
    EditY: TLabeledEdit;
    Label1: TLabel;
    ComboBoxType: TComboBox;
    Panel5: TPanel;
    BitBtnOK: TBitBtn;
    BitBtnDel: TBitBtn;
    BitBtnClose: TBitBtn;
    FontDialog1: TFontDialog;
    ComboBoxFactory: TComboBox;
    Label2: TLabel;
    EditDistance: TEdit;
    Label3: TLabel;
    procedure ButtonFontClick(Sender: TObject);
    procedure ComboBoxTypeChange(Sender: TObject);
  private
    { Private declarations }
    procedure SetIsFactory(isFactory:boolean);
  public
    Font:TFont; 
    { Public declarations }
  end;

var
  FactoryForm: TFactoryForm;

  
implementation
        uses uGloabVar,ConfineAreaUnit;
{$R *.dfm}

procedure TFactoryForm.ButtonFontClick(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    Font:=FontDialog1.Font;
    EditFont.Text:=FontDialog1.Font.Name+','+IntToStr(FontDialog1.Font.Size);
  end;
end;

procedure TFactoryForm.ComboBoxTypeChange(Sender: TObject);
begin
   SetIsFactory(ComboBoxType.ItemIndex=0);
end;

procedure TFactoryForm.SetIsFactory(isFactory: boolean);
var
  i:integer;
  item:TFactoryArea;
begin
   if isFactory then
   begin
      Panel4.Enabled:=false;
      ComboBoxFactory.Color:=clBtnFace;
   end
   else
   begin
      Panel4.Enabled:=true;
      ComboBoxFactory.Color:=clWindow;
      if ComboBoxFactory.Items.Count<=0 then
      begin
          for i :=0  to FactoryAreaManage.Count-1 do
          begin
              item:=FactoryAreaManage.Items[i];
              if  item.TypeID=0  then
              begin
                  ComboBoxFactory.Items.AddObject(item.Name,item);
              end;
          end;
      end;
   end;
   ComboBoxFactory.Enabled:=Panel4.Enabled;
   EditDistance.Enabled:=Panel4.Enabled;
   EditDistance.Color:=clBtnFace;
end;

end.
