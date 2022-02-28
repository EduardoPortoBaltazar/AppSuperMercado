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
  FPedidoDetalhe in 'FPedidoDetalhe.pas' {frmPedidoDetalhe};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmMercado, frmMercado);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TFrmProduto, FrmProduto);
  Application.CreateForm(TfrmCarrinho, frmCarrinho);
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.CreateForm(TfrmPedidoDetalhe, frmPedidoDetalhe);
  Application.Run;
end.
