inherited GetAPictureFrm: TGetAPictureFrm
  Left = 417
  Top = 238
  Caption = #25293#29031
  ClientHeight = 357
  ClientWidth = 445
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 326
    Width = 445
    inherited BitBtn1: TBitBtn
      Left = 119
      Caption = #21457#36865' &S'
    end
    inherited BitBtn2: TBitBtn
      Left = 231
      OnClick = BitBtn2Click
    end
  end
  inherited Panel_Devs: TPanel
    Width = 445
    Height = 326
    object Label5: TLabel [0]
      Left = 171
      Top = 278
      Width = 91
      Height = 13
      Caption = #22270#29255#35270#39057#36136#37327#65306
      Visible = False
    end
    object Label6: TLabel [1]
      Left = 223
      Top = 303
      Width = 39
      Height = 13
      Caption = #20142#24230#65306
      Visible = False
    end
    object Label7: TLabel [2]
      Left = 210
      Top = 328
      Width = 52
      Height = 13
      Caption = #23545#27604#24230#65306
      Visible = False
    end
    object Label8: TLabel [3]
      Left = 178
      Top = 297
      Width = 52
      Height = 13
      Caption = #39281#21644#24230#65306
      Visible = False
    end
    object Label9: TLabel [4]
      Left = 191
      Top = 322
      Width = 39
      Height = 13
      Caption = #33394#24230#65306
      Visible = False
    end
    object Label11: TLabel [5]
      Left = 339
      Top = 277
      Width = 80
      Height = 13
      Caption = '1'#65374'10'#65292'1'#26368#22909
      Visible = False
    end
    object Label12: TLabel [6]
      Left = 339
      Top = 303
      Width = 41
      Height = 13
      Caption = '0'#65374'255'
      Visible = False
    end
    object Label13: TLabel [7]
      Left = 339
      Top = 328
      Width = 41
      Height = 13
      Caption = '0'#65374'127'
      Visible = False
    end
    object Label14: TLabel [8]
      Left = 307
      Top = 297
      Width = 41
      Height = 13
      Caption = '0'#65374'127'
      Visible = False
    end
    object Label15: TLabel [9]
      Left = 307
      Top = 321
      Width = 41
      Height = 13
      Caption = '0'#65374'255'
      Visible = False
    end
    inherited Panel6: TPanel
      Width = 315
      Height = 324
      object Label1: TLabel [0]
        Left = 5
        Top = 220
        Width = 65
        Height = 13
        Caption = #29031#29255#22823#23567#65306
      end
      object Label2: TLabel [1]
        Left = 63
        Top = 72
        Width = 52
        Height = 13
        Caption = #25668#20687#22836#65306
      end
      object Label3: TLabel [2]
        Left = 50
        Top = 101
        Width = 65
        Height = 13
        Caption = #25293#25668#21629#20196#65306
      end
      object Label4: TLabel [3]
        Left = 51
        Top = 130
        Width = 65
        Height = 13
        Caption = #26102#38388#38388#38548#65306
      end
      object Label16: TLabel [4]
        Left = 210
        Top = 130
        Width = 13
        Height = 13
        Caption = #31186
      end
      object Label17: TLabel [5]
        Left = 31
        Top = 252
        Width = 39
        Height = 13
        Caption = #20142#24230#65306
      end
      object Label18: TLabel [6]
        Left = 169
        Top = 252
        Width = 52
        Height = 13
        Caption = #23545#27604#24230#65306
      end
      object Label19: TLabel [7]
        Left = 31
        Top = 281
        Width = 39
        Height = 13
        Caption = #33394#24230#65306
      end
      object Label20: TLabel [8]
        Left = 156
        Top = 221
        Width = 65
        Height = 13
        Caption = #25104#20687#36136#37327#65306
      end
      object Label21: TLabel [9]
        Left = 169
        Top = 281
        Width = 52
        Height = 13
        Caption = #39281#21644#24230#65306
      end
      inherited Panel8: TPanel
        Width = 313
        Height = 38
        BevelInner = bvSpace
        BevelOuter = bvLowered
        Caption = #25293#29031
        Font.Color = clBlack
        ParentColor = True
      end
      object ComboBoxSize: TComboBox
        Left = 71
        Top = 217
        Width = 73
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 6
        Text = '320x240'
        Items.Strings = (
          '320x240'
          '640x480'
          '800*600'
          '1024*768'
          '176*144'
          '352*288'
          '704*288'
          '704*576')
      end
      object ComboBoxCamera: TComboBox
        Left = 116
        Top = 69
        Width = 89
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          '1 - '#21496#26426#19978#26041
          '2 - '#21069#38376
          '3 - '#21069#36710#21410
          '4 - '#21518#36710#21410
          '5 - '#21069#36710#22806)
      end
      object ComboBoxCameraCmd: TComboBox
        Left = 116
        Top = 98
        Width = 89
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 2
        TabOrder = 2
        Text = #25293#29031
        OnChange = ComboBoxCameraCmdChange
        Items.Strings = (
          #20572#27490#25293#25668
          #24405#20687
          #25293#29031)
      end
      object editSJJG: TEdit
        Left = 116
        Top = 127
        Width = 89
        Height = 21
        TabOrder = 3
        Text = '0'
        OnKeyPress = editSJJGKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 51
        Top = 156
        Width = 214
        Height = 48
        Caption = #20445#23384#26631#24535
        TabOrder = 4
        object radio1: TRadioButton
          Left = 27
          Top = 19
          Width = 65
          Height = 17
          Caption = #20445#23384
          TabOrder = 0
        end
        object radio2: TRadioButton
          Left = 109
          Top = 20
          Width = 84
          Height = 17
          Caption = #23454#26102#19978#20256
          Checked = True
          TabOrder = 1
          TabStop = True
        end
      end
      object Panel3: TPanel
        Left = 207
        Top = 83
        Width = 107
        Height = 41
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 5
        Visible = False
        object Label10: TLabel
          Left = 1
          Top = 19
          Width = 39
          Height = 13
          Caption = #24352#25968#65306
        end
        object editZS: TEdit
          Left = 39
          Top = 15
          Width = 63
          Height = 21
          TabOrder = 0
          Text = '1'
          OnChange = editZSChange
          OnKeyPress = editSJJGKeyPress
        end
      end
      object ProgressBar1: TProgressBar
        Left = 1
        Top = 304
        Width = 313
        Height = 19
        Align = alBottom
        TabOrder = 7
      end
    end
    inherited Panel4: TPanel
      Left = 31
      Top = 18
      Width = 84
      Caption = #25293#29031#20197#19979#36710#36742#65306
    end
    inherited Panel1: TPanel
      Left = 316
      Width = 128
      Height = 324
      inherited ListView1: TListView
        Width = 126
        Height = 292
        Columns = <
          item
            Caption = #36710#29260#21495
            Width = 105
          end>
      end
      inherited Panel5: TPanel
        Top = 293
        Width = 126
        Height = 30
        inherited BitBtnSel: TBitBtn
          Left = 2
          Top = 3
          Width = 65
        end
        inherited BitBtn3: TBitBtn
          Left = 67
          Top = 3
          Width = 57
        end
      end
    end
    object editTXZL: TEdit
      Left = 222
      Top = 219
      Width = 73
      Height = 21
      MaxLength = 2
      TabOrder = 3
      Text = '1'
      OnKeyPress = editSJJGKeyPress
    end
    object editLD: TEdit
      Left = 72
      Top = 249
      Width = 73
      Height = 21
      MaxLength = 3
      TabOrder = 4
      Text = '100'
      OnKeyPress = editSJJGKeyPress
    end
    object editDBD: TEdit
      Left = 222
      Top = 249
      Width = 73
      Height = 21
      MaxLength = 3
      TabOrder = 5
      Text = '100'
      OnKeyPress = editSJJGKeyPress
    end
    object editBHD: TEdit
      Left = 222
      Top = 279
      Width = 73
      Height = 21
      MaxLength = 3
      TabOrder = 7
      Text = '100'
      OnKeyPress = editSJJGKeyPress
    end
    object editSD: TEdit
      Left = 72
      Top = 279
      Width = 73
      Height = 21
      MaxLength = 3
      TabOrder = 6
      Text = '100'
      OnKeyPress = editSJJGKeyPress
    end
  end
end
