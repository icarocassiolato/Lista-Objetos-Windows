program ListarObjetos;

uses
  Vcl.Forms,
  uListarObjetos in 'uListarObjetos.pas' {frmListarObjetos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmListarObjetos, frmListarObjetos);
  Application.Run;
end.
