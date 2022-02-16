program MeuMercado;

uses
  System.StartUpCopy,
  FMX.Forms,
  FLogin in 'FLogin.pas' {frmLogin},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
