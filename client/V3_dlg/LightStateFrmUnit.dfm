object LightStateFrm: TLightStateFrm
  Left = 326
  Top = 281
  Width = 928
  Height = 242
  Caption = #35774#22791#29366#24577
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 920
    Height = 208
    ActivePage = TabSheet6
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #39030#28783
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 912
        Height = 187
        Align = alClient
        BevelOuter = bvNone
        Caption = #183
        TabOrder = 0
        object Panel2: TPanel
          Left = 806
          Top = 0
          Width = 106
          Height = 187
          Align = alRight
          TabOrder = 0
          object BitBtn_List100: TBitBtn
            Left = 10
            Top = 80
            Width = 90
            Height = 25
            Caption = #21482#21015#26368#36817'10'#26465
            TabOrder = 0
            OnClick = BitBtn_List100Click
          end
          object BitBtn_Clr: TBitBtn
            Left = 10
            Top = 40
            Width = 90
            Height = 25
            Caption = #20840#37096#28165#31354
            TabOrder = 1
            OnClick = BitBtn_ClrClick
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F0000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000777778888888880007770000777777888888809B9077
              000077777777788809B9B90700007777777777700B9B9B07000077777777770F
              F0B9B90700007777777770F8FF0B907700007777777708FF8FF0077700007777
              7770FF8FF8F0777700007777770B0FF8FF0777770000777770BBB0FF80777777
              000077777BBB0B0F07777777000077777BB0BBB077777777000077777B0BBB07
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000}
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 806
          Height = 187
          Align = alClient
          TabOrder = 1
          object EventListView: TListView
            Left = 1
            Top = 1
            Width = 804
            Height = 185
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 80
              end
              item
                Caption = #36710#29260#21495
                Width = 80
              end
              item
                Caption = #35774#22791#32534#21495
                Width = 80
              end
              item
                Caption = #30828#20214#29256#26412
                Width = 70
              end
              item
                Caption = #36719#20214#29256#26412
                Width = 70
              end
              item
                Caption = #35774#22791#29366#24577
                Width = 190
              end
              item
                Caption = #26174#31034#29366#24577
                Width = 200
              end
              item
                Caption = #27169#24335
                Width = 100
              end
              item
                Caption = #25509#25910#26102#38388
                Width = 149
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
            OnColumnClick = EventListViewColumnClick
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'LED'
      ImageIndex = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 912
        Height = 180
        Align = alClient
        BevelOuter = bvNone
        Caption = #183
        TabOrder = 0
        object Panel5: TPanel
          Left = 806
          Top = 0
          Width = 106
          Height = 180
          Align = alRight
          TabOrder = 0
          object BitBtn1: TBitBtn
            Left = 10
            Top = 80
            Width = 90
            Height = 25
            Caption = #21482#21015#26368#36817'10'#26465
            TabOrder = 0
            OnClick = BitBtn1Click
          end
          object BitBtn2: TBitBtn
            Left = 10
            Top = 40
            Width = 90
            Height = 25
            Caption = #20840#37096#28165#31354
            TabOrder = 1
            OnClick = BitBtn2Click
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F0000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000777778888888880007770000777777888888809B9077
              000077777777788809B9B90700007777777777700B9B9B07000077777777770F
              F0B9B90700007777777770F8FF0B907700007777777708FF8FF0077700007777
              7770FF8FF8F0777700007777770B0FF8FF0777770000777770BBB0FF80777777
              000077777BBB0B0F07777777000077777BB0BBB077777777000077777B0BBB07
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000}
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 806
          Height = 180
          Align = alClient
          TabOrder = 1
          object LEDListView: TListView
            Left = 1
            Top = 1
            Width = 804
            Height = 178
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 80
              end
              item
                Caption = #36710#29260#21495
                Width = 80
              end
              item
                Caption = #35774#22791#32534#21495
                Width = 80
              end
              item
                Caption = #30828#20214#29256#26412
                Width = 70
              end
              item
                Caption = #36719#20214#29256#26412
                Width = 70
              end
              item
                Caption = #23631#31867#22411
                Width = 100
              end
              item
                Caption = #36816#34892#29366#24577
                Width = 200
              end
              item
                Caption = #24320#20851#29366#24577
                Width = 100
              end
              item
                Caption = #25509#25910#26102#38388
                Width = 149
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
            OnColumnClick = LEDListViewColumnClick
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'LCD'
      ImageIndex = 2
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 912
        Height = 180
        Align = alClient
        BevelOuter = bvNone
        Caption = #183
        TabOrder = 0
        object Panel8: TPanel
          Left = 806
          Top = 0
          Width = 106
          Height = 180
          Align = alRight
          TabOrder = 0
          object BitBtn3: TBitBtn
            Left = 10
            Top = 80
            Width = 90
            Height = 25
            Caption = #21482#21015#26368#36817'10'#26465
            TabOrder = 0
            OnClick = BitBtn3Click
          end
          object BitBtn4: TBitBtn
            Left = 10
            Top = 40
            Width = 90
            Height = 25
            Caption = #20840#37096#28165#31354
            TabOrder = 1
            OnClick = BitBtn4Click
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F0000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000777778888888880007770000777777888888809B9077
              000077777777788809B9B90700007777777777700B9B9B07000077777777770F
              F0B9B90700007777777770F8FF0B907700007777777708FF8FF0077700007777
              7770FF8FF8F0777700007777770B0FF8FF0777770000777770BBB0FF80777777
              000077777BBB0B0F07777777000077777BB0BBB077777777000077777B0BBB07
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000}
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 806
          Height = 180
          Align = alClient
          TabOrder = 1
          object LCDListView: TListView
            Left = 1
            Top = 1
            Width = 804
            Height = 178
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 80
              end
              item
                Caption = #36710#29260#21495
                Width = 80
              end
              item
                Caption = #35774#22791#32534#21495
                Width = 80
              end
              item
                Caption = #30828#20214#29256#26412
                Width = 70
              end
              item
                Caption = #36719#20214#29256#26412
                Width = 70
              end
              item
                Caption = #36816#34892#29366#24577
                Width = 200
              end
              item
                Caption = #24320#20851#29366#24577
                Width = 100
              end
              item
                Caption = #25509#25910#26102#38388
                Width = 149
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
            OnColumnClick = LCDListViewColumnClick
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TSM'
      ImageIndex = 3
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 912
        Height = 180
        Align = alClient
        BevelOuter = bvNone
        Caption = #183
        TabOrder = 0
        object Panel11: TPanel
          Left = 806
          Top = 0
          Width = 106
          Height = 180
          Align = alRight
          TabOrder = 0
          object BitBtn5: TBitBtn
            Left = 10
            Top = 80
            Width = 90
            Height = 25
            Caption = #21482#21015#26368#36817'10'#26465
            TabOrder = 0
            OnClick = BitBtn5Click
          end
          object BitBtn6: TBitBtn
            Left = 10
            Top = 40
            Width = 90
            Height = 25
            Caption = #20840#37096#28165#31354
            TabOrder = 1
            OnClick = BitBtn6Click
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F0000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000777778888888880007770000777777888888809B9077
              000077777777788809B9B90700007777777777700B9B9B07000077777777770F
              F0B9B90700007777777770F8FF0B907700007777777708FF8FF0077700007777
              7770FF8FF8F0777700007777770B0FF8FF0777770000777770BBB0FF80777777
              000077777BBB0B0F07777777000077777BB0BBB077777777000077777B0BBB07
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000}
          end
        end
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 806
          Height = 180
          Align = alClient
          TabOrder = 1
          object TSMListView: TListView
            Left = 1
            Top = 1
            Width = 804
            Height = 178
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 80
              end
              item
                Caption = #36710#29260#21495
                Width = 80
              end
              item
                Caption = #35774#22791#32534#21495
                Width = 80
              end
              item
                Caption = #30828#20214#29256#26412
                Width = 70
              end
              item
                Caption = #36719#20214#29256#26412
                Width = 70
              end
              item
                Caption = #29366#24577
                Width = 200
              end
              item
                Caption = #25509#25910#26102#38388
                Width = 149
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
            OnColumnClick = TSMListViewColumnClick
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #35745#20215#22120
      ImageIndex = 4
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 912
        Height = 180
        Align = alClient
        BevelOuter = bvNone
        Caption = #183
        TabOrder = 0
        object Panel14: TPanel
          Left = 806
          Top = 0
          Width = 106
          Height = 180
          Align = alRight
          TabOrder = 0
          object BitBtn7: TBitBtn
            Left = 10
            Top = 80
            Width = 90
            Height = 25
            Caption = #21482#21015#26368#36817'10'#26465
            TabOrder = 0
            OnClick = BitBtn7Click
          end
          object BitBtn8: TBitBtn
            Left = 10
            Top = 40
            Width = 90
            Height = 25
            Caption = #20840#37096#28165#31354
            TabOrder = 1
            OnClick = BitBtn8Click
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F0000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000777778888888880007770000777777888888809B9077
              000077777777788809B9B90700007777777777700B9B9B07000077777777770F
              F0B9B90700007777777770F8FF0B907700007777777708FF8FF0077700007777
              7770FF8FF8F0777700007777770B0FF8FF0777770000777770BBB0FF80777777
              000077777BBB0B0F07777777000077777BB0BBB077777777000077777B0BBB07
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000}
          end
        end
        object Panel15: TPanel
          Left = 0
          Top = 0
          Width = 806
          Height = 180
          Align = alClient
          TabOrder = 1
          object metersListView: TListView
            Left = 1
            Top = 1
            Width = 804
            Height = 178
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 80
              end
              item
                Caption = #36710#29260#21495
                Width = 80
              end
              item
                Caption = #35774#22791#32534#21495
                Width = 80
              end
              item
                Caption = #30828#20214#29256#26412
                Width = 70
              end
              item
                Caption = #36719#20214#29256#26412
                Width = 70
              end
              item
                Caption = #36816#34892#29366#24577
                Width = 200
              end
              item
                Caption = #24037#20316#29366#24577
                Width = 200
              end
              item
                Caption = #25509#25910#26102#38388
                Width = 149
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
            OnColumnClick = metersListViewColumnClick
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'MCU'
      ImageIndex = 5
      object Panel16: TPanel
        Left = 0
        Top = 0
        Width = 912
        Height = 180
        Align = alClient
        BevelOuter = bvNone
        Caption = #183
        TabOrder = 0
        object Panel17: TPanel
          Left = 806
          Top = 0
          Width = 106
          Height = 180
          Align = alRight
          TabOrder = 0
          object BitBtn9: TBitBtn
            Left = 10
            Top = 80
            Width = 90
            Height = 25
            Caption = #21482#21015#26368#36817'10'#26465
            TabOrder = 0
            OnClick = BitBtn9Click
          end
          object BitBtn10: TBitBtn
            Left = 10
            Top = 40
            Width = 90
            Height = 25
            Caption = #20840#37096#28165#31354
            TabOrder = 1
            OnClick = BitBtn10Click
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F0000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000777778888888880007770000777777888888809B9077
              000077777777788809B9B90700007777777777700B9B9B07000077777777770F
              F0B9B90700007777777770F8FF0B907700007777777708FF8FF0077700007777
              7770FF8FF8F0777700007777770B0FF8FF0777770000777770BBB0FF80777777
              000077777BBB0B0F07777777000077777BB0BBB077777777000077777B0BBB07
              7777777700007777777777777777777700007777777777777777777700007777
              77777777777777770000}
          end
        end
        object Panel18: TPanel
          Left = 0
          Top = 0
          Width = 806
          Height = 180
          Align = alClient
          TabOrder = 1
          object MCUListView: TListView
            Left = 1
            Top = 1
            Width = 804
            Height = 178
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 80
              end
              item
                Caption = #36710#29260#21495
                Width = 80
              end
              item
                Caption = #30828#20214#29256#26412
                Width = 70
              end
              item
                Caption = #36719#20214#29256#26412
                Width = 70
              end
              item
                Caption = #25509#25910#26102#38388
                Width = 149
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
            OnColumnClick = MCUListViewColumnClick
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #24033#26816#20449#24687
      ImageIndex = 6
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 289
        Height = 180
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object PollingListView: TListView
          Left = 0
          Top = 0
          Width = 289
          Height = 180
          Align = alClient
          Columns = <
            item
              Caption = 'ID'
              Width = 80
            end
            item
              Caption = #36710#29260#21495
              Width = 80
            end
            item
              Caption = #24033#26816#26102#38388
              Width = 124
            end
            item
              Caption = #29366#24577
              Width = 0
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          PopupMenu = PopupMenu1
          TabOrder = 0
          ViewStyle = vsReport
          OnChange = PollingListViewChange
          OnClick = PollingListViewClick
          OnColumnClick = PollingListViewColumnClick
        end
      end
      object Panel20: TPanel
        Left = 289
        Top = 0
        Width = 623
        Height = 180
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 40
          Top = 72
          Width = 32
          Height = 13
          Caption = 'Label2'
        end
        object Memo1: TMemo
          Left = 0
          Top = 17
          Width = 623
          Height = 163
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Panel21: TPanel
          Left = 0
          Top = 0
          Width = 623
          Height = 17
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 0
            Top = 0
            Width = 60
            Height = 13
            Align = alLeft
            Caption = #35774#22791#24635#25968#65306
            Transparent = True
          end
          object Label3: TLabel
            Left = 70
            Top = 0
            Width = 3
            Height = 13
            Align = alClient
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 92
    Top = 64
    object N1: TMenuItem
      Caption = #20840#37096#28165#31354
      OnClick = N1Click
    end
    object N101: TMenuItem
      Caption = #21482#21015#26368#36817'10'#26465
      OnClick = N101Click
    end
  end
end
