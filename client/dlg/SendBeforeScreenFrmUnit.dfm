object SendBeforeScreenForm: TSendBeforeScreenForm
  Left = 309
  Top = 191
  Width = 585
  Height = 401
  Caption = #21457#36865#26041#21521#20449#24687
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
    Width = 577
    Height = 41
    Align = alTop
    Caption = #21457#36865#26041#21521#20449#24687
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 577
    Height = 292
    Align = alClient
    TabOrder = 1
    object Panel4: TPanel
      Left = 461
      Top = 1
      Width = 115
      Height = 290
      Align = alRight
      TabOrder = 0
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 113
        Height = 288
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
          Height = 232
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
          Top = 257
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
          end
        end
      end
    end
    object InfoList: TcxTreeList
      Left = 1
      Top = 1
      Width = 460
      Height = 290
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
          Width = 299
        end>
      BufferedPaint = True
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      TabOrder = 1
      object cxID: TcxTreeListColumn
        Caption.Text = 'ID'
        DataBinding.ValueType = 'Integer'
        Options.Editing = False
        Width = 68
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soDescending
      end
      object cxInfo: TcxTreeListColumn
        Caption.Text = #26041#21521#20449#24687
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 304
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 333
    Width = 577
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtnAdd: TBitBtn
      Left = 254
      Top = 8
      Width = 75
      Height = 25
      Caption = #28155#21152
      TabOrder = 0
      OnClick = BitBtnAddClick
    end
    object BitBtnDel: TBitBtn
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 1
      OnClick = BitBtnDelClick
    end
    object BitBtnSend: TBitBtn
      Left = 402
      Top = 8
      Width = 75
      Height = 25
      Caption = #21457#36865
      TabOrder = 2
    end
    object BitBtnClose: TBitBtn
      Left = 476
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381'&C'
      TabOrder = 3
      Kind = bkClose
    end
  end
end
