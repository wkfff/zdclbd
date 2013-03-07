object FormClxxQry: TFormClxxQry
  Left = 496
  Top = 187
  BorderStyle = bsDialog
  Caption = #36710#36742#20449#24687#26597#35810
  ClientHeight = 251
  ClientWidth = 217
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 221
    Width = 217
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object BitBtnClose: TBitBtn
      Left = 128
      Top = 4
      Width = 72
      Height = 23
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
      OnClick = BitBtnCloseClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 26
    Width = 217
    Height = 195
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object ClxxValueListEditor: TValueListEditor
      Left = 0
      Top = 0
      Width = 217
      Height = 195
      Align = alClient
      DefaultRowHeight = 16
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
      Strings.Strings = (
        #36710#29260#21495'='
        #35774#22791#21517#31216'='
        'SIM'#21345#21495'='
        #21496#26426#22995#21517'='
        #20998#32452'='
        #35774#22791'ID='
        #22791#27880'=')
      TabOrder = 0
      TitleCaptions.Strings = (
        #21517#31216
        #23646#24615)
      ColWidths = (
        58
        153)
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 217
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object ComboBox1: TComboBox
      Left = 0
      Top = 3
      Width = 68
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #36710#29260#21495
      OnChange = ComboBox1Change
      Items.Strings = (
        #36710#29260#21495
        'SIM'#21345#21495)
    end
    object ComboBox2: TComboBox
      Left = 68
      Top = 3
      Width = 104
      Height = 21
      DropDownCount = 10
      ItemHeight = 13
      MaxLength = 15
      Sorted = True
      TabOrder = 1
      Text = 'ComboBox2'
      OnDropDown = ComboBox2DropDown
    end
    object BitBtnQry: TBitBtn
      Left = 172
      Top = 2
      Width = 44
      Height = 23
      Caption = #26597#35810
      Default = True
      TabOrder = 2
      OnClick = BitBtnQryClick
    end
  end
end
