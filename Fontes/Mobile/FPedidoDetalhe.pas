unit FPedidoDetalhe;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox;

type
  TfrmPedidoDetalhe = class(TForm)
    lytToolBar: TLayout;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    lytEndereco: TLayout;
    lblEndereco: TLabel;
    lblCompraMin: TLabel;
    lblProdutos: TListBox;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Layout2: TLayout;
    Label3: TLabel;
    Label4: TLabel;
    Layout3: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormShow(Sender: TObject);
  private
    procedure addProduto(id_produto: Integer; descricao: string; qtd,
      valor_unitario: Double; AFoto: TStream);

    procedure carregarPedido;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoDetalhe: TfrmPedidoDetalhe;

implementation

uses
  Frame.Produto.Lista;

{$R *.fmx}


procedure TfrmPedidoDetalhe.addProduto(id_produto: Integer; descricao: string;
                                                       qtd,
                                                       valor_unitario: Double;
                                                       AFoto: TStream);
var
  Litem: TListBoxItem;
  LFrame: TframeProdutoLista;
begin
  Litem := TListBoxItem.Create(lblProdutos);
  Litem.Selectable  := False;
  Litem.Text        := '';
  Litem.Height      := 80;
  Litem.Tag         := id_produto;

  LFrame :=  TframeProdutoLista.Create(Litem);
  LFrame.lblDescricao.Text  := descricao;
//  LFrame.lblUnidade.Text    := unidade;
  LFrame.lblquantidade.text := qtd.ToString + ' x ' + FormatFloat('R$ #,##0.00', valor_unitario);
  LFrame.lblPreco.Text      := FormatFloat('R$ #,##0.00', valor_unitario * qtd);


  Litem.AddObject(LFrame);
  lblProdutos.AddObject(Litem);
end;




procedure TfrmPedidoDetalhe.carregarPedido;
begin
  addProduto(0, 'Café Pilão'    , 2,8,nil);
  addProduto(1, 'Heineken'      , 2,8,nil);
  addProduto(2, 'Manteiga'      , 2,8,nil);
  addProduto(3, 'File de Frango', 2,8,nil);
end;


procedure TfrmPedidoDetalhe.FormShow(Sender: TObject);
begin
  carregarPedido;
end;

end.
