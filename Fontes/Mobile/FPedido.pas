unit FPedido;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmPedidos = class(TForm)
    lytToolBar: TLayout;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    lvPedidos: TListView;
    imgShop: TImage;
    procedure FormShow(Sender: TObject);
    procedure lvPedidosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure AddPedidoLv( id_pedido, qtd_itens: Integer;
                                    nome, endereco, dt_pedido: string;
                                    vl_pedido: Double);

    { Private declarations }
  public
    { Public declarations }
    procedure listarPedidos;

  end;

var
  frmPedidos: TfrmPedidos;

implementation

uses
  FPrincipal, FPedidoDetalhe;

{$R *.fmx}

{ TfrmPedidos }


procedure  TfrmPedidos.AddPedidoLv( id_pedido, qtd_itens: Integer;
                                    nome, endereco, dt_pedido: string;
                                    vl_pedido: Double);

var
  img: TListItemImage;
  txt: TListItemText;
begin
  with lvPedidos.Items.Add do
  begin
    Height := 120;

    Tag := id_pedido;

    img := TListItemImage(Objects.FindDrawable('imgShop'));
    img.Bitmap := imgShop.Bitmap;

    txt := TListItemText(Objects.FindDrawable('txtNome'));
    txt.Text := nome;

    txt := TListItemText(Objects.FindDrawable('txtPedido'));
    txt.Text := 'Pedido ' + id_pedido.ToString;

    txt := TListItemText(Objects.FindDrawable('txtEndereco'));
    txt.Text := endereco;

    txt := TListItemText(Objects.FindDrawable('txtValor'));
    txt.Text := FormatFloat('R$ #,##0.00', vl_pedido) + ' - ' + qtd_itens.ToString + ' itens';

    txt := TListItemText(Objects.FindDrawable('txtData'));
    txt.Text := dt_pedido;
  end;
end;

procedure TfrmPedidos.FormShow(Sender: TObject);
begin
  listarPedidos;
end;

procedure TfrmPedidos.listarPedidos;
begin
  AddPedidoLv(666, 2, 'Golden', 'Rua do cordeiro', '28/02/2022', 22);
  AddPedidoLv(666, 2, 'Golden', 'Rua do cordeiro', '28/02/2022', 22);
  AddPedidoLv(666, 2, 'Golden', 'Rua do cordeiro', '28/02/2022', 22);
  AddPedidoLv(666, 2, 'Golden', 'Rua do cordeiro', '28/02/2022', 22);
  AddPedidoLv(666, 2, 'Golden', 'Rua do cordeiro', '28/02/2022', 22);
  AddPedidoLv(666, 2, 'Golden', 'Rua do cordeiro', '28/02/2022', 22);
  AddPedidoLv(666, 2, 'Golden', 'Rua do cordeiro', '28/02/2022', 22);
end;

procedure TfrmPedidos.lvPedidosItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  if not Assigned(frmPedidoDetalhe) then
    Application.CreateForm(TfrmPedidoDetalhe, frmPedidoDetalhe);

  frmPedidoDetalhe.Show;
end;

end.
