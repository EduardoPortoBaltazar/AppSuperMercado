program MeuMercado;

uses
  System.StartUpCopy,
  FMX.Forms,
  FLogin in 'FLogin.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
