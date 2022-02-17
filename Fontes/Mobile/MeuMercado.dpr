program MeuMercado;

uses
  System.StartUpCopy,
  FMX.Forms,
  FLogin in 'FLogin.pas' {frmLogin},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FMercado in 'FMercado.pas' {frmMercado},
  Frame.ProdutoCard in 'Frames\Frame.ProdutoCard.pas' {FrameProdutoCard: TFrame},
  FSplash in 'FSplash.pas' {frmSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmMercado, frmMercado);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.Run;
end.
