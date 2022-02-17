unit FMercado;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.ListBox;

type
  TfrmMercado = class(TForm)
    lytToolBar: TLayout;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    imgCarrinho: TImage;
    lytPesquisa: TLayout;
    rectPesquisa: TRectangle;
    edtBuscar: TEdit;
    Image3: TImage;
    btnBuscar: TButton;
    lytEndereco: TLayout;
    lblEndereco: TLabel;
    Image4: TImage;
    Image5: TImage;
    lblTxEntrega: TLabel;
    lblCompraMin: TLabel;
    lbCategoria: TListBox;
    ListBoxItem1: TListBoxItem;
    V: TRectangle;
    Label1: TLabel;
    ListBoxItem2: TListBoxItem;
    Rectangle1: TRectangle;
    Label2: TLabel;
    lbProdutos: TListBox;
    ListBoxItem3: TListBoxItem;
    Rectangle2: TRectangle;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure addProduto(id_produto: Integer; descricao, unidade: string; valor: Double);
    procedure listarProdutos;
  end;

var
  frmMercado: TfrmMercado;

implementation

uses
  FPrincipal, Frame.ProdutoCard;

{$R *.fmx}

{ TfrmMercado }

procedure TfrmMercado.addProduto(id_produto: Integer; descricao, unidade: string; valor: Double);
var
  Litem: TListBoxItem;
  LFrame: TFrameProdutoCard;
begin
  Litem := TListBoxItem.Create(lbProdutos);
  Litem.Selectable  := False;
  Litem.Text        := '';
  Litem.Height      := 200;
  Litem.Tag         := id_produto;

  LFrame :=  TFrameProdutoCard.Create(Litem);
  LFrame.lblDescricao.Text  := descricao;
  LFrame.lblPreco.Text      := FormatFloat('R$ #,##0.00', valor);
  LFrame.lblUnidade.Text    := unidade;

  Litem.AddObject(LFrame);
  lbProdutos.AddObject(Litem);
end;

procedure TfrmMercado.FormShow(Sender: TObject);
begin
 listarProdutos;
end;

procedure TfrmMercado.listarProdutos;
begin
  addProduto(1, 'Cerveja Heineken', '470 ML', 45);
  addProduto(2, 'Paneltone', '470 ML', 45);
  addProduto(3, 'Carne', '470 ML', 45);
  addProduto(4, 'Linquiça', '470 ML', 45);

end;

end.
