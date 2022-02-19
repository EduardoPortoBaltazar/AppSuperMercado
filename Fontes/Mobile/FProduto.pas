unit FProduto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TFrmProduto = class(TForm)
    lytToolBar: TLayout;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    lytFoto: TLayout;
    imgProduto: TImage;
    lblDescricao: TLabel;
    Layout1: TLayout;
    Label1: TLabel;
    rectAdicionarFooter: TRectangle;
    Layout4: TLayout;
    imgMais: TImage;
    imgMenos: TImage;
    lblQuantidade: TLabel;
    btnAdicionar: TButton;
    Layout2: TLayout;
    lblUnidade: TLabel;
    lblValor: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProduto: TFrmProduto;

implementation

uses
  FPrincipal;

{$R *.fmx}

end.
