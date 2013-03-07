object QueryRundataFrm: TQueryRundataFrm
  Left = 223
  Top = 213
  Width = 928
  Height = 480
  Caption = #26597#30475#33829#36816#25968#25454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 453
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 188
      Height = 453
      Align = alLeft
      BevelOuter = bvLowered
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object PageControl2: TPageControl
        Left = 1
        Top = 1
        Width = 186
        Height = 451
        ActivePage = TabSheet3
        Align = alClient
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = #36710#36742#20998#32452
          object TreeView1: TTreeView
            Left = 0
            Top = 0
            Width = 178
            Height = 392
            Align = alClient
            Indent = 19
            ReadOnly = True
            TabOrder = 0
          end
          object Panel7: TPanel
            Left = 0
            Top = 392
            Width = 178
            Height = 31
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 188
      Top = 0
      Width = 732
      Height = 453
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 732
        Height = 58
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 103
          Top = 25
          Width = 36
          Height = 13
          Caption = #26102#38388#65306
        end
        object Label4: TLabel
          Left = 286
          Top = 25
          Width = 12
          Height = 13
          Caption = #33267
        end
        object SpeedButton2: TSpeedButton
          Left = 453
          Top = 19
          Width = 81
          Height = 24
          Caption = #30830#23450
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
        object SpeedButton3: TSpeedButton
          Left = 557
          Top = 20
          Width = 81
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
        end
        object DateTimePicker3: TDateTimePicker
          Left = 143
          Top = 21
          Width = 140
          Height = 21
          Date = 38699.757375960650000000
          Time = 38699.757375960650000000
          TabOrder = 0
        end
        object DateTimePicker4: TDateTimePicker
          Left = 303
          Top = 21
          Width = 140
          Height = 21
          Date = 38699.757375960650000000
          Time = 38699.757375960650000000
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 412
        Width = 732
        Height = 41
        Align = alBottom
        TabOrder = 1
      end
      object Panel5: TPanel
        Left = 0
        Top = 58
        Width = 732
        Height = 354
        Align = alClient
        TabOrder = 2
        object listView: TRzListView
          Left = 1
          Top = 1
          Width = 730
          Height = 352
          Align = alClient
          Columns = <
            item
              Caption = #24207#21495
            end
            item
              Caption = #21378#23478#32534#21495
              Width = 60
            end
            item
              Caption = #36710#26426#32534#21495
              Width = 60
            end
            item
              Caption = #36710#21495
              Width = 60
            end
            item
              Caption = #19978#36710#26102#38388
              Width = 100
            end
            item
              Caption = #19979#36710#26102#38388
              Width = 60
            end
            item
              Caption = #31561#24453#26102#38388
              Width = 60
            end
            item
              Caption = #35745#31243#37324#31243
              Width = 100
            end
            item
              Caption = #31354#39542#37324#31243
              Width = 60
            end
            item
              Caption = #33829#36816#37329#39069
              Width = 60
            end
            item
              Caption = #19968#21345#36890#21495
              Width = 40
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
  end
end
