unit FPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Ani, uLoading;

type
  TfrmPrincipal = class(TForm)
    lytToolBar: TLayout;
    imgMenu: TImage;
    imgCarrinho: TImage;
    Label1: TLabel;
    lytPesquisa: TLayout;
    StyleBook: TStyleBook;
    rectPesquisa: TRectangle;
    edtBuscar: TEdit;
    Image3: TImage;
    Button1: TButton;
    lytSwitch: TLayout;
    RectSwitch: TRectangle;
    RectSelecao: TRectangle;
    lblCasa: TLabel;
    lblRetira: TLabel;
    lvMercado: TListView;
    imgShop: TImage;
    imgPedidoMin: TImage;
    imgTX: TImage;
    AnimationFiltro: TFloatAnimation;
    rectMenu: TRectangle;
    imgPerfil: TImage;
    imgFecharMenu: TImage;
    lblEndereco: TLabel;
    Label2: TLabel;
    rectPedido: TRectangle;
    lblMeuPedido: TLabel;
    Rectangle1: TRectangle;
    Label3: TLabel;
    rectMenuPedido: TRectangle;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure lvMercadoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lblCasaClick(Sender: TObject);
    procedure imgCarrinhoClick(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure OpenMenu(Ind: Boolean);
    procedure imgFecharMenuClick(Sender: TObject);
    procedure rectMenuPedidoClick(Sender: TObject);

  private
    Find_Retira: string;
    Find_Entrega: string;

    procedure AddMercadoLv(id_mercado: Integer; nome, endereco: string; taxa, valorMin: Double);
    procedure listarMercado;
    procedure SelecionarEntrega(ALabel: TLabel);
    procedure ThreadEnd(Sender: TObject);


  public

    property ind_Entrega: string read Find_Entrega write Find_Entrega;
    property ind_Retira: string read Find_Retira write Find_Retira;



  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  FMercado, FCarrinho, FPedido,
   DataModuloe.Mercado,
    DataModuloe.Usuario;

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
  SelecionarEntrega(lblCasa);
  listarMercado;
end;

procedure TfrmPrincipal.imgMenuClick(Sender: TObject);
begin
  OpenMenu(True);
end;

procedure TfrmPrincipal.imgCarrinhoClick(Sender: TObject);
begin
  if not Assigned(frmCarrinho) then
     Application.CreateForm(TfrmCarrinho, frmCarrinho);

  frmCarrinho.Show;
end;

procedure TfrmPrincipal.imgFecharMenuClick(Sender: TObject);
begin
  OpenMenu(False);
end;

procedure TfrmPrincipal.lblCasaClick(Sender: TObject);
begin
  SelecionarEntrega(TLabel(Sender));
end;

procedure TfrmPrincipal.listarMercado;
var
  LThread: TThread;
begin
  TLoading.Show(frmPrincipal, 'Mercado...');


  LThread := TThread.CreateAnonymousThread(
  procedure
  var
    i: Integer;
  begin
    DMMercado.ListarMercado(edtBuscar.Text, ind_Entrega, ind_Retira);

    lvMercado.BeginUpdate;
    with DMMercado.TabMercado do
    begin
    for I := 0 to DMMercado.TabMercado.RecordCount -1 do
      begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
        AddMercadoLv(FieldByName('id_mercado').AsInteger,
                    FieldByName('nome').AsString,
                    FieldByName('endereco').AsString,
                    FieldByName('vl_entrega').AsFloat,
                    FieldByName('vl_compra_min').AsFloat);

        end);
        Next;
      end;
    end;
  end);

  LThread.OnTerminate := ThreadEnd;
  LThread.Start;
end;

procedure TfrmPrincipal.ThreadEnd(Sender: TObject);
begin
    TLoading.Hide;

  lvMercado.EndUpdate;

  if Sender is TThread then
  begin
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      Exit;
    end;
  end;

end;



procedure TfrmPrincipal.lvMercadoItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  if not Assigned(frmMercado) then
    Application.CreateForm(TfrmMercado, frmMercado);

  frmMercado.Show;
end;

procedure TfrmPrincipal.OpenMenu(Ind: Boolean);
begin
  rectMenu.Visible := Ind;
end;

procedure TfrmPrincipal.rectMenuPedidoClick(Sender: TObject);
begin
  if not Assigned(frmPedidos) then
    Application.CreateForm(TfrmPedidos, frmPedidos);

  OpenMenu(False);
  frmPedidos.Show;
end;

procedure TfrmPrincipal.SelecionarEntrega(ALabel: TLabel);
begin
  lblCasa.FontColor   := $FF8F8F8F;
  lblRetira.FontColor := $FF8F8F8F;

  ALabel.FontColor    := $FFFFFFFF;
  ind_Entrega := '';
  ind_Retira  := '';

  if ALabel.tag = 0 then
    ind_Entrega := 'S'
  else
    ind_Retira := 'S';

  listarMercado;

  AnimationFiltro.StopValue := ALabel.Position.x;
  AnimationFiltro.Start;
end;

end.
