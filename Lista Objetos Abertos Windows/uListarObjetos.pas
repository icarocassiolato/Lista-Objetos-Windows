unit uListarObjetos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  PWindows = ^TWindows;
  TWindows = record
    WindowHandle: HWND;
    WindowText: string;
    WindowClass: string;
  end;

  PMyEnumParam = ^TMyEnumParam;
  TMyEnumParam = record
    Nodes: TTreeNodes;
    Current: TTreeNode;
  end;

  TfrmListarObjetos = class(TForm)
    TreeView1: TTreeView;
    btnListar: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListarObjetos: TfrmListarObjetos;
  PNode, CNode: TTreeNode;
  AWindows: PWindows;

implementation

{$R *.dfm}

function EnumWindowsProc(Wnd: HWND; Param: PMyEnumParam): BOOL; stdcall;
const
  MyMaxName = 64;
  MyMaxText = 64;
var
  ParamChild: TMyEnumParam;
  ClassName: string;
  WindowText: string;
begin
  Result := True;
  SetLength(ClassName, MyMaxName);
  SetLength(ClassName, GetClassName(Wnd, PChar(ClassName), MyMaxName));
  SetLength(WindowText, MyMaxText);
  SetLength(WindowText, SendMessage(Wnd, WM_GETTEXT, MyMaxText, lParam(PChar(WindowText))));
  ParamChild.Nodes   := Param.Nodes;
  ParamChild.Current := Param.Nodes.AddChildObject(Param.Current,
    '[' + ClassName + '] "' + WindowText + '"' + ' Handle: ' + IntToStr(Wnd), Pointer(Wnd));
  EnumChildWindows(Wnd, @EnumWindowsProc, lParam(@ParamChild));
end;

procedure TfrmListarObjetos.btnListarClick(Sender: TObject);
var
  Param: TMyEnumParam;
begin
  Param.Nodes := TreeView1.Items;
  Param.Current := TreeView1.TopItem;
  TreeView1.Items.BeginUpdate;
  EnumWindows(@EnumWindowsProc, lParam(@Param));
  TreeView1.Items.EndUpdate;
end;

procedure TfrmListarObjetos.FormDestroy(Sender: TObject);
begin
//  Dispose(AWindows);
end;

end.

