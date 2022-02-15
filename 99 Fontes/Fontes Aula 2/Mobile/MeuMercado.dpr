program MeuMercado;

uses
  System.StartUpCopy,
  FMX.Forms,
  UniLogin in 'UniLogin.pas' {FrmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
