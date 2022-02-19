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
    procedure lbCategoriaItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    procedure SelecionarCategoria(AItemListBox: TListBoxItem);
    { Private declarations }

  public
    { Public declarations }
    procedure addProduto(id_produto: Integer; descricao, unidade: string; valor: Double);
    procedure listarProdutos;
    procedure listarCategorias;
    procedure AddCategoria(AId: Integer; ADescricao: string);
  end;

var
  frmMercado: TfrmMercado;

implementation

uses
  FPrincipal, Frame.ProdutoCard;

{$R *.fmx}

{ TfrmMercado }

procedure TfrmMercado.AddCategoria(AId: Integer; ADescricao: string);
var
  LItem:  TListBoxItem;
  Lretangulo: TRectangle;
  LLabel: TLabel;
begin
  LItem            := TListBoxItem.Create(lbCategoria);
  LItem.Selectable := false;
  LItem.Text       := '';
  LItem.Width      := 130;
  LItem.Tag        := AId;

  Lretangulo                 := TRectangle.Create(LItem);
  Lretangulo.Cursor          := crHandPoint;
  Lretangulo.HitTest         := False;
  Lretangulo.Fill.Color      := $FFE2E2E2;
  Lretangulo.Align           := TAlignLayout.Client;
  Lretangulo.Margins.Top     := 8;
  Lretangulo.Margins.Left    := 8;
  Lretangulo.Margins.Right   := 8;
  Lretangulo.Margins.Bottom  := 8;
  Lretangulo.XRadius         := 6;
  Lretangulo.YRadius         := 6;
  Lretangulo.Stroke.Kind     := TBrushKind.None;

  LLabel := TLabel.Create(Lretangulo);
  LLabel.Align := TAlignLayout.Client;
  LLabel.Text := ADescricao;
  LLabel.TextSettings.HorzAlign := TTextAlign.Center;
  LLabel.TextSettings.VertAlign := TTextAlign.Center;
  LLabel.StyledSettings := LLabel.StyledSettings - [TStyledSetting.Size,
                                                    TStyledSetting.FontColor,
                                                    TStyledSetting.Style,
                                                    TStyledSetting.Other];

  LLabel.Font.Size  := 13;
  LLabel.FontColor  := $FF3A3A3A;

  Lretangulo.AddObject(LLabel);
  LItem.AddObject(Lretangulo);
  lbCategoria.AddObject(LItem);
end;

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

procedure TfrmMercado.SelecionarCategoria(AItemListBox: TListBoxItem);
var
 i: Integer;
 rect: TRectangle;
 lbl: TLabel;
 LItem: TListBoxItem; 
begin
  for I := 0 to Pred(lbCategoria.Count) do
    begin 
      LItem := lbCategoria.ItemByIndex(i);
      rect                := TRectangle(LItem.Components[0]);
      rect.Fill.Color     := $FFE2E2E2;     
      
      lbl                 := TLabel(rect.Components[0]);          
      lbl.FontColor       := $FF3A3A3A;
    end;     

  //Somente o item clicado 
  rect := TRectangle(AItemListBox.Components[0]);
  rect.Fill.Color := $FF64BA01;
  
  lbl  := TLabel(rect.Components[0]);
  lbl.FontColor := $FFFFFFFF;                                     
end;


procedure TfrmMercado.FormShow(Sender: TObject);
begin
  listarCategorias;
end;

procedure TfrmMercado.lbCategoriaItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
 SelecionarCategoria(Item);
end;

procedure TfrmMercado.listarCategorias;
begin
  lbCategoria.Items.Clear;

  AddCategoria(0, 'Alimento');
  AddCategoria(1, 'Bebidas');
  AddCategoria(2, 'Cigarros');
  AddCategoria(3, 'Diverso');
  AddCategoria(4, 'Cerveja');


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
