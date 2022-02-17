unit FPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TfrmPrincipal = class(TForm)
    lytToolBar: TLayout;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    lytPesquisa: TLayout;
    StyleBook: TStyleBook;
    rectPesquisa: TRectangle;
    edtEmailLogin: TEdit;
    Image3: TImage;
    Button1: TButton;
    lytSwitch: TLayout;
    Rectangle1: TRectangle;
    RectSwitch: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    lvMercado: TListView;
    imgShop: TImage;
    imgPedidoMin: TImage;
    imgTX: TImage;
    procedure FormShow(Sender: TObject);
    procedure lvMercadoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure AddMercadoLv(id_mercado: Integer; nome, endereco: string; taxa, valorMin: Double);
    procedure listarMercado;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  FMercado;

{$R *.fmx}

procedure  TfrmPrincipal.AddMercadoLv(id_mercado: Integer;
                                      nome, endereco: string;
                                      taxa, valorMin: Double);
var
  img: TListItemImage;
  txt: TListItemText;
begin
  with lvMercado.Items.Add do
  begin
    Height := 120;

    Tag := id_mercado;

    img := TListItemImage(Objects.FindDrawable('imgShop'));
    img.Bitmap := imgShop.Bitmap;

    img := TListItemImage(Objects.FindDrawable('imgTaxa'));
    img.Bitmap := imgTX.Bitmap;

    img := TListItemImage(Objects.FindDrawable('imgCompraMin'));
    img.Bitmap := imgPedidoMin.Bitmap;

    txt := TListItemText(Objects.FindDrawable('txtNome'));
    txt.Text := nome;

    txt := TListItemText(Objects.FindDrawable('txtEndereco'));
    txt.Text := endereco;

    txt := TListItemText(Objects.FindDrawable('txtTaxaEntrega'));
    txt.Text := 'Taxa de Entrega:' + FormatFloat('R$ #,##0.00', taxa);

    txt := TListItemText(Objects.FindDrawable('txtCompraMin'));
    txt.Text := 'Compra Minima:' + FormatFloat('R$ #,##0.00', valorMin);
  end;
end;



procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 listarMercado;
end;

procedure TfrmPrincipal.listarMercado;
begin
  AddMercadoLv(1, 'Extra Mercados', 'São Goncalo', 10, 10);
  AddMercadoLv(1, 'Extra Mercados', 'São Goncalo', 10, 10);
  AddMercadoLv(1, 'Extra Mercados', 'São Goncalo', 10, 10);
  AddMercadoLv(1, 'Extra Mercados', 'São Goncalo', 10, 10);
  AddMercadoLv(1, 'Extra Mercados', 'São Goncalo', 10, 10);
end;

procedure TfrmPrincipal.lvMercadoItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  if not Assigned(frmMercado) then
    Application.CreateForm(TfrmMercado, frmMercado);

  frmMercado.Show;
end;

end.
