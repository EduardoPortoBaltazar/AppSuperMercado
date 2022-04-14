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
    lblCadConta: TLabel;
    Image2: TImage;
    Label3: TLabel;
    Layout2: TLayout;
    Label4: TLabel;
    edtNomeCad: TEdit;
    edtEmailCad: TEdit;
    btnProximo: TButton;
    Label5: TLabel;
    edtSenhaCad: TEdit;
    Layout3: TLayout;
    Label6: TLabel;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    btnCriarConta: TButton;
    Label7: TLabel;
    Image3: TImage;
    Label8: TLabel;
    edtUF: TEdit;
    Layout4: TLayout;
    edtCidade: TEdit;
    edtCEP: TEdit;
    StyleBook: TStyleBook;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    procedure btnLoginClick(Sender: TObject);
    procedure lblCadContaClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnCriarContaClick(Sender: TObject);
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

procedure TfrmLogin.btnProximoClick(Sender: TObject);
begin
 tbcGeral.GotoVisibleTab(2);
end;

procedure TfrmLogin.btnCriarContaClick(Sender: TObject);
var
  t: TThread;
begin
  TLoading.Show(frmLogin, 'Criando Conta');

  t := TThread.CreateAnonymousThread(procedure
  begin
    Sleep(15000);
    DmUsuario.CriarConta(edtNomeCad.Text,
                         edtEmailCad.Text,
                         edtSenhaCad.Text,
                         edtEndereco.Text,
                         edtBairro.Text,
                         edtCidade.Text,
                         edtUF.Text,
                         edtCEP.Text);




  end);

  t.OnTerminate := ThreadEnd;
  t.Start;
end;

procedure TfrmLogin.Label3Click(Sender: TObject);
begin
  tbcGeral.GotoVisibleTab(0);
end;

procedure TfrmLogin.lblCadContaClick(Sender: TObject);
begin
 tbcGeral.GotoVisibleTab(1);
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

  Application.MainForm := frmPrincipal;
  frmPrincipal.Show;

  frmLogin.Close;
end;

end.
