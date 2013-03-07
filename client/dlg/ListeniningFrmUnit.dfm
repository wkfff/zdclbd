object ListeniningFrm: TListeniningFrm
  Left = 380
  Top = 470
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #27491#22312#36827#34892#30417#21548'...'
  ClientHeight = 213
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 62
    Width = 85
    Height = 13
    Caption = #27491#22312#36827#34892#30417#21548'!'
    Font.Charset = GB2312_CHARSET
    Font.Color = 16744448
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 139
    Width = 52
    Height = 13
    Caption = #36710#29260#21495#65306
  end
  object Label3: TLabel
    Left = 40
    Top = 115
    Width = 65
    Height = 13
    Caption = #26469#30005#21495#30721#65306
  end
  object LabelWithOtherListenin: TLabel
    Left = 40
    Top = 81
    Width = 91
    Height = 13
    Caption = #24182#32447#30417#21548#25104#21151#65281
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Animate1: TAnimate
    Left = 24
    Top = 8
    Width = 271
    Height = 48
    FileName = 'E:\shajp\toCOMP.avi'
    StopFrame = 12
  end
  object PanelOtherState: TPanel
    Left = 307
    Top = 0
    Width = 273
    Height = 213
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 1
    object cxOtherStateList: TcxTreeList
      Left = 1
      Top = 31
      Width = 271
      Height = 140
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
        end>
      BufferedPaint = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      OptionsData.Deleting = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      ParentFont = False
      PopupMenu = PopupMenu1
      StateImages = Mainf.ImageList1
      TabOrder = 0
      OnEditing = cxOtherStateListEditing
      object UserChannel_ID: TcxTreeListColumn
        Caption.Text = #30417#21548#36890#36947#21495
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 89
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
      end
      object UserChannel_Number: TcxTreeListColumn
        Caption.Text = #30417#21548#20998#26426#21495#30721
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 98
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object UserChannel_State: TcxTreeListColumn
        Visible = False
        Caption.Text = #29366#24577
        DataBinding.ValueType = 'String'
        MinWidth = 70
        Options.Editing = False
        Width = 70
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 271
      Height = 30
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = ' '#35831#36873#25321#20854#23427#31354#38386#30340#30417#21548#24231#24109#65292#36827#34892#24182#34892#30417#21548':'
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 1
      Top = 171
      Width = 271
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      object BitBtn1: TBitBtn
        Left = 76
        Top = 7
        Width = 114
        Height = 26
        Action = Action_ListeninWithOther
        Caption = #24182#32447#30417#21548
        TabOrder = 0
      end
    end
  end
  object EditDevCarNo: TEdit
    Left = 100
    Top = 134
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'EditDevCarNo'
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 176
    Width = 154
    Height = 25
    Action = Mainf.Show_ListeningDev
    Caption = #37325#28857#26597#30475#30417#21548#36710#36742
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF0000000000A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A5009C9C9C009C9C9C00949494008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C00636363000000000000000000FFFF
      FF00E7E7E7005252520052525200C6C6C600FFFFFF00FFFFFF00E7E7E700E7E7
      E700737373000000000000000000000000007B7B7B000000000000000000FFFF
      FF006363630000000000000000004A4A4A00393939006B6B6B006B6B6B000000
      0000FFFFFF00A5A5A50000000000000000008C8C8C000000000000000000FFFF
      FF0073737300FFFFFF0000E7E7004A4A4A00FFFFFF00FFFFFF00E7E7E700E7E7
      E700E7E7E700E7E7E700BDBDBD00000000008C8C8C000000000000000000FFFF
      FF007373730000000000000000004A4A4A00393939006B6B6B006B6B6B000000
      0000FFFFFF0000000000FFFFFF00DEDEDE008C8C8C000000000000000000FFFF
      FF0073737300FFFFFF0042FFFF004A4A4A00FFFFFF00FFFFFF00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700FFFFFF008C8C8C000000000000000000FFFF
      FF007373730000000000000000004A4A4A00393939006B6B6B006B6B6B00C6C6
      C6006B6B6B004A4A4A00C6C6C600FFFFFF008C8C8C000000000000000000FFFF
      FF0073737300FFFFFF007BFFFF004A4A4A00FFFFFF00FFFFFF00E7E7E7006B6B
      6B00FFD68C00F79400004A4A4A00DEDEDE008C8C8C000000000000000000FFFF
      FF007373730000000000000000004A4A4A00393939006B6B6B00E7E7E7006B6B
      6B00FFEFCE00FFBD52006B6B6B00DEDEDE008C8C8C000000000000000000FFFF
      FF00CECECE005252520052525200C6C6C600E7E7E700E7E7E700E7E7E700C6C6
      C6006B6B6B006B6B6B00C6C6C600E7E7E7008C8C8C000000000000000000B5B5
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B5B5B5008C8C8C0000000000000000005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A0000000000FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object BitBtn3: TBitBtn
    Left = 192
    Top = 176
    Width = 75
    Height = 25
    Action = Action_Close
    Caption = #36864#20986
    TabOrder = 4
  end
  object EditAlarmCallin: TEdit
    Left = 100
    Top = 108
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'EditAlarmCallin'
  end
  object ActionList1: TActionList
    Left = 267
    Top = 112
    object Action_SeeTheDev: TAction
      Caption = #37325#28857#26597#30475#36710#36742
      Hint = #22320#22270#19978#21482#26174#31034#35813#36710#65292#24182#36319#36394#26174#31034
    end
    object Action_ListeninWithOther: TAction
      Caption = #24182#32447#30417#21548
      OnExecute = Action_ListeninWithOtherExecute
    end
    object Action_Close: TAction
      Caption = #36864#20986
      OnExecute = Action_CloseExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 419
    Top = 112
    object N1: TMenuItem
      Action = Action_ListeninWithOther
    end
  end
end
