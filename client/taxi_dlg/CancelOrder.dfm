object frmCancelOrder: TfrmCancelOrder
  Left = 69
  Top = 156
  Width = 1177
  Height = 550
  Caption = #21462#28040#35746#21333
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
    Height = 516
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 0
    object PageControl2: TPageControl
      Left = 1
      Top = 1
      Width = 201
      Height = 514
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #36710#36742
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 193
          Height = 453
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
          Top = 453
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
  object PageControl1: TPageControl
    Left = 211
    Top = 0
    Width = 958
    Height = 516
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #21462#28040#35746#21333
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 950
        Height = 488
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 948
          Height = 88
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          object Panel6: TPanel
            Left = 2
            Top = 2
            Width = 944
            Height = 84
            Align = alClient
            BevelOuter = bvSpace
            TabOrder = 0
            object Label1: TLabel
              Left = 40
              Top = 38
              Width = 60
              Height = 13
              Caption = #20056#23458#30005#35805#65306
            end
            object Label4: TLabel
              Left = 228
              Top = 38
              Width = 48
              Height = 13
              Caption = #36710#29260#21495#65306
            end
            object Label5: TLabel
              Left = 438
              Top = 38
              Width = 84
              Height = 13
              Caption = #35746#21333#21457#36865#26102#38388#65306
            end
            object SpeedButton4: TSpeedButton
              Left = 772
              Top = 32
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
            object edtPassengerPhone: TEdit
              Left = 103
              Top = 34
              Width = 118
              Height = 21
              MaxLength = 30
              TabOrder = 0
              OnExit = edtPassengerPhoneExit
              OnKeyPress = edtPassengerPhoneKeyPress
            end
            object dtpDate: TDateTimePicker
              Left = 524
              Top = 34
              Width = 86
              Height = 21
              Date = 40120.664777372680000000
              Time = 40120.664777372680000000
              TabOrder = 1
              OnKeyPress = dtpDateKeyPress
            end
            object dtpTime: TDateTimePicker
              Left = 609
              Top = 34
              Width = 70
              Height = 21
              Date = 40120.666105138890000000
              Time = 40120.666105138890000000
              Kind = dtkTime
              TabOrder = 2
              OnKeyPress = dtpTimeKeyPress
            end
            object btnFindOrderInfo: TBitBtn
              Left = 697
              Top = 32
              Width = 73
              Height = 24
              Caption = #26597#35810
              TabOrder = 3
              OnClick = btnFindOrderInfoClick
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
            object edtCarNo: TComboBox
              Left = 277
              Top = 34
              Width = 145
              Height = 21
              ItemHeight = 13
              TabOrder = 4
            end
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 97
          Width = 948
          Height = 349
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 1
          object Panel5: TPanel
            Left = 2
            Top = 2
            Width = 944
            Height = 345
            Align = alClient
            TabOrder = 0
            object Label7: TLabel
              Left = 1
              Top = 331
              Width = 942
              Height = 13
              Align = alBottom
              Caption = #24050#36873#20013#30340#24453#21462#28040#35746#21333#30340#35746#21333#21495#65306
            end
            object listViewOrderInfo: TListView
              Left = 1
              Top = 1
              Width = 942
              Height = 330
              Hint = #21452#20987#36873#20013#25110#21462#28040#36873#20013#35813#35746#21333
              Align = alClient
              Columns = <
                item
                  Caption = #24207#21495
                  Width = 40
                end
                item
                  Alignment = taCenter
                  Caption = #35746#21333#21495
                  Width = 100
                end
                item
                  Caption = #35746#21333#29366#24577
                  Width = 120
                end
                item
                  Alignment = taCenter
                  Caption = #20056#23458#30005#35805
                  Width = 100
                end
                item
                  Alignment = taCenter
                  Caption = #20056#23458#22995#21517
                  Width = 100
                end
                item
                  Alignment = taCenter
                  Caption = #25250#21333#25104#21151#36710#29260#21495
                  Width = 100
                end
                item
                  Alignment = taCenter
                  Caption = #35746#21333#21457#36865#26102#38388
                  Width = 120
                end
                item
                  Alignment = taCenter
                  Caption = #35746#21333#20869#23481
                  Width = 120
                end
                item
                  Alignment = taCenter
                  Caption = #35746#21333#35814#32454#20869#23481
                  Width = 150
                end>
              GridLines = True
              ReadOnly = True
              RowSelect = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ViewStyle = vsReport
              OnDblClick = listViewOrderInfoDblClick
            end
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 446
          Width = 948
          Height = 41
          Align = alBottom
          TabOrder = 2
          object btnOk: TBitBtn
            Left = 352
            Top = 8
            Width = 75
            Height = 25
            Caption = #30830#23450
            Default = True
            TabOrder = 0
            OnClick = btnOkClick
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
          object btnCancel: TBitBtn
            Left = 456
            Top = 8
            Width = 75
            Height = 25
            Caption = #21462#28040
            TabOrder = 1
            Kind = bkCancel
          end
        end
        object cxSplitter2: TcxSplitter
          Left = 1
          Top = 89
          Width = 948
          Height = 8
          Cursor = crVSplit
          HotZoneClassName = 'TcxSimpleStyle'
          HotZone.SizePercent = 31
          AlignSplitter = salTop
          AutoSnap = True
          MinSize = 22
          ResizeUpdate = True
          Control = Panel6
        end
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 203
    Top = 0
    Width = 8
    Height = 516
    HotZoneClassName = 'TcxSimpleStyle'
    Control = Panel7
  end
end
