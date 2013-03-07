inherited setDevEventListAllFrm: TsetDevEventListAllFrm
  Left = 650
  Top = 269
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #35774#32622#20107#20214
  ClientHeight = 373
  ClientWidth = 585
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel111: TPanel
    Width = 447
    Height = 373
    inherited Panel2: TPanel
      Width = 445
      Height = 255
      inherited cxDevEventList: TcxTreeList
        Width = 443
        Height = 229
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #36710#26426#20107#20214#21015#34920
            Width = 430
          end>
        inherited Event_Id: TcxTreeListColumn
          Width = 55
        end
        inherited Event_No: TcxTreeListColumn
          Width = 95
        end
        inherited Event_info: TcxTreeListColumn
          Width = 280
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 230
        Width = 443
        Height = 24
        Align = alBottom
        Caption = 'Panel5'
        TabOrder = 1
        Visible = False
        object ProgressBar1: TProgressBar
          Left = 1
          Top = 1
          Width = 441
          Height = 22
          Align = alClient
          TabOrder = 0
        end
      end
    end
    inherited Panel3: TPanel
      Width = 445
      inherited Label1: TLabel
        Visible = False
      end
      inherited EditEventNO: TEdit
        Visible = False
      end
    end
    inherited Panel1: TPanel
      Top = 340
      Width = 445
      inherited BitBtnOk: TBitBtn
        Left = 266
        Width = 75
        Caption = #21457#36865
      end
      inherited BitBtnCancel: TBitBtn
        Left = 349
        Width = 75
        OnClick = BitBtnCancelClick
      end
      inherited BitBtn1: TBitBtn
        Width = 56
      end
      inherited BitBtn2: TBitBtn
        Left = 59
        Width = 56
      end
      inherited BitBtn3: TBitBtn
        Left = 115
        Width = 56
      end
      inherited BitBtn4: TBitBtn
        Width = 56
        Visible = False
      end
    end
    object RzRadioGroup1: TRzRadioGroup
      Left = 1
      Top = 298
      Width = 445
      Height = 42
      Align = alBottom
      Alignment = taCenter
      BorderInner = fsGroove
      BorderOuter = fsFlat
      Color = 16382438
      Columns = 6
      ItemIndex = 2
      Items.Strings = (
        #21024#38500#32456#31471#25152#26377#20107#20214
        #26356#26032#20107#20214
        #36861#21152#20107#20214
        #20462#25913#20107#20214
        #21024#38500#25351#23450#20107#20214)
      TabOrder = 3
    end
  end
  object Panel4: TPanel [1]
    Left = 447
    Top = 0
    Width = 138
    Height = 373
    Align = alRight
    Caption = 'Panel4'
    Color = 16382438
    TabOrder = 1
    object Panel8: TPanel
      Left = 1
      Top = 339
      Width = 136
      Height = 33
      Align = alBottom
      Caption = 'Panel8'
      ParentColor = True
      TabOrder = 0
      object BitBtn5: TBitBtn
        Left = 68
        Top = 4
        Width = 62
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
        Left = 5
        Top = 4
        Width = 62
        Height = 25
        Caption = #37325#26032#36873#25321
        TabOrder = 1
        OnClick = BitBtnSelClick
      end
    end
    object ListView1: TListView
      Left = 1
      Top = 25
      Width = 136
      Height = 314
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
      OnClick = ListView1Click
    end
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 136
      Height = 24
      Align = alTop
      Caption = #35774#32622#20197#19979#36710#36742':'
      ParentColor = True
      TabOrder = 2
    end
  end
end
