object AnswerListFrm: TAnswerListFrm
  Left = 282
  Top = 361
  Width = 928
  Height = 208
  Caption = #31572#26696#21015#34920
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 174
    Align = alClient
    BevelOuter = bvNone
    Caption = #31572#26696#31867#34920
    DragKind = dkDock
    TabOrder = 0
    object Panel2: TPanel
      Left = 814
      Top = 0
      Width = 106
      Height = 174
      Align = alRight
      Color = 16382438
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
      Width = 814
      Height = 174
      Align = alClient
      TabOrder = 1
      object EventListView: TListView
        Left = 1
        Top = 1
        Width = 812
        Height = 172
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
          end
          item
            Caption = #36710#29260#21495
            Width = 80
          end
          item
            Caption = #38382#39064
            Width = 300
          end
          item
            Caption = #31572#26696
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
      end
    end
  end
end
