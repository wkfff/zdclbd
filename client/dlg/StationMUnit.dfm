object StationMFrm: TStationMFrm
  Left = 246
  Top = 199
  BorderStyle = bsDialog
  Caption = #31449#28857#20449#24687#35774#32622
  ClientHeight = 369
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 517
    Height = 35
    Align = alTop
    Caption = #31449#28857#20449#24687
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 35
    Width = 517
    Height = 298
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 12
      Width = 52
      Height = 13
      Caption = #31449#28857#21517#31216
    end
    object Label2: TLabel
      Left = 9
      Top = 59
      Width = 52
      Height = 13
      Caption = #32447#36335#29366#20917
    end
    object Label3: TLabel
      Left = 373
      Top = 15
      Width = 26
      Height = 13
      Caption = #32463#24230
    end
    object Label5: TLabel
      Left = 373
      Top = 40
      Width = 26
      Height = 13
      Caption = #32428#24230
    end
    object Label7: TLabel
      Left = 32
      Top = 38
      Width = 26
      Height = 13
      Caption = #23383#20307
    end
    object Label8: TLabel
      Left = 224
      Top = 8
      Width = 52
      Height = 13
      Caption = #22270#29255#22823#23567
    end
    object StationNameEdit: TEdit
      Left = 64
      Top = 8
      Width = 104
      Height = 21
      TabOrder = 0
    end
    object memo1: TMemo
      Left = 64
      Top = 60
      Width = 449
      Height = 48
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 1
      Top = 112
      Width = 515
      Height = 185
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label4: TLabel
        Left = 7
        Top = 14
        Width = 78
        Height = 13
        Caption = #27491#38754#22270#20687#21517#31216
      end
      object Label6: TLabel
        Left = 8
        Top = 71
        Width = 78
        Height = 13
        Caption = #21453#38754#22270#20687#21517#31216
      end
      object Image1Name: TEdit
        Left = 40
        Top = 40
        Width = 137
        Height = 21
        TabOrder = 0
      end
      object Image2Name: TEdit
        Left = 40
        Top = 99
        Width = 138
        Height = 21
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 200
        Top = 4
        Width = 137
        Height = 177
        Caption = #31449#21381#27491#38754
        Color = clBtnHighlight
        ParentColor = False
        TabOrder = 2
        object Image1: TImage
          Left = 15
          Top = 14
          Width = 113
          Height = 157
          Hint = #28155#21152#22270#29255#35831#21452#20987
          ParentShowHint = False
          ShowHint = True
          Stretch = True
          OnDblClick = Image1DblClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 369
        Top = 4
        Width = 137
        Height = 177
        Caption = #31449#21381#32972#38754
        Color = clCream
        ParentColor = False
        TabOrder = 3
        object Image2: TImage
          Left = 16
          Top = 16
          Width = 113
          Height = 154
          Hint = #28155#21152#22270#29255#35831#21452#20987
          ParentShowHint = False
          ShowHint = True
          Stretch = True
          OnDblClick = Image2DblClick
        end
      end
      object image1wayPath: TEdit
        Left = 40
        Top = 128
        Width = 137
        Height = 21
        TabOrder = 4
        Visible = False
      end
      object image2wayPath: TEdit
        Left = 40
        Top = 160
        Width = 137
        Height = 21
        TabOrder = 5
        Visible = False
      end
    end
    object XEdit: TEdit
      Left = 409
      Top = 9
      Width = 99
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
    end
    object YEdit: TEdit
      Left = 408
      Top = 35
      Width = 100
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
    end
    object FontEdit: TEdit
      Left = 64
      Top = 34
      Width = 104
      Height = 21
      TabOrder = 5
    end
    object BitBtn1: TBitBtn
      Left = 173
      Top = 35
      Width = 26
      Height = 20
      Caption = '...'
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object imagesize: TEdit
      Left = 274
      Top = 34
      Width = 79
      Height = 21
      TabOrder = 7
      Text = '10'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 333
    Width = 517
    Height = 36
    Align = alBottom
    TabOrder = 2
    object BitBtnOK: TBitBtn
      Left = 284
      Top = 5
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtnDel: TBitBtn
      Left = 358
      Top = 5
      Width = 75
      Height = 25
      Caption = #21024#38500
      ModalResult = 2
      TabOrder = 1
      OnClick = BitBtnDelClick
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
    object BitBtnClose: TBitBtn
      Left = 432
      Top = 5
      Width = 75
      Height = 25
      Caption = #20851#38381'&C'
      TabOrder = 2
      Kind = bkClose
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 208
    Top = 90
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 153
    Top = 155
  end
  object OpenPictureDialog2: TOpenPictureDialog
    Left = 345
    Top = 179
  end
end
