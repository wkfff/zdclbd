object FrmSelectDevs_Add2CArea: TFrmSelectDevs_Add2CArea
  Left = 360
  Top = 228
  BorderStyle = bsDialog
  Caption = #36873#25321#36710#36742
  ClientHeight = 401
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 380
    Top = 41
    Height = 317
    Align = alRight
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 346
    Height = 317
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 145
      Top = 1
      Height = 315
    end
    object TreeView1: TTreeView
      Left = 1
      Top = 1
      Width = 144
      Height = 315
      Align = alLeft
      Color = 13429499
      Indent = 19
      ReadOnly = True
      RightClickSelect = True
      RowSelect = True
      TabOrder = 0
      OnClick = TreeView1Click
    end
    object Panel8: TPanel
      Left = 148
      Top = 1
      Width = 197
      Height = 315
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Panel8'
      TabOrder = 1
      object Splitter3: TSplitter
        Left = 1
        Top = 209
        Width = 195
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        Color = 15792327
        ParentColor = False
      end
      object FromList: TcxTreeList
        Left = 1
        Top = 24
        Width = 195
        Height = 185
        Align = alClient
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #22522#26412#20449#24687
            Width = 69
          end>
        BufferedPaint = True
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu_From
        TabOrder = 0
        OnClick = FromListClick
        OnFocusedNodeChanged = FromListFocusedNodeChanged
        object cxTreeListColumn1: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 88
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 169
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
      end
      object cxHasCADevList: TcxTreeList
        Left = 1
        Top = 212
        Width = 195
        Height = 102
        Hint = #24050#25351#23450#21306#22495#30340#36710#36742','#19981#33021#36873#25321
        Align = alBottom
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #24050#25351#23450#21306#22495#30340#36710#36742
            Width = 29
          end>
        BufferedPaint = True
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsView.Bands = True
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        TabOrder = 1
        OnClick = FromListClick
        OnFocusedNodeChanged = FromListFocusedNodeChanged
        object HasCADev_Id: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 83
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object HasCADev_No: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 113
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object HasCADev_CAId: TcxTreeListColumn
          Caption.Text = #21306#22495'ID'
          DataBinding.ValueType = 'String'
          Width = 109
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 195
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        Caption = #21487#20197#28155#21152#30340#36710#36742
        Font.Charset = GB2312_CHARSET
        Font.Color = 16512
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 383
    Top = 41
    Width = 170
    Height = 317
    Align = alRight
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 168
      Height = 23
      Align = alTop
      BevelOuter = bvNone
      Caption = #23558#35201#28155#21152#30340#38480#23450#36710#36742#65306
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
      Top = 24
      Width = 168
      Height = 292
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
          Width = 63
        end>
      BufferedPaint = True
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      PopupMenu = PopupMenu_Dest
      TabOrder = 1
      OnClick = DestListClick
      OnFocusedNodeChanged = DestListFocusedNodeChanged
      object DestID: TcxTreeListColumn
        Visible = False
        Caption.Text = #35774#22791'ID'
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 82
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object DestCarNO: TcxTreeListColumn
        Caption.Text = #36710#29260#21495
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 163
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
      end
    end
  end
  object Panel3: TPanel
    Left = 346
    Top = 41
    Width = 34
    Height = 317
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
      Top = 103
      Width = 30
      Height = 30
      Action = AddAll
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 358
    Width = 553
    Height = 43
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 3
    object Label_CurArea: TLabel
      Left = 5
      Top = 16
      Width = 91
      Height = 13
      Caption = #24403#21069#21306#22495#21517#31216#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = 4227072
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BitBtn_ok: TBitBtn
      Left = 376
      Top = 9
      Width = 80
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
      Left = 455
      Top = 9
      Width = 80
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
    Width = 553
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #21521#24403#21069#21306#22495#20013#28155#21152#38480#23450#36710#36742
    Color = 15792327
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label_CurAreaType: TLabel
      Left = 4
      Top = 22
      Width = 65
      Height = 13
      Caption = #21306#22495#31867#22411#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object ComboBox_AreaType: TComboBox
      Left = 64
      Top = 18
      Width = 102
      Height = 20
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      ParentFont = False
      TabOrder = 0
      Text = 'ComboBox_AreaType'
      OnChange = ComboBox_AreaTypeChange
      Items.Strings = (
        #36710#36742#36234#30028#25253#35686
        #36710#36742#39542#20837#25253#35686
        #36710#36742#21306#22495#38480#36895)
    end
  end
  object ActionList1: TActionList
    Left = 272
    Top = 329
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
      Hint = #31227#38500#36873#23450#36710#36742
      OnExecute = DeleteSelectExecute
    end
    object DeleteAll: TAction
      Caption = #21024#38500#20840#37096
      Hint = #31227#38500#20840#37096#36710#36742
      OnExecute = DeleteAllExecute
    end
    object ListAllDev: TAction
      Caption = 'ListAllDev'
      OnExecute = ListAllDevExecute
    end
  end
  object PopupMenu_Dest: TPopupMenu
    Left = 422
    Top = 153
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
    Left = 304
    Top = 329
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
