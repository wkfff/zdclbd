object SendAdInfoForm: TSendAdInfoForm
  Left = 154
  Top = 140
  Width = 745
  Height = 518
  Caption = #21457#36865#24191#21578#20449#24687
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 41
    Align = alTop
    Caption = #21457#36865#24191#21578#20449#24687
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 737
    Height = 409
    Align = alClient
    TabOrder = 1
    object AdInfoList: TcxTreeList
      Left = 1
      Top = 1
      Width = 620
      Height = 407
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
        end>
      BufferedPaint = True
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      TabOrder = 0
      object cxID: TcxTreeListColumn
        Caption.Text = #33258#21160#32534#21495
        DataBinding.ValueType = 'Integer'
        Options.Editing = False
        Width = 79
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soDescending
      end
      object cxadMemo: TcxTreeListColumn
        Caption.Text = #24191#21578#20869#23481
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 301
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxbeginTime: TcxTreeListColumn
        Caption.Text = #25237#25918#26102#38388
        DataBinding.ValueType = 'DateTime'
        Options.Editing = False
        Width = 99
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxendTime: TcxTreeListColumn
        Caption.Text = #21040#26399#26102#38388
        DataBinding.ValueType = 'DateTime'
        Width = 124
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxcustomerName: TcxTreeListColumn
        Caption.Text = #23458#25143#21517#31216
        DataBinding.ValueType = 'String'
        Width = 140
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxlinkName: TcxTreeListColumn
        Caption.Text = #32852#31995#20154
        DataBinding.ValueType = 'String'
        Width = 75
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxTel: TcxTreeListColumn
        Caption.Text = #32852#31995#30005#35805
        DataBinding.ValueType = 'String'
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxMemo: TcxTreeListColumn
        Caption.Text = #22791#27880
        DataBinding.ValueType = 'String'
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object Panel4: TPanel
      Left = 621
      Top = 1
      Width = 115
      Height = 407
      Align = alRight
      TabOrder = 1
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 113
        Height = 405
        Align = alClient
        Caption = 'Panel6'
        TabOrder = 0
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 111
          Height = 24
          Align = alTop
          Caption = #21457#24448#20197#19979#36710#36742':'
          TabOrder = 0
        end
        object ListView1: TListView
          Left = 1
          Top = 25
          Width = 111
          Height = 349
          Align = alClient
          Columns = <
            item
              Caption = #36710#29260#21495
              Width = 95
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 1
          ViewStyle = vsReport
        end
        object Panel8: TPanel
          Left = 1
          Top = 374
          Width = 111
          Height = 30
          Align = alBottom
          Caption = 'Panel8'
          TabOrder = 2
          object BitBtn4: TBitBtn
            Left = 56
            Top = 3
            Width = 53
            Height = 25
            Cancel = True
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
            Top = 3
            Width = 53
            Height = 25
            Caption = #37325#26032#36873#25321
            TabOrder = 1
            OnClick = BitBtnSelClick
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 450
    Width = 737
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtnAdd: TBitBtn
      Left = 319
      Top = 8
      Width = 75
      Height = 25
      Caption = #28155#21152
      TabOrder = 0
      OnClick = BitBtnAddClick
    end
    object BitBtnDel: TBitBtn
      Left = 393
      Top = 8
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 1
      OnClick = BitBtnDelClick
    end
    object BitBtnSend: TBitBtn
      Left = 467
      Top = 8
      Width = 75
      Height = 25
      Caption = #21457#36865'&S'
      TabOrder = 2
      OnClick = BitBtnSendClick
    end
    object BitBtnCancel: TBitBtn
      Left = 541
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      Enabled = False
      TabOrder = 4
      OnClick = BitBtnCancelClick
    end
    object BitBtnClose: TBitBtn
      Left = 615
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381'&C'
      TabOrder = 3
      Kind = bkClose
    end
    object ProgressBar1: TProgressBar
      Left = 2
      Top = 7
      Width = 311
      Height = 16
      TabOrder = 5
    end
    object CheckBox1: TCheckBox
      Left = 2
      Top = 23
      Width = 207
      Height = 17
      Caption = #21457#36865#20043#21069#21024#38500#36710#19978#25152#26377#24191#21578
      TabOrder = 6
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 232
    Top = 193
  end
end
