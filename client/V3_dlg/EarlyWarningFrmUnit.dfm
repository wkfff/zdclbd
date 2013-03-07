object EarlyWarningFrm: TEarlyWarningFrm
  Left = 0
  Top = 519
  Width = 1024
  Height = 204
  Caption = #39044#35686#36710#36742
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 177
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1016
      Height = 177
      Align = alClient
      TabOrder = 0
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 395
        Height = 175
        Align = alLeft
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 1
          Top = 1
          Width = 393
          Height = 173
          Align = alClient
          Caption = #24453#30830#23450#36710#36742
          TabOrder = 0
          object ListView1: TListView
            Left = 2
            Top = 15
            Width = 389
            Height = 156
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 70
              end
              item
                Caption = #36710#29260#21495
                Width = 80
              end
              item
                Caption = 'GPS'#26102#38388
                Width = 139
              end
              item
                Caption = #25509#25910#26102#38388
                Width = 139
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            ParentShowHint = False
            PopupMenu = PopupMenu1
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
            OnClick = ListView1Click
            OnColumnClick = ListView1ColumnClick
            OnDblClick = ListView1DblClick
          end
        end
      end
      object Panel9: TPanel
        Left = 404
        Top = 1
        Width = 270
        Height = 175
        Align = alClient
        TabOrder = 1
        object GroupBox2: TGroupBox
          Left = 1
          Top = 1
          Width = 268
          Height = 173
          Align = alClient
          Caption = #39044#35686#30830#23450#36710#36742
          TabOrder = 0
          object ListView2: TListView
            Left = 2
            Top = 15
            Width = 264
            Height = 156
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 70
              end
              item
                Caption = #36710#29260#21495
                Width = 80
              end
              item
                Caption = 'GPS'#26102#38388
                Width = 139
              end
              item
                Caption = #30830#35748#26102#38388
                Width = 139
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentShowHint = False
            PopupMenu = PopupMenu2
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
            OnClick = ListView2Click
          end
        end
      end
      object Panel10: TPanel
        Left = 682
        Top = 1
        Width = 333
        Height = 175
        Align = alRight
        TabOrder = 2
        object GroupBox3: TGroupBox
          Left = 1
          Top = 1
          Width = 331
          Height = 173
          Align = alClient
          Caption = #39044#35686#21462#28040#36710#36742
          TabOrder = 0
          object ListView3: TListView
            Left = 2
            Top = 15
            Width = 327
            Height = 156
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 70
              end
              item
                Caption = #36710#29260#21495
                Width = 80
              end
              item
                Caption = 'GPS'#26102#38388
                Width = 139
              end
              item
                Caption = #21462#28040#26102#38388
                Width = 139
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentShowHint = False
            PopupMenu = PopupMenu3
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
            OnClick = ListView3Click
          end
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 674
        Top = 1
        Width = 8
        Height = 175
        Cursor = crHSplit
        HotZoneClassName = 'TcxSimpleStyle'
        HotZone.SizePercent = 31
        AlignSplitter = salRight
        AutoSnap = True
        MinSize = 22
        ResizeUpdate = True
        Control = Panel10
      end
      object cxSplitter1: TcxSplitter
        Left = 396
        Top = 1
        Width = 8
        Height = 175
        Cursor = crHSplit
        HotZoneClassName = 'TcxSimpleStyle'
        HotZone.SizePercent = 31
        AutoSnap = True
        MinSize = 22
        ResizeUpdate = True
        Control = Panel8
      end
    end
    object Panel3: TPanel
      Left = 653
      Top = 224
      Width = 85
      Height = 453
      TabOrder = 1
      Visible = False
      object GroupBox4: TGroupBox
        Left = 1
        Top = 1
        Width = 83
        Height = 451
        Align = alClient
        Caption = #39044#35686#26102#38388
        TabOrder = 0
        object ListView4: TListView
          Left = 2
          Top = 15
          Width = 79
          Height = 434
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
              Caption = 'GPS'#26102#38388
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
    object Panel4: TPanel
      Left = 745
      Top = 221
      Width = 369
      Height = 454
      TabOrder = 2
      Visible = False
      object Splitter5: TSplitter
        Left = 1
        Top = 131
        Width = 367
        Height = 4
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object Splitter6: TSplitter
        Left = 1
        Top = 298
        Width = 367
        Height = 4
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
      end
      object GroupBox5: TGroupBox
        Left = 1
        Top = 1
        Width = 367
        Height = 130
        Align = alTop
        Caption = #29031#29255'1'
        TabOrder = 0
        object Panel5: TPanel
          Left = 2
          Top = 15
          Width = 363
          Height = 113
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Image1: TImage
            Left = 0
            Top = 0
            Width = 363
            Height = 113
            Align = alClient
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 1
        Top = 135
        Width = 367
        Height = 163
        Align = alClient
        Caption = #29031#29255'2'
        TabOrder = 1
        object Panel6: TPanel
          Left = 2
          Top = 15
          Width = 363
          Height = 146
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Image2: TImage
            Left = 0
            Top = 0
            Width = 363
            Height = 146
            Align = alClient
          end
        end
      end
      object GroupBox7: TGroupBox
        Left = 1
        Top = 302
        Width = 367
        Height = 151
        Align = alBottom
        Caption = #29031#29255'3'
        TabOrder = 2
        object Panel7: TPanel
          Left = 2
          Top = 15
          Width = 363
          Height = 134
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Image3: TImage
            Left = 0
            Top = 0
            Width = 363
            Height = 134
            Align = alClient
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 289
    Top = 113
    object N1: TMenuItem
      Caption = #30830#35748#39044#35686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21462#28040#39044#35686
      OnClick = N2Click
    end
    object N6: TMenuItem
      Caption = #25293#29031
      OnClick = N6Click
    end
    object N3: TMenuItem
      Caption = #30417#21548#36710#20869#20449#24687
      OnClick = N3Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 545
    Top = 117
    object N4: TMenuItem
      Caption = #21024#38500#25152#26377
      OnClick = N4Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 873
    Top = 96
    object N5: TMenuItem
      Caption = #21024#38500#25152#26377
      OnClick = N5Click
    end
  end
end
