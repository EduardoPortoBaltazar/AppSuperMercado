program MeuMercado;

uses
  System.StartUpCopy,
  FMX.Forms,
  FLogin in 'FLogin.pas' {frmLogin},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FMercado in 'FMercado.pas' {frmMercado},
  Frame.ProdutoCard in 'Frames\Frame.ProdutoCard.pas' {FrameProdutoCard: TFrame},
  FSplash in 'FSplash.pas' {frmSplash},
  FProduto in 'FProduto.pas' {FrmProduto},
  FCarrinho in 'FCarrinho.pas' {frmCarrinho},
  Frame.Produto.Lista in 'Frames\Frame.Produto.Lista.pas' {frameProdutoLista: TFrame},
  FPedido in 'FPedido.pas' {frmPedidos},
  FPedidoDetalhe in 'FPedidoDetalhe.pas' {frmPedidoDetalhe},
  DataModuloe.Usuario in 'DataModule\DataModuloe.Usuario.pas' {DmUsuario: TDataModule},
  uLoading in 'Units\uLoading.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDmUsuario, DmUsuario);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
