unit FLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.TabControl;

type
  TfrmLogin = class(TForm)
    tbcGeral: TTabControl;
    tbcLogin: TTabItem;
    tbcConta1: TTabItem;
    tbcConta2: TTabItem;
    Image1: TImage;
    Layout1: TLayout;
    Label1: TLabel;
    edtEmailLogin: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label2: TLabel;
    Image2: TImage;
    Label3: TLabel;
    Layout2: TLayout;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Button2: TButton;
    Label5: TLabel;
    Edit5: TEdit;
    Layout3: TLayout;
    Label6: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Button3: TButton;
    Label7: TLabel;
    Image3: TImage;
    Label8: TLabel;
    Edit8: TEdit;
    Layout4: TLayout;
    Edit9: TEdit;
    Edit10: TEdit;
    StyleBook: TStyleBook;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

end.
