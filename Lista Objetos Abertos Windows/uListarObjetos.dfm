object frmListarObjetos: TfrmListarObjetos
  Left = 0
  Top = 0
  Caption = 'Desenvolvido por '#205'caro Cassiolato'
  ClientHeight = 283
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  DesignSize = (
    414
    283)
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 8
    Top = 39
    Width = 398
    Height = 236
    Anchors = [akLeft, akTop, akRight, akBottom]
    Indent = 19
    TabOrder = 0
    ExplicitWidth = 233
    ExplicitHeight = 188
  end
  object btnListar: TButton
    Left = 8
    Top = 8
    Width = 398
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Listar objetos abertos'
    TabOrder = 1
    OnClick = btnListarClick
    ExplicitWidth = 233
  end
end
