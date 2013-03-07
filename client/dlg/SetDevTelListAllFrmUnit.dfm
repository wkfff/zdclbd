inherited SetDevTelListAllFrm: TSetDevTelListAllFrm
  Left = 414
  Top = 226
  Width = 609
  Height = 400
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeable
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel [0]
    Left = 457
    Top = 0
    Width = 144
    Height = 366
    Align = alRight
    Caption = 'Panel4'
    TabOrder = 0
    object Panel8: TPanel
      Left = 1
      Top = 332
      Width = 142
      Height = 33
      Align = alBottom
      TabOrder = 0
      object BitBtn5: TBitBtn
        Left = 71
        Top = 4
        Width = 65
        Height = 25
        Caption = #31227#38500
        TabOrder = 0
        OnClick = BitBtn5Click
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
        Left = 6
        Top = 4
        Width = 65
        Height = 25
        Caption = #37325#26032#36873#25321
        TabOrder = 1
        OnClick = BitBtnSelClick
      end
    end
    object ListView1: TListView
      Left = 1
      Top = 25
      Width = 142
      Height = 307
      Align = alClient
      Columns = <
        item
          Caption = #36710#29260#21495
          Width = 111
        end>
      FlatScrollBars = True
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 1
      ViewStyle = vsReport
      OnClick = ListView1Click
    end
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 142
      Height = 24
      Align = alTop
      Caption = #35774#32622#20197#19979#36710#36742':'
      TabOrder = 2
    end
  end
  inherited Panel111: TPanel
    Width = 457
    Height = 366
    TabOrder = 1
    inherited Panel2: TPanel
      Width = 455
      Height = 290
      inherited cxDevTelList: TcxTreeList
        Width = 453
        Height = 264
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #30005#35805#26412
            Width = 444
          end>
        OptionsView.Bands = False
      end
      object Panel5: TPanel
        Left = 1
        Top = 265
        Width = 453
        Height = 24
        Align = alBottom
        Caption = 'Panel5'
        TabOrder = 1
        Visible = False
        object ProgressBar1: TProgressBar
          Left = 1
          Top = 1
          Width = 451
          Height = 22
          Align = alClient
          TabOrder = 0
        end
      end
    end
    inherited Panel3: TPanel
      Width = 455
      Font.Charset = ANSI_CHARSET
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      inherited Label1: TLabel
        Visible = False
      end
      inherited EditCarNO: TEdit
        Visible = False
      end
    end
    inherited Panel1: TPanel
      Top = 333
      Width = 455
      inherited BitBtnOk: TBitBtn
        Left = 278
        Width = 85
        Caption = #21457#36865' &S'
      end
      inherited BitBtnCancel: TBitBtn
        Left = 363
        Width = 85
        Caption = #21462#28040' &C'
        OnClick = BitBtnCancelClick
      end
      inherited BitBtn1: TBitBtn
        Caption = #22686#21152' &A'
      end
      inherited BitBtn2: TBitBtn
        Caption = #20462#25913' &E'
      end
      inherited BitBtn3: TBitBtn
        Caption = #21024#38500' &D'
      end
      inherited BitBtn4: TBitBtn
        Caption = #28165#38500' &L'
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    inherited N1: TMenuItem
      Action = nil
    end
    inherited N4: TMenuItem
      Visible = False
    end
  end
end
