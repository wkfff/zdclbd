object openfile: Topenfile
  Left = 240
  Top = 193
  BorderStyle = bsDialog
  Caption = #25171#24320'GPS'#25991#20214
  ClientHeight = 438
  ClientWidth = 634
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
  object Splitter1: TSplitter
    Left = 243
    Top = 0
    Width = 4
    Height = 419
    Beveled = True
  end
  object Panel2: TPanel
    Left = 247
    Top = 0
    Width = 387
    Height = 419
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 0
      Top = 161
      Width = 387
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object Panel3: TPanel
      Left = 0
      Top = 313
      Width = 387
      Height = 106
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 179
        Top = 74
        Width = 97
        Height = 26
        Caption = #30830#23450
        Default = True
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 275
        Top = 74
        Width = 97
        Height = 26
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
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 385
        Height = 66
        Align = alTop
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 4
          Width = 78
          Height = 13
          Caption = #36873#25321#26102#38388#27573#65306
        end
        object Label2: TLabel
          Left = 27
          Top = 23
          Width = 65
          Height = 13
          Caption = #24320#22987#26102#38388#65306
        end
        object Label3: TLabel
          Left = 27
          Top = 44
          Width = 65
          Height = 13
          Caption = #32467#26463#26102#38388#65306
        end
        object start_date: TDateTimePicker
          Left = 92
          Top = 16
          Width = 109
          Height = 21
          Date = 38128.628547453710000000
          Time = 38128.628547453710000000
          TabOrder = 0
          OnChange = start_dateChange
        end
        object start_time: TDateTimePicker
          Left = 203
          Top = 16
          Width = 95
          Height = 21
          Date = 38128.628547453710000000
          Time = 38128.628547453710000000
          Kind = dtkTime
          TabOrder = 1
          OnChange = start_timeChange
        end
        object end_time: TDateTimePicker
          Left = 203
          Top = 40
          Width = 95
          Height = 21
          Date = 38128.628547453710000000
          Time = 38128.628547453710000000
          Kind = dtkTime
          TabOrder = 2
          OnChange = end_timeChange
        end
        object end_date: TDateTimePicker
          Left = 92
          Top = 40
          Width = 109
          Height = 21
          Date = 38128.628547453710000000
          Time = 38128.628547453710000000
          TabOrder = 3
          OnChange = end_dateChange
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 165
      Width = 387
      Height = 148
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 1
      object Memo1: TMemo
        Left = 1
        Top = 20
        Width = 385
        Height = 127
        Align = alClient
        Lines.Strings = (
          'Memo1')
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 385
        Height = 19
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' '#25991#20214#20171#32461#65306
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 387
      Height = 161
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Panel4'
      TabOrder = 2
      object FileListBox1: TFileListBox
        Left = 1
        Top = 22
        Width = 385
        Height = 138
        Align = alClient
        ItemHeight = 16
        Mask = '*.gps'
        ShowGlyphs = True
        TabOrder = 0
        OnClick = FileListBox1Click
      end
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 385
        Height = 21
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' '#35831#36873#25321#25991#20214#65306
        TabOrder = 1
      end
    end
  end
  object ShellTreeView1: TShellTreeView
    Left = 0
    Top = 0
    Width = 243
    Height = 419
    ObjectTypes = [otFolders]
    Root = 'rfMyComputer'
    UseShellImages = True
    Align = alLeft
    AutoRefresh = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Indent = 19
    ParentColor = False
    ParentFont = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 1
    OnChange = ShellTreeView1Change
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 419
    Width = 634
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
end
