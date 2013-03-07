object RcvDevUploadPicTimesInfoFrm: TRcvDevUploadPicTimesInfoFrm
  Left = 470
  Top = 281
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25910#21040#36710#26426#19978#20256#30340#29031#29255#26102#38388#33539#22260
  ClientHeight = 365
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 275
    Height = 324
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object cxTreeListRcvDevUploadPicTimesInfo: TcxTreeList
      Left = 1
      Top = 23
      Width = 273
      Height = 300
      Align = alClient
      Bands = <
        item
        end>
      BufferedPaint = False
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      TabOrder = 0
      object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
        Caption.Text = #39033#30446
        DataBinding.ValueType = 'String'
        Width = 139
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
        Caption.Text = #20869#23481
        DataBinding.ValueType = 'String'
        Width = 143
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 273
      Height = 22
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' '#36710#26426#19978#20256#30340#36710#26426#20869#23384#20648#30340#29031#29255#20449#24687#65306
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 283
    Top = 41
    Width = 343
    Height = 324
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 31
      Top = 16
      Width = 282
      Height = 245
      Caption = #35835#21462#36710#26426#23384#20648#30340#29031#29255
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 14
        Top = 37
        Width = 78
        Height = 13
        Caption = #35835#21462#26102#38388#28857#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 14
        Top = 146
        Width = 65
        Height = 13
        Caption = #35835#21462#31867#22411#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 14
        Top = 69
        Width = 130
        Height = 13
        Caption = #35201#27714#19978#20256#30340#29031#29255#24352#25968#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object DateTimePickerToDate: TDateTimePicker
        Left = 89
        Top = 33
        Width = 96
        Height = 21
        Date = 39832.728776909720000000
        Time = 39832.728776909720000000
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DateTimePickerToTime: TDateTimePicker
        Left = 184
        Top = 33
        Width = 80
        Height = 21
        Date = 39832.728796979170000000
        Time = 39832.728796979170000000
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Kind = dtkTime
        ParentFont = False
        TabOrder = 1
      end
      object ComboBoxReadType: TComboBox
        Left = 89
        Top = 142
        Width = 176
        Height = 19
        Style = csOwnerDrawFixed
        DropDownCount = 14
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        Items.Strings = (
          '0-'#24320#21069#38376
          '1-'#20851#21069#38376
          '2-'#24320#21518#38376
          '3-'#20851#21518#38376
          '4-'#20013#24515#20027#21160#35201#27714
          '5-'#21464#31354#36710
          '6-'#21464#37325#36710
          '7-'#32039#24613#25253#35686
          '8-'#22825#32447#20999#26029#25253#35686
          '9-'#36229#36895#25293#29031
          '10-'#30130#21171#25293#29031
          '11-'#19981#26126#21407#22240#25293#29031
          '12-'#19981#25351#23450#29031#29255#23646#24615)
      end
      object BitBtnReadThePic: TBitBtn
        Left = 53
        Top = 196
        Width = 89
        Height = 34
        Caption = #35835#21462
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BitBtnReadThePicClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000000
          0000000000007777770788888888800000007888870F77777777800000008FFF
          F80F77700777800000008F11F80F70000007800000008F11F80F777777778000
          00008FFFF80FFFFFFFFF7000000078888F0000000070000000008FFFF8FFFF87
          7717770000008F33F8F22F877111770000008F33F8F22F877717770000008FFF
          F8FFFF8777177700000078888F8888777717770000008FFFF8FFFF8777177700
          00008FDDF8FCCF111117770000008FDDF8FCCF877777770000008FFFF8FFFF87
          777777000000788887888877777777000000}
      end
      object BitBtn2: TBitBtn
        Left = 141
        Top = 196
        Width = 89
        Height = 34
        Cancel = True
        Caption = #36864#20986
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = BitBtn2Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
          F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
          000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
          338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
          45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
          3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
          F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
          000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
          338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
          4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
          8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
          333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
          0000}
        NumGlyphs = 2
      end
      object RadioButtonAllPic: TRadioButton
        Left = 77
        Top = 88
        Width = 159
        Height = 17
        Caption = #26102#38388#28857#20043#21069#30340#25152#26377#29031#29255
        Checked = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        TabStop = True
      end
      object RadioButtonOnePic: TRadioButton
        Left = 77
        Top = 109
        Width = 159
        Height = 17
        Caption = #26102#38388#28857#20043#21069#30340'1'#24352#29031#29255
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 10
      Top = 16
      Width = 52
      Height = 13
      Caption = #36710#29260#21495#65306
    end
    object LabelNoPic: TLabel
      Left = 280
      Top = 8
      Width = 63
      Height = 21
      Caption = #26080#29031#29255
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object EditCarNo: TEdit
      Left = 61
      Top = 11
      Width = 113
      Height = 21
      TabOrder = 0
      Text = 'EditCarNo'
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 275
    Top = 41
    Width = 8
    Height = 324
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 50
    Control = Panel1
  end
end
