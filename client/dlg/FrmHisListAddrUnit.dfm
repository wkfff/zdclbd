object FrmHisListAddr: TFrmHisListAddr
  Left = 236
  Top = 122
  Width = 928
  Height = 480
  Caption = #22238#25918#36712#36857#21015#34920
  Color = 16382438
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    object Label5: TLabel
      Left = 5
      Top = 13
      Width = 52
      Height = 13
      Caption = #36710#29260#21495#65306
    end
    object Label11: TLabel
      Left = 143
      Top = 13
      Width = 219
      Height = 13
      Caption = #22238#25918#26102#27573#65306'                     -'
    end
    object BitBtnToExcel: TBitBtn
      Left = 559
      Top = 6
      Width = 81
      Height = 30
      Caption = 'Excel'
      TabOrder = 0
      OnClick = BitBtnToExcelClick
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
    object BitBtn2: TBitBtn
      Left = 639
      Top = 6
      Width = 81
      Height = 30
      Caption = #36864#20986
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777700777777
        77777770E07777777777770EE0777777777700EEE0000000000070EEE0888077
        777770EEE0888077777770EEE0888077777770EEE0888077777770EEE0888077
        707770EEE0888077007770EEE0888070000070EEE0888077007770EEE0888077
        707770EE08888077777770E08888807777777000000000777777}
    end
    object EditHisDisplayCarNo: TEdit
      Left = 49
      Top = 9
      Width = 77
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#19975#33021#20116#31508#20869#32622#36755#20837#27861
      ReadOnly = True
      TabOrder = 2
      Text = 'EditHisDisplayCarNo'
    end
    object EditFromTime: TEdit
      Left = 205
      Top = 9
      Width = 146
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#19975#33021#20116#31508#20869#32622#36755#20837#27861
      TabOrder = 3
      Text = 'EditFromTime'
    end
    object EditToTime: TEdit
      Left = 366
      Top = 9
      Width = 146
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#19975#33021#20116#31508#20869#32622#36755#20837#27861
      TabOrder = 4
      Text = 'EditToTime'
    end
  end
  object cxTreeList1: TcxTreeList
    Left = 0
    Top = 40
    Width = 920
    Height = 365
    Align = alClient
    Bands = <
      item
      end>
    BufferedPaint = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.CellAutoHeight = True
    OptionsView.CellEndEllipsis = True
    OptionsView.GridLines = tlglBoth
    OptionsView.ShowRoot = False
    ParentFont = False
    TabOrder = 1
    object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
      Caption.Text = 'GPS'#26102#38388
      DataBinding.ValueType = 'String'
      Width = 152
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
      Caption.Text = #36895#24230'(km/h)'
      DataBinding.ValueType = 'String'
      Width = 75
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
      Caption.Text = #32463#24230
      DataBinding.ValueType = 'String'
      Width = 85
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
      Caption.Text = #32428#24230
      DataBinding.ValueType = 'String'
      Width = 85
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn6: TcxTreeListColumn
      Caption.Text = #26159#21542#23450#20301
      DataBinding.ValueType = 'String'
      Width = 59
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
      Caption.Text = #25152#22312#22320#22336
      DataBinding.ValueType = 'String'
      Width = 624
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 405
    Width = 920
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #26368#22823#36895#24230#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 2
  end
end
