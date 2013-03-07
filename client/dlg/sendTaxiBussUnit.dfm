object sendTaxiBuss: TsendTaxiBuss
  Left = 361
  Top = 201
  Width = 593
  Height = 419
  Caption = #19979#21457#20986#31199#36710#19994#21153#20449#24687
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
    Width = 585
    Height = 392
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 359
      Width = 585
      Height = 33
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object BitBtnOk: TBitBtn
        Left = 195
        Top = 5
        Width = 84
        Height = 25
        Caption = #21457#36865' &S'
        TabOrder = 0
        OnClick = BitBtnOkClick
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
      object BitBtnCancel: TBitBtn
        Left = 278
        Top = 5
        Width = 84
        Height = 25
        Cancel = True
        Caption = #21462#28040' &C'
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
    object Panel4: TPanel
      Left = 473
      Top = 0
      Width = 112
      Height = 359
      Align = alRight
      BevelOuter = bvLowered
      Caption = 'Panel4'
      TabOrder = 1
      object Panel8: TPanel
        Left = 1
        Top = 325
        Width = 110
        Height = 33
        Align = alBottom
        Caption = 'Panel8'
        TabOrder = 0
        object BitBtn5: TBitBtn
          Left = 56
          Top = 4
          Width = 53
          Height = 25
          Caption = #31227#38500
          TabOrder = 0
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
        object BitBtnSel: TBitBtn
          Left = 3
          Top = 4
          Width = 53
          Height = 25
          Caption = #37325#26032#36873#25321
          TabOrder = 1
        end
      end
      object ListView1: TListView
        Left = 1
        Top = 25
        Width = 110
        Height = 300
        Align = alClient
        Columns = <
          item
            Caption = #36710#29260#21495
            Width = 103
          end>
        FlatScrollBars = True
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 110
        Height = 24
        Align = alTop
        Caption = #35774#32622#20197#19979#36710#36742':'
        TabOrder = 2
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 473
      Height = 359
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 2
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 471
        Height = 42
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = #19979#21457#20986#31199#36710#19994#21153#20449#24687
        Color = 15265488
        Font.Charset = GB2312_CHARSET
        Font.Color = 16512
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = -29
          Top = 23
          Width = 65
          Height = 13
          Caption = #36710#26426#36710#36742#65306
          Font.Charset = GB2312_CHARSET
          Font.Color = 16512
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object EditCarNO: TEdit
          Left = 35
          Top = 17
          Width = 105
          Height = 21
          Font.Charset = GB2312_CHARSET
          Font.Color = 16512
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'EditCarNO'
          Visible = False
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 43
        Width = 471
        Height = 315
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 105
          Top = 4
          Width = 47
          Height = 13
          Caption = #19994#21153'ID'#65306
          Visible = False
        end
        object Label3: TLabel
          Left = 305
          Top = 8
          Width = 60
          Height = 13
          Caption = #19994#21153#31867#22411#65306
          Visible = False
        end
        object Label4: TLabel
          Left = 95
          Top = 52
          Width = 60
          Height = 13
          Caption = #35201#36710#26102#38388#65306
        end
        object Label5: TLabel
          Left = 95
          Top = 134
          Width = 60
          Height = 13
          Caption = #19994#21153#25551#36848#65306
        end
        object Label6: TLabel
          Left = 95
          Top = 89
          Width = 60
          Height = 13
          Caption = #20056#23458#21495#30721#65306
        end
        object Label7: TLabel
          Left = 72
          Top = 201
          Width = 93
          Height = 13
          Caption = #35814#32454#19994#21153#25551#36848#65306'   '
        end
        object Edit1: TEdit
          Left = 171
          Top = 2
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'Edit1'
          Visible = False
        end
        object Edit2: TEdit
          Left = 371
          Top = 5
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'Edit2'
          Visible = False
        end
        object Edit3: TEdit
          Left = 173
          Top = 87
          Width = 121
          Height = 21
          TabOrder = 2
          Text = 'Edit3'
        end
        object Memo1: TMemo
          Left = 173
          Top = 130
          Width = 185
          Height = 55
          Lines.Strings = (
            '')
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object Memo2: TMemo
          Left = 173
          Top = 199
          Width = 185
          Height = 72
          ScrollBars = ssVertical
          TabOrder = 4
        end
        object data: TDateTimePicker
          Left = 174
          Top = 51
          Width = 77
          Height = 21
          Date = 40056.369511527780000000
          Time = 40056.369511527780000000
          TabOrder = 5
        end
        object time: TDateTimePicker
          Left = 252
          Top = 51
          Width = 70
          Height = 21
          Date = 40056.369737766200000000
          Time = 40056.369737766200000000
          Kind = dtkTime
          TabOrder = 6
        end
      end
    end
  end
end
