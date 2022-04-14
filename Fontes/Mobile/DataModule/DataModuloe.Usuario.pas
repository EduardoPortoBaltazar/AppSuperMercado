unit DataModuloe.Usuario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  DataSet.Serialize.Config,
  RESTRequest4D,
  System.JSON;

type
  TDmUsuario = class(TDataModule)
    TabUsuario: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    procedure Login(AEmail, ASenha: string);
    procedure CriarConta(nome, email, senha, endereco, bairro, cidade, uf, cep: string);
  end;

var
  DmUsuario: TDmUsuario;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

Const
  USER_NAME = '99coders';
  PASSWORD = '123456';
  BASE_URL = 'http://localhost:3000';

{$R *.dfm}

procedure TDmUsuario.DataModuleCreate(Sender: TObject);
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
end;

procedure TDmUsuario.CriarConta(nome, email, senha, endereco, bairro,
                               cidade, uf, cep: string);
var
 LResp: IResponse;
 LJson: TJSONObject;
begin
  LJson := TJSONObject.Create;
  try
   LJson.AddPair('nome'     , nome);
   LJson.AddPair('email'    , email);
   LJson.AddPair('senha'    , senha);
   LJson.AddPair('endereco' , endereco);
   LJson.AddPair('bairro'   , bairro);
   LJson.AddPair('cidade'   , cidade);
   LJson.AddPair('uf'       , uf);
   LJson.AddPair('cep'      , cep);

    LResp := TRequest
                 .New
                 .BaseURL(BASE_URL)
                 .Resource('usuarios/cadastro')
                 .DataSetAdapter(TabUsuario)
                 .AddBody(LJson.ToJSON)
                 .Accept('application/json')
                 .BasicAuthentication(USER_NAME, PASSWORD)
                 .Post;

    if (LResp.StatusCode = 401) then
      raise Exception.Create('Usuário Não Autorizado')
    else if (LResp.StatusCode <> 201) then
      raise Exception.Create(LResp.Content);
  finally
    LJson.DisposeOf;
  end;
end;


procedure TDmUsuario.Login(AEmail, ASenha: string);
var
 LResp: IResponse;
 LJson: TJSONObject;
begin
  LJson := TJSONObject.Create;
  try
    LJson.AddPair('email', AEmail);
    LJson.AddPair('senha', ASenha);

    LResp := TRequest
                 .New
                 .BaseURL(BASE_URL)
                 .Resource('usuarios/login')
                 .DataSetAdapter(TabUsuario)
                 .AddBody(LJson.ToJSON)
                 .Accept('application/json')
                 .BasicAuthentication(USER_NAME, PASSWORD)
                 .Post;

    if (LResp.StatusCode = 401) then
      raise Exception.Create('E-mail ou Senha Inválida')
    else if (LResp.StatusCode <> 200) then
      raise Exception.Create(LResp.Content);
  finally
    LJson.DisposeOf;
  end;
end;

end.
