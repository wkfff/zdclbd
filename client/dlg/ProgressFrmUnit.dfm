object ProgressFrm: TProgressFrm
  Left = 315
  Top = 312
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'ProgressFrm'
  ClientHeight = 26
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 0
    Width = 442
    Height = 26
    Align = alClient
    BackColor = clBtnHighlight
    ForeColor = clBlue
    Progress = 0
  end
end