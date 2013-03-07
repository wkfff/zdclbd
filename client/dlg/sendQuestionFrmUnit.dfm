object sendQuestionFrm: TsendQuestionFrm
  Left = 381
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #19979#21457#25552#38382#20449#24687
  ClientHeight = 423
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 571
    Height = 423
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 385
      Width = 571
      Height = 38
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = 16382438
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 196
        Top = 8
        Width = 79
        Height = 25
        Caption = #21457#36865' &S'
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
        Left = 293
        Top = 8
        Width = 79
        Height = 25
        Cancel = True
        Caption = #21462#28040' &C'
        ModalResult = 2
        TabOrder = 1
        OnClick = BitBtn2Click
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
    object Panel3: TPanel
      Left = 430
      Top = 0
      Width = 141
      Height = 385
      Align = alRight
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Panel3'
      Color = 16382438
      TabOrder = 1
      object ListView1: TListView
        Left = 1
        Top = 30
        Width = 139
        Height = 326
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = #36710#29260#21495
          end>
        GridLines = True
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 139
        Height = 29
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' '#21457#36865#32473#20197#19979#36710#36742#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 1
      end
      object Panel6: TPanel
        Left = 1
        Top = 356
        Width = 139
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 2
        object BitBtnSel: TBitBtn
          Left = 3
          Top = 2
          Width = 64
          Height = 25
          Hint = #37325#26032#36873#25321#36710#36742
          Caption = #37325#26032#36873#25321
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BitBtnSelClick
        end
        object BitBtn3: TBitBtn
          Left = 72
          Top = 2
          Width = 64
          Height = 25
          Cancel = True
          Caption = #31227#38500
          TabOrder = 1
          OnClick = BitBtn3Click
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
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 430
      Height = 385
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      Color = 16382438
      TabOrder = 2
      object Panel_basic: TPanel
        Left = 0
        Top = 49
        Width = 430
        Height = 336
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object Panel8: TPanel
          Left = 1
          Top = 315
          Width = 428
          Height = 20
          Align = alBottom
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          Visible = False
          object ProgressBar1: TProgressBar
            Left = 0
            Top = 0
            Width = 428
            Height = 20
            Align = alClient
            TabOrder = 0
            Visible = False
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 114
          Width = 428
          Height = 201
          Align = alBottom
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 1
          object Panel10: TPanel
            Left = 239
            Top = 0
            Width = 189
            Height = 201
            Align = alRight
            BevelOuter = bvNone
            Caption = 'Panel10'
            TabOrder = 0
            object cxDevAnswerList: TcxTreeList
              Left = 0
              Top = 0
              Width = 189
              Height = 201
              Align = alClient
              Bands = <
                item
                  Caption.AlignHorz = taCenter
                  Caption.Text = #20505#36873#31572#26696#21015#34920
                  Width = 180
                end>
              BufferedPaint = True
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              OptionsData.Editing = False
              OptionsData.Deleting = False
              OptionsSelection.HideFocusRect = False
              OptionsView.Bands = True
              OptionsView.GridLines = tlglBoth
              OptionsView.ShowRoot = False
              ParentFont = False
              TabOrder = 0
              OnClick = cxDevAnswerListClick
              object Tel_Id: TcxTreeListColumn
                Caption.Text = #24207#21495
                DataBinding.ValueType = 'Integer'
                Options.Editing = False
                Width = 52
                Position.ColIndex = 0
                Position.RowIndex = 0
                Position.BandIndex = 0
                SortOrder = soAscending
              end
              object Tel_No: TcxTreeListColumn
                Caption.Text = #31572#26696
                DataBinding.ValueType = 'String'
                Options.Editing = False
                Width = 128
                Position.ColIndex = 1
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 239
            Height = 201
            Align = alClient
            BevelOuter = bvLowered
            ParentColor = True
            TabOrder = 1
            object Panel16: TPanel
              Left = 1
              Top = 165
              Width = 237
              Height = 35
              Align = alBottom
              ParentColor = True
              TabOrder = 0
              object btnOK: TBitBtn
                Left = 78
                Top = 6
                Width = 58
                Height = 25
                Caption = #30830#23450
                TabOrder = 0
                OnClick = btnOKClick
              end
              object btnDel: TBitBtn
                Left = 137
                Top = 6
                Width = 58
                Height = 25
                Caption = #21024#38500
                TabOrder = 1
                OnClick = btnDelClick
              end
              object btnNew: TButton
                Left = 20
                Top = 6
                Width = 56
                Height = 25
                Caption = #26032#22686
                TabOrder = 2
                OnClick = btnNewClick
              end
            end
            object Panel17: TPanel
              Left = 1
              Top = 1
              Width = 237
              Height = 164
              Align = alClient
              ParentColor = True
              TabOrder = 1
              object Label1: TLabel
                Left = 1
                Top = 1
                Width = 235
                Height = 13
                Align = alTop
                Caption = #20505#36873#31572#26696#65306
              end
              object memAnswer: TMemo
                Left = 1
                Top = 14
                Width = 235
                Height = 109
                Align = alClient
                MaxLength = 20
                ScrollBars = ssVertical
                TabOrder = 0
              end
              object Panel18: TPanel
                Left = 1
                Top = 123
                Width = 235
                Height = 40
                Align = alBottom
                BevelOuter = bvNone
                ParentColor = True
                TabOrder = 1
                object Label3: TLabel
                  Left = 8
                  Top = 16
                  Width = 60
                  Height = 13
                  Caption = #31572#26696#26679#20363#65306
                end
                object ComboBox1: TComboBox
                  Left = 69
                  Top = 12
                  Width = 159
                  Height = 21
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 0
                  Text = #35831#36873#25321
                  OnChange = ComboBox1Change
                  Items.Strings = (
                    #35831#36873#25321
                    #26159
                    #21542
                    #22909#30340
                    #21487#20197
                    #19981#21487#20197
                    #27809#26102#38388)
                end
              end
            end
          end
        end
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 428
          Height = 113
          Align = alClient
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 2
          object Panel12: TPanel
            Left = 240
            Top = 0
            Width = 188
            Height = 113
            Align = alRight
            TabOrder = 0
            object checkSign: TcxCheckListBox
              Left = 1
              Top = 1
              Width = 186
              Height = 111
              Align = alClient
              Items = <
                item
                  Text = #32039#24613
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Text = #32456#31471#35821#38899#25773#35835
                end
                item
                  Text = #24191#21578#23631#26174#31034
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end>
              TabOrder = 0
            end
          end
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 240
            Height = 113
            Align = alClient
            BevelOuter = bvNone
            Ctl3D = True
            ParentColor = True
            ParentCtl3D = False
            TabOrder = 1
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 240
              Height = 17
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object Label2: TLabel
                Left = 0
                Top = 0
                Width = 240
                Height = 13
                Align = alTop
                Caption = #35201#25552#38382#30340#20449#24687#65306'                 '#26631#24535#65306
                Font.Charset = GB2312_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = []
                ParentFont = False
              end
            end
            object Panel15: TPanel
              Left = 0
              Top = 17
              Width = 240
              Height = 96
              Align = alClient
              TabOrder = 1
              object Memo1: TMemo
                Left = 1
                Top = 1
                Width = 238
                Height = 94
                Align = alClient
                MaxLength = 100
                ScrollBars = ssVertical
                TabOrder = 0
              end
            end
          end
        end
      end
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 430
        Height = 49
        Align = alTop
        BevelInner = bvSpace
        BevelOuter = bvLowered
        Caption = #19979#21457#25552#38382#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 1
      end
    end
  end
end
