object Select_Devs: TSelect_Devs
  Left = 156
  Top = 146
  BorderStyle = bsDialog
  Caption = #22238#25918'--'#20174#26381#21153#22120#36873#25321#22810#20010#36710#36742
  ClientHeight = 435
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 410
    Top = 35
    Height = 290
    Align = alRight
  end
  object Panel1: TPanel
    Left = 0
    Top = 35
    Width = 376
    Height = 290
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 172
      Top = 27
      Height = 262
      Align = alRight
    end
    object TreeView1: TTreeView
      Left = 1
      Top = 27
      Width = 171
      Height = 262
      Align = alClient
      Color = 13429499
      HideSelection = False
      Indent = 19
      ReadOnly = True
      RightClickSelect = True
      RowSelect = True
      TabOrder = 0
      OnClick = TreeView1Click
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 374
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      Caption = #24453#36873#25321#30340#36710#36742
      Font.Charset = GB2312_CHARSET
      Font.Color = 16512
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object FromList: TcxTreeList
      Left = 175
      Top = 27
      Width = 200
      Height = 262
      Align = alRight
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
        end>
      BufferedPaint = True
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      PopupMenu = PopupMenu_From
      StateImages = Mainf.ImageList1
      TabOrder = 2
      OnClick = FromListClick
      OnDblClick = AddSelectExecute
      OnFocusedNodeChanged = FromListFocusedNodeChanged
      object cxTreeListColumn1: TcxTreeListColumn
        Caption.Text = #35774#22791#21517#31216
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 77
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxTreeListColumn2: TcxTreeListColumn
        Caption.Text = #36710#29260#21495
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 77
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
      end
      object DevIdStr: TcxTreeListColumn
        Caption.Text = #35774#22791'ID'
        DataBinding.ValueType = 'String'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 413
    Top = 35
    Width = 200
    Height = 290
    Align = alRight
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 198
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      Caption = #36873#25321#30340#36710#36742
      Font.Charset = GB2312_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DestList: TcxTreeList
      Left = 1
      Top = 27
      Width = 198
      Height = 262
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
        end>
      BufferedPaint = True
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      PopupMenu = PopupMenu_Dest
      StateImages = Mainf.ImageList1
      TabOrder = 1
      OnClick = DestListClick
      OnDblClick = DeleteSelectExecute
      OnFocusedNodeChanged = DestListFocusedNodeChanged
      object DestDispLabel: TcxTreeListColumn
        Caption.Text = #35774#22791#21517#31216
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 75
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object DestCarNO: TcxTreeListColumn
        Caption.Text = #36710#29260#21495
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 74
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
      end
      object DestDevIDstr: TcxTreeListColumn
        Caption.Text = #35774#22791'ID'
        DataBinding.ValueType = 'String'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 376
    Top = 35
    Width = 34
    Height = 290
    Align = alRight
    BevelOuter = bvLowered
    TabOrder = 2
    object BitBtn_AddSelect: TBitBtn
      Left = 2
      Top = 65
      Width = 30
      Height = 30
      Action = AddSelect
      Caption = '>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object BitBtn_AddAllList: TBitBtn
      Left = 2
      Top = 105
      Width = 30
      Height = 30
      Action = AddAll
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 225
      Width = 30
      Height = 30
      Action = DeleteAll
      Caption = '<<'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 2
      Top = 185
      Width = 30
      Height = 30
      Action = DeleteSelect
      Caption = '<'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 399
    Width = 613
    Height = 36
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 3
    object BitBtn_ok: TBitBtn
      Left = 414
      Top = 7
      Width = 86
      Height = 25
      Caption = #30830#23450
      Default = True
      TabOrder = 0
      OnClick = BitBtn_okClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC000000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888800000008888008888888888800000008880220888888888800000008802
        2220888888888000000088222222088888888000000080222222208888888000
        0000822222222208888880000000822228B222208888800000008222288B2222
        0888800000008B222888B22220888000000088B228888B22220880000000888B
        B88888B222208000000088888888888B222200000000888888888888B2222000
        00008888888888888B222000000088888888888888B220000000888888888888
        888880000000}
    end
    object BitBtn_Cancel: TBitBtn
      Left = 500
      Top = 7
      Width = 86
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 35
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #36873#25321#22810#20010#36710#36742
    Color = 15792327
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Panel8: TPanel
    Left = 0
    Top = 366
    Width = 613
    Height = 33
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 5
    object LabelTjTimeSet: TLabel
      Left = 25
      Top = 13
      Width = 65
      Height = 13
      Caption = #22238#25918#26102#38388#27573
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 317
      Top = 13
      Width = 14
      Height = 13
      Caption = '--'
    end
    object start_date: TDateTimePicker
      Left = 119
      Top = 8
      Width = 101
      Height = 21
      Date = 38122.587985601850000000
      Time = 38122.587985601850000000
      TabOrder = 0
    end
    object start_time: TDateTimePicker
      Left = 219
      Top = 8
      Width = 85
      Height = 21
      Date = 38122.000000000000000000
      Time = 38122.000000000000000000
      Kind = dtkTime
      TabOrder = 1
    end
    object end_date: TDateTimePicker
      Left = 343
      Top = 8
      Width = 101
      Height = 21
      Date = 38122.587985601850000000
      Time = 38122.587985601850000000
      TabOrder = 2
    end
    object end_time: TDateTimePicker
      Left = 443
      Top = 8
      Width = 88
      Height = 21
      Date = 38122.999988425930000000
      Time = 38122.999988425930000000
      Kind = dtkTime
      TabOrder = 3
    end
  end
  object PanelYf: TPanel
    Left = 0
    Top = 325
    Width = 613
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
    object Label1: TLabel
      Left = 216
      Top = 12
      Width = 91
      Height = 26
      Caption = #24180#12288#12288#12288#12288#12288#26376#13#12288
    end
    object ComboBoxYear: TComboBox
      Left = 132
      Top = 8
      Width = 82
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBoxYear'
    end
    object ComboBoxMonth: TComboBox
      Left = 238
      Top = 8
      Width = 49
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '1'
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
    end
    object CheckBoxYf: TCheckBox
      Left = 40
      Top = 11
      Width = 88
      Height = 17
      Caption = #32479#35745#26376#20221#65306
      TabOrder = 2
    end
  end
  object ActionList1: TActionList
    Left = 104
    Top = 153
    object AddSelect: TAction
      Caption = '>'
      Hint = #28155#21152#36873#25321#36710#36742
      OnExecute = AddSelectExecute
    end
    object AddAll: TAction
      Caption = '>>'
      Hint = #28155#21152#25152#26377#36710#36742
      OnExecute = AddAllExecute
    end
    object DeleteSelect: TAction
      Caption = #21024#38500#25152#36873
      Hint = #21024#38500#36873#23450#36710#36742
      OnExecute = DeleteSelectExecute
    end
    object DeleteAll: TAction
      Caption = #21024#38500#20840#37096
      Hint = #21024#38500#20840#37096#36710#36742
      OnExecute = DeleteAllExecute
    end
    object ListAllDev: TAction
      Caption = 'ListAllDev'
      OnExecute = ListAllDevExecute
    end
  end
  object PopupMenu_Dest: TPopupMenu
    Left = 166
    Top = 137
    object N1: TMenuItem
      Action = DeleteSelect
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = DeleteAll
    end
  end
  object PopupMenu_From: TPopupMenu
    Left = 200
    Top = 137
    object N4: TMenuItem
      Action = AddSelect
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Action = AddAll
    end
  end
end
