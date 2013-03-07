object frmDriverBlacklist: TfrmDriverBlacklist
  Left = 167
  Top = 177
  Width = 1063
  Height = 567
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21496#26426#40657#21517#21333
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 203
    Height = 540
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 0
    object PageControl2: TPageControl
      Left = 1
      Top = 1
      Width = 201
      Height = 538
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #36710#36742
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 193
          Height = 477
          Align = alClient
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Indent = 19
          ParentFont = False
          ReadOnly = True
          SortType = stText
          TabOrder = 0
          OnClick = TreeView1Click
        end
        object PanelSelectGroupName: TPanel
          Left = 0
          Top = 477
          Width = 193
          Height = 33
          Align = alBottom
          BevelInner = bvLowered
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 203
    Top = 0
    Width = 8
    Height = 540
    HotZoneClassName = 'TcxSimpleStyle'
    Control = Panel7
  end
  object PageControl1: TPageControl
    Left = 211
    Top = 0
    Width = 844
    Height = 540
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #21496#26426#40657#21517#21333
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 512
        Align = alClient
        BevelOuter = bvLowered
        DragKind = dkDock
        TabOrder = 0
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 834
          Height = 72
          Align = alTop
          TabOrder = 0
          object Label1: TLabel
            Left = 618
            Top = 33
            Width = 36
            Height = 13
            Caption = #20844#21496#65306
            Visible = False
          end
          object Label2: TLabel
            Left = 65
            Top = 33
            Width = 36
            Height = 13
            Caption = #21496#26426#65306
          end
          object btnSetBlacklist: TSpeedButton
            Left = 323
            Top = 27
            Width = 93
            Height = 24
            Caption = #35774#20026#40657#21517#21333
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
              333333333F777773FF333333008888800333333377333F3773F3333077870787
              7033333733337F33373F3308888707888803337F33337F33337F330777880887
              7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
              7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
              00333337777777777733333308033308033333337F7F337F7F33333308033308
              033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
              7333333373F77733733333333088888033333333373FFFF73333333333000003
              3333333333777773333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btnSetBlacklistClick
          end
          object btnDisBlacklist: TSpeedButton
            Left = 418
            Top = 27
            Width = 93
            Height = 24
            Caption = #35299#38500#40657#21517#21333
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
              333333333F777773FF333333008888800333333377333F3773F3333077870787
              7033333733337F33373F3308888707888803337F33337F33337F330777880887
              7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
              7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
              0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
              03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
              033333337F73FF737F33B33B778000877333333373F777337333333B30888880
              33333333373FFFF73333333B3300000333333333337777733333}
            NumGlyphs = 2
            OnClick = btnDisBlacklistClick
          end
          object SpeedButton4: TSpeedButton
            Left = 513
            Top = 27
            Width = 73
            Height = 24
            Caption = #36864#20986
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777700777777
              77777770E07777777777770EE0777777777700EEE0000000000070EEE0888077
              777770EEE0888077777770EEE0888077777770EEE0888077777770EEE0888077
              707770EEE0888077007770EEE0888070000070EEE0888077007770EEE0888077
              707770EE08888077777770E08888807777777000000000777777}
            OnClick = SpeedButton4Click
          end
          object cbbGroup: TComboBox
            Left = 656
            Top = 29
            Width = 104
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Visible = False
            OnChange = cbbGroupChange
          end
          object cbbDriver: TComboBox
            Left = 102
            Top = 29
            Width = 104
            Height = 21
            ItemHeight = 13
            TabOrder = 1
          end
          object btnQuery: TBitBtn
            Left = 248
            Top = 27
            Width = 73
            Height = 24
            Caption = #26597#35810
            TabOrder = 2
            OnClick = btnQueryClick
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
        end
        object Panel3: TPanel
          Left = 1
          Top = 81
          Width = 834
          Height = 430
          Align = alClient
          TabOrder = 1
          object grdBlacklist: TDBGrid
            Left = 1
            Top = 1
            Width = 832
            Height = 428
            Align = alClient
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = grdBlacklistCellClick
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'driver_no'
                Title.Alignment = taCenter
                Title.Caption = #21496#26426#24037#21495
                Width = 85
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'driver_name'
                Title.Alignment = taCenter
                Title.Caption = #21496#26426#22995#21517
                Width = 85
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'car_no'
                Title.Alignment = taCenter
                Title.Caption = #36710#29260#21495
                Width = 85
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'driver_kindStr'
                Title.Alignment = taCenter
                Title.Caption = #20027#21103#39550
                Width = 85
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'group_name'
                Title.Alignment = taCenter
                Title.Caption = #25152#23646#21333#20301
                Width = 85
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'IsBlackStr'
                Title.Alignment = taCenter
                Title.Caption = #26159#21542#40657#21517#21333
                Width = 85
                Visible = True
              end>
          end
        end
        object cxSplitter2: TcxSplitter
          Left = 1
          Top = 73
          Width = 834
          Height = 8
          Cursor = crVSplit
          HotZoneClassName = 'TcxSimpleStyle'
          HotZone.SizePercent = 31
          AlignSplitter = salTop
          AutoSnap = True
          MinSize = 22
          ResizeUpdate = True
          Control = Panel2
        end
      end
    end
  end
  object ds1: TDataSource
    Left = 233
    Top = 195
  end
end
