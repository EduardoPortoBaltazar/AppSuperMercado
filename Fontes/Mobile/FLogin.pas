unit FLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.TabControl,
  uLoading;

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
    edtSenha: TEdit;
    btnLogin: TButton;
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
    procedure btnLoginClick(Sender: TObject);
  private
    procedure ThreadEnd(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  DataModuloe.Usuario, FPrincipal;

{$R *.fmx}

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  LThread: TThread;
begin
  TLoading.Show(frmLogin, 'Login...');

  LThread := TThread.CreateAnonymousThread(
  procedure
  begin
    DmUsuario.Login(edtEmailLogin.Text, edtSenha.Text);

    //Salvar no banco do aparelho
    if DmUsuario.TabUsuario.RecordCount > 0 then
    begin

    end;
  end);

  LThread.OnTerminate := ThreadEnd;
  LThread.Start;
end;

procedure TfrmLogin.ThreadEnd(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
  begin
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      Exit;
    end;
  end;

  if not Assigned(frmPrincipal) then
    Application.CreateForm(TfrmPrincipal, frmPrincipal);

  frmPrincipal.Show;
end;

end.
