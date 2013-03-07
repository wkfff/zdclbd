unit ulayer_control;

interface

uses
  Windows, Messages, SysUtils, Variants, classes, Graphics, Controls, Forms,
  Dialogs, MapControlUnit, StdCtrls, Buttons, ExtCtrls, comCtrls,MetaDefine,Inifiles;

type
  one_layer_property = record //one_layer_property  -->　一层图的相关属性
    layer_id: integer;
    layer_name: string;
    layer_file: string;
    layer_visible: Boolean;
    layer_selected: Boolean;
    layer_MetaIgnore: Boolean;
    layer_ShowLabel: Boolean;
    layer_labelValue: string;
    layer_LayerIgnore: Boolean;
    layer_MinScale: double;
    layer_MaxScale: double;
    layer_datafields: Tstrings;
    Layer: ILayer;
    MapFont:TMapFont;
  end;

  Tlayer_control = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox5: TCheckBox;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ComboBox1: TComboBox;
    GroupBox3: TGroupBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label4: TLabel;
    StatusBar1: TStatusBar;
    Label5: TLabel;
    Edit3: TEdit;
    EditFont: TEdit;
    BitBtnFont: TBitBtn;
    FontDialog1: TFontDialog;
    Shape_Color: TShape;
    Label6: TLabel;
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Exit(Sender: TObject);
    procedure CheckBox2Exit(Sender: TObject);
    procedure CheckBox3Exit(Sender: TObject);
    procedure CheckBox4Exit(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure CheckBox5Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnFontClick(Sender: TObject);
  private
    FMap: Imap;
   // layer: array of Ilayer;
    mylayer_property: array of one_layer_property; //one_layer_property  -->　一层图的相关属性
    layer_property_temp: one_layer_property; //在上下移图层时用的中间变量

    layercount: integer;
    sel_index: integer; //列表中　选中的index

  public
    procedure InitMap(AMap: Imap);
  end;



var
  layer_control: Tlayer_control;


implementation
      uses uGloabVar;
{$R *.dfm}

procedure Tlayer_control.ListBox1Click(Sender: TObject);
var v1, v2: double;
begin
  //----------------- 调入选中行(层)的属性
  //if  sel_index<> listbox1.ItemIndex then
 // begin
  sel_index := ListBox1.ItemIndex;
//  StatusBar1.Panels.Items[0].Text := '选中图层：' + ListBox1.Items.Strings[ListBox1.ItemIndex];
  StatusBar1.Panels.Items[0].Text:=mylayer_property[sel_index].layer_file;

  CheckBox1.Checked := mylayer_property[sel_index].layer_visible;
  CheckBox2.Checked := mylayer_property[sel_index].layer_selected;
  CheckBox3.Checked := mylayer_property[sel_index].layer_MetaIgnore;
  CheckBox4.Checked := mylayer_property[sel_index].layer_ShowLabel;
//  ComboBox1.Items.Assign(mylayer_property[sel_index].layer_datafields);
//  ComboBox1.Text := mylayer_property[sel_index].layer_labelValue;
  CheckBox5.Checked := mylayer_property[sel_index].layer_LayerIgnore;
  v1 := mylayer_property[sel_index].layer_MinScale;
  v2 := mylayer_property[sel_index].layer_MaxScale;
  Edit1.Text := formatfloat('0.00', v1);
  Edit2.Text := formatfloat('0.00', v2);
  ComboBox1.Enabled := CheckBox4.Checked;
  Edit1.Enabled := CheckBox5.Checked;
  Edit2.Enabled := CheckBox5.Checked;

  EditFont.Text:=mylayer_property[sel_index].MapFont.Name+','+IntToStr(mylayer_property[sel_index].MapFont.Size)+','+IntToStr(mylayer_property[sel_index].MapFont.Color);
  Shape_Color.Brush.Color:=mylayer_property[sel_index].MapFont.Color;
 // end;

end;

procedure Tlayer_control.BitBtn1Click(Sender: TObject);
var
  i: integer;
begin
  if BitBtn3.Enabled = false then BitBtn3.Enabled := true;
  //if sel_index > 0 then
  //begin
    for i:= 0 to ListBox1.Count -1 do
    begin
      if (ListBox1.Selected[i]) and (i>0) then
      begin
        ListBox1.Items.Move(i, i - 1);

        layer_property_temp := mylayer_property[i]; //中间变量
        mylayer_property[i] := mylayer_property[i - 1];
        mylayer_property[i - 1] := layer_property_temp;
        ListBox1.Selected[i-1]:= true;
        //sel_index := sel_index - 1;
      end;
    end;
  //end;

//  ListBox1.ItemIndex := i;
end;

procedure Tlayer_control.BitBtn2Click(Sender: TObject);
var
  i: integer;
begin
  if BitBtn3.Enabled = false then BitBtn3.Enabled := true;
  //if sel_index < ListBox1.Count - 1 then
  for i:= ListBox1.Count -1 downto 0 do
  begin
    if (ListBox1.Selected[i]) and (i<ListBox1.Count -1) then
    begin
      ListBox1.Items.Move(i, i + 1);
      layer_property_temp := mylayer_property[i];
      mylayer_property[i] := mylayer_property[i + 1];
      mylayer_property[i + 1] := layer_property_temp;
      ListBox1.Selected[i+1] := true;
      //sel_index := sel_index + 1;
    end;
  end;

 // ListBox1.ItemIndex := sel_index;
end;

procedure Tlayer_control.CheckBox1Exit(Sender: TObject);
begin
  sel_index := ListBox1.ItemIndex;
  if sel_index <> -1 then
    mylayer_property[sel_index].layer_visible := CheckBox1.Checked;
end;

procedure Tlayer_control.CheckBox2Exit(Sender: TObject);
begin
  sel_index := ListBox1.ItemIndex;
  if sel_index <> -1 then
    mylayer_property[sel_index].layer_selected := CheckBox2.Checked;
end;

procedure Tlayer_control.CheckBox3Exit(Sender: TObject);
begin
  sel_index := ListBox1.ItemIndex;
  if sel_index <> -1 then
    mylayer_property[sel_index].layer_MetaIgnore := CheckBox3.Checked;
end;

procedure Tlayer_control.CheckBox4Exit(Sender: TObject);
begin
  sel_index := ListBox1.ItemIndex;
  if sel_index <> -1 then
    mylayer_property[sel_index].layer_ShowLabel := CheckBox4.Checked;
end;

procedure Tlayer_control.ComboBox1Exit(Sender: TObject);
begin
  sel_index := ListBox1.ItemIndex;
  if sel_index <> -1 then
    mylayer_property[sel_index].layer_labelValue := ComboBox1.Text;
end;

procedure Tlayer_control.CheckBox5Exit(Sender: TObject);
begin
  sel_index := ListBox1.ItemIndex;
  if sel_index <> -1 then
    mylayer_property[sel_index].layer_LayerIgnore := CheckBox5.Checked;
end;

procedure Tlayer_control.Edit1Exit(Sender: TObject);
var v1: double;
  code: integer;
begin
  sel_index := ListBox1.ItemIndex;
  if sel_index <> -1 then
  begin
    val(Edit1.Text, v1, code);
    mylayer_property[sel_index].layer_MinScale := v1;
  end;
end;

procedure Tlayer_control.Edit2Exit(Sender: TObject);
var v1: double;
  code: integer;
begin
  sel_index := ListBox1.ItemIndex;
  if sel_index <> -1 then
  begin
    val(Edit2.Text, v1, code);
    mylayer_property[sel_index].layer_MaxScale := v1;
  end;
end;

procedure Tlayer_control.CheckBox5Click(Sender: TObject);
begin
  if BitBtn3.Enabled = false then BitBtn3.Enabled := true;
  Edit1.Enabled := CheckBox5.Checked;
  Edit2.Enabled := CheckBox5.Checked;
end;

procedure Tlayer_control.CheckBox4Click(Sender: TObject);
begin
  if BitBtn3.Enabled = false then BitBtn3.Enabled := true;
  ComboBox1.Enabled := CheckBox4.Checked;
end;

procedure Tlayer_control.BitBtn3Click(Sender: TObject);
var
  i: integer;
  inifile:TInifile;
begin
  inifile:=TInifile.Create(ExePath+'Config.ini');
  try
      for i := ListBox1.Count - 1 downto 0 do
      begin
        with mylayer_property[i] do
        begin
          if Layer.IsVisible <> layer_visible then Layer.SetVisible(layer_visible); {=  mylayer_property[i].Layer.SetVisible(mylayer_property[i].layer_visible)}
          if Layer.IsSelected <> layer_selected then Layer.SetSelected(layer_selected);
          if Layer.IsMetaIgnore <> layer_MetaIgnore then Layer.SetMetaIgnore(layer_MetaIgnore);
          if Layer.IsShowLabel <> layer_ShowLabel then Layer.SetShowLabel(layer_ShowLabel);
          if Layer.GetlabelValue <> layer_labelValue then
          begin
            Layer.SetLabelValue(layer_labelValue);
            Layer.ClearLabelText;
          end;
          if Layer.IsLayerIgnore <> layer_LayerIgnore then Layer.SetLayerIgnore(layer_LayerIgnore);
          if Layer.GetLayerMinScale <> layer_MinScale then Layer.SetLayerMinScale(layer_MinScale);
          if Layer.GetLayerMaxScale <> layer_MaxScale then Layer.SetLayerMaxScale(layer_MaxScale);
          if(Layer.GetLayerFont.Name<>MapFont.Name)or
            (Layer.GetLayerFont.Size<>MapFont.Size)or
            (Layer.GetLayerFont.Color<>MapFont.Color)  then
             Layer.SetLayerFont(MapFont);


          FMap.SetZOrder(layer_id);
        end;
        if (mylayer_property[i].layer_name='县')or
           (mylayer_property[i].layer_name='市')or
           (mylayer_property[i].layer_name='省') then
        begin
            inifile.WriteString(mylayer_property[i].layer_name,'FontName',mylayer_property[i].MapFont.Name);
            inifile.WriteInteger(mylayer_property[i].layer_name,'FontSize',mylayer_property[i].MapFont.Size);
            inifile.WriteInteger(mylayer_property[i].layer_name,'FontColor',mylayer_property[i].MapFont.Color);
        end;
      end;
  finally
     inifile.Free;
     ModalResult := mrok;

  end;
end;

procedure Tlayer_control.BitBtn4Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tlayer_control.InitMap(AMap: Imap);
var i, j: integer;
  dfcount: integer;
begin
  FMap := AMap;
  layercount := FMap.GetLayerCount; //地图的图层　数量

  SetLength(mylayer_property, layercount);
  for i := 0 to layercount - 1 do
  begin
    mylayer_property[i].Layer := FMap.GetLayer(i);
    mylayer_property[i].layer_name := mylayer_property[i].Layer.GetName;
    mylayer_property[i].layer_file := mylayer_property[i].Layer.GetFileName;
    mylayer_property[i].layer_id := mylayer_property[i].Layer.GetId;
    mylayer_property[i].layer_visible := mylayer_property[i].Layer.IsVisible;
    mylayer_property[i].layer_selected := mylayer_property[i].Layer.IsSelected;
    mylayer_property[i].layer_MetaIgnore := mylayer_property[i].Layer.IsMetaIgnore;
    mylayer_property[i].layer_ShowLabel := mylayer_property[i].Layer.IsShowLabel;
    mylayer_property[i].layer_labelValue := mylayer_property[i].Layer.GetlabelValue;
    mylayer_property[i].layer_LayerIgnore := mylayer_property[i].Layer.IsLayerIgnore;
    mylayer_property[i].layer_MinScale := mylayer_property[i].Layer.GetLayerMinScale;
    mylayer_property[i].layer_MaxScale := mylayer_property[i].Layer.GetLayerMaxScale;
    mylayer_property[i].MapFont:=mylayer_property[i].Layer.GetLayerFont;
    //dfcount := mylayer_property[i].Layer.GetDataFieldCount; //字段数量
    //mylayer_property[i].layer_datafields := TStringList.Create;
   { for j := 0 to dfcount - 1 do //取出所有字段
    begin
      if lowercase(mylayer_property[i].Layer.GetDataFieldName(j)) = 'recid' then continue; //去掉RecID字段
      mylayer_property[i].layer_datafields.Add(mylayer_property[i].Layer.GetDataFieldName(j));
    end; }
    ListBox1.Items.Add(mylayer_property[i].layer_name);
  end;

  sel_index := -1;

  if layercount > 0 then
  begin
    sel_index := 0; // 默认为　选中　列表的第一行
    ListBox1.ItemIndex := sel_index;
    ListBox1Click(ListBox1);
  end
  else
  begin
    ComboBox1.Text := '';
    Edit1.Text := '';
    Edit2.Text := '';
  end;

  BitBtn3.Enabled := false;
end;

procedure Tlayer_control.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to length(mylayer_property) - 1 do
  begin
    mylayer_property[i].layer_datafields.Free;
  end;
end;

procedure Tlayer_control.ComboBox1Change(Sender: TObject);
begin
  if BitBtn3.Enabled = false then BitBtn3.Enabled := true;
end;

procedure Tlayer_control.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, '.']) then Key := #0;
end;

procedure Tlayer_control.FormCreate(Sender: TObject);
begin
  EditFont.Clear;
end;

procedure Tlayer_control.BitBtnFontClick(Sender: TObject);
var
  mapfont:TMapFont;
begin
  FontDialog1.Font.Name:= mylayer_property[sel_index].MapFont.Name;
  FontDialog1.Font.Size:=mylayer_property[sel_index].MapFont.Size;
  FontDialog1.Font.Color:=mylayer_property[sel_index].MapFont.Color;
  if FontDialog1.Execute  then
  begin
     mapfont.Name:=FontDialog1.Font.Name;
     mapfont.Size:=FontDialog1.Font.Size;
     mapfont.Color:=FontDialog1.Font.Color;
     EditFont.Text:=FontDialog1.Font.Name+','+IntToStr(FontDialog1.Font.Size)+','+IntToStr(FontDialog1.Font.Color);
     Shape_Color.Brush.Color:=FontDialog1.Font.Color;
     mylayer_property[sel_index].MapFont:=mapfont;
  end;
end;

end.
