unit Frame.Produto.Lista;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Objects;

type
  TframeProdutoLista = class(TFrame)
    imgFoto: TImage;
    lblDescricao: TLabel;
    lblPreco: TLabel;
    lblUnidade: TLabel;
    Layout1: TLayout;
    lblquantidade: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
