inherited TjICCardTradeDataFrm: TTjICCardTradeDataFrm
  Left = 161
  Top = 183
  Caption = #21047#21345#20132#26131#32479#35745
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Left = 211
    Width = 802
    inherited PageControl1: TPageControl
      Width = 800
      inherited TabSheet1: TTabSheet
        inherited Panel2: TPanel
          Width = 792
          inherited Panel3: TPanel
            Width = 790
            inherited SpeedButtonOneTime: TSpeedButton
              Left = 707
              Top = 9
            end
            inherited SpeedButton3: TSpeedButton
              Left = 533
              Top = 25
            end
            inherited BitBtn2: TBitBtn
              Left = 681
              Top = 25
            end
            inherited BitBtn5: TBitBtn
              Left = 457
              Top = 25
              TabOrder = 8
            end
            object BitBtn1: TBitBtn
              Left = 607
              Top = 25
              Width = 73
              Height = 24
              Caption = 'Excel'
              TabOrder = 7
              OnClick = BitBtn1Click
              Glyph.Data = {
                A6020000424DA60200000000000036000000280000000F0000000D0000000100
                18000000000070020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E2E3A1CCAAA7CEACA7CD
                ACA5CEADCCE9D5000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFDEC8DA0043000AA634079E2F0BA634008508778772000000FFFFFF001200
                002F00002A00002D00003000002F00002A00004C0023BB4F22AD4B24B04F07A4
                2F1C441DFFFFFF000000FFFFFF1F4724008A13098D2507932C0D952E149D3300
                7F1631C35E2FC05C22B65314AE401A6326FFFFFFFFFFFF000000FFFFFFFFFFFF
                1F682A00841912932D11963400791838BA6546D57836C86D36C561002E00FFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF288C3908982E028A1F2EAE505B
                F1994FDB844DE489037A19008515DDE5DCFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFDEC8DA005100219F4280FFC061ECA065FCA80A87221DB7501EBD4F006B
                00D6DAD5FFFFFF000000FFFFFFFFFFFFFFFFFFDFD2DA00720EA8FFDF89F8B78F
                FFC91D993E007B0F003000002C00002D0008400FFFFFFF000000FFFFFFFFFFFF
                D2BFCF004500C5FFE8B6FFD5BCFFE14DB26425B35034CD67367F3FFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFF167B24A8FFD5D5FFE8F8FFFF96DCAA00
                8F2352E68F54DF8B27C157164A14FFFFFFFFFFFFFFFFFF000000FFFFFF0E5810
                74F2A6B9FFD8E9FFF7E1F2E813631A2D6F344EE6895DF39F4DE58C08A4357B8B
                79FFFFFFFFFFFF000000456E4519BF516BEA9B7CE9A39BE4B5167B1EFFFFFFFF
                FFFF00230036D47328C05B1BB94E006700C4CEC4FFFFFF000000C0E1C7A1C7A5
                9DC1A19AC19F91C399DAD1DBFFFFFFFFFFFFE3DEE39CC8A0A4CAA7A5CCAAA6CE
                ADCFE6D4FFFFFF000000}
            end
          end
          inherited Panel4: TPanel
            Top = 91
            Width = 790
            Height = 78
            inherited DBGridEh1: TDBGridEh
              Width = 790
              Height = 78
              SumList.Active = True
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'fact_id'
                  Footer.Value = #21512#35745#65306
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                  Title.Caption = #21378#23478#32534#21495
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'dev_id'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #36710#26426#32534#21495
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'CAR_NO'
                  Footers = <>
                  Title.Caption = #36710#29260#21495
                  Title.TitleButton = True
                  Width = 90
                end
                item
                  EditButtons = <>
                  FieldName = 'Count'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #27425#25968
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  DisplayFormat = '0.00'
                  EditButtons = <>
                  FieldName = 'TradeMoneySum'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #37329#39069
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'notUpCount'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #26410#32467#31639#27425#25968
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  DisplayFormat = '0.0'
                  EditButtons = <>
                  FieldName = 'notUpTradeMoneySum'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #26410#32467#31639#37329#39069
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'upokCount'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #24050#25104#21151#32467#31639#27425#25968
                  Width = 100
                end
                item
                  DisplayFormat = '0.0'
                  EditButtons = <>
                  FieldName = 'upOkTradeMoneySum'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #24050#25104#21151#32467#31639#37329#39069
                  Width = 100
                end>
            end
          end
          inherited cxSplitter2: TcxSplitter
            Top = 169
            Width = 790
            AlignSplitter = salBottom
            Control = PageControl3
          end
          object PageControl3: TPageControl
            Left = 1
            Top = 177
            Width = 790
            Height = 238
            ActivePage = TabSheet7
            Align = alBottom
            TabOrder = 3
            object TabSheet7: TTabSheet
              Caption = #26609#29366#22270
              ImageIndex = 1
              object DBChart1: TDBChart
                Left = 0
                Top = 0
                Width = 782
                Height = 210
                AllowZoom = False
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                BackWall.Color = clWhite
                BackWall.Pen.Visible = False
                Title.Font.Charset = GB2312_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -19
                Title.Font.Name = #23435#20307
                Title.Font.Style = []
                Title.Text.Strings = (
                  #21047#21345#20132#26131#32479#35745)
                BackColor = clWhite
                BottomAxis.Title.Caption = #36710#36742
                BottomAxis.Title.Font.Charset = GB2312_CHARSET
                BottomAxis.Title.Font.Color = clBlack
                BottomAxis.Title.Font.Height = -13
                BottomAxis.Title.Font.Name = #23435#20307
                BottomAxis.Title.Font.Style = []
                Frame.Visible = False
                LeftAxis.Title.Font.Charset = GB2312_CHARSET
                LeftAxis.Title.Font.Color = clBlack
                LeftAxis.Title.Font.Height = -13
                LeftAxis.Title.Font.Name = #23435#20307
                LeftAxis.Title.Font.Style = []
                View3D = False
                Align = alClient
                BorderStyle = bsSingle
                Color = clWhite
                TabOrder = 0
                OnMouseMove = DBChart1MouseMove
                object LabelSelectPointInfo: TLabel
                  Left = 144
                  Top = 174
                  Width = 140
                  Height = 13
                  Caption = 'LabelSelectPointInfo'
                  Color = clYellow
                  ParentColor = False
                end
                object FastLineSeries2: TBarSeries
                  Marks.ArrowLength = 8
                  Marks.Style = smsValue
                  Marks.Visible = True
                  SeriesColor = clRed
                  Title = #37329#39069#65288#20803#65289
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1.000000000000000000
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1.000000000000000000
                  YValues.Order = loNone
                end
                object Series1: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = True
                  SeriesColor = clGreen
                  Title = #27425#25968
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1.000000000000000000
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1.000000000000000000
                  YValues.Order = loNone
                end
              end
            end
          end
        end
      end
    end
  end
  object cxSplitter1: TcxSplitter [2]
    Left = 203
    Top = 0
    Width = 8
    Height = 446
    HotZoneClassName = 'TcxSimpleStyle'
    Control = Panel7
  end
  inherited PrintDBGridEh1: TPrintDBGridEh
    Left = 286
    Top = 215
  end
end
