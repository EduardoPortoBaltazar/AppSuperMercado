unit DataModuloe.Mercado;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RESTRequest4D, system.JSON,
  DataSet.Serialize.Config;

type
  TDMMercado = class(TDataModule)
    TabMercado: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ListarMercado(busca,ind_entrega, ind_retira: string);
  end;

var
  DMMercado: TDMMercado;

implementation
{%CLASSGROUP 'FMX.Controls.TControl'}
Const
  USER_NAME = '99coders';
  PASSWORD = '123456';
  BASE_URL = 'http://localhost:3000';


{$R *.dfm}


procedure TDMMercado.DataModuleCreate(Sender: TObject);
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
end;

procedure TDMMercado.ListarMercado(busca,ind_entrega, ind_retira: string);
var
 LResp: IResponse;
begin

    LResp := TRequest
                 .New
                 .BaseURL(BASE_URL)
                 .Resource('mercados')
                 .DataSetAdapter(TabMercado)
                 .AddParam('busca', busca)
                 .AddParam('ind_entrega', ind_entrega)
                 .AddParam('ind_retira', ind_retira)
                 .Accept('application/json')
                 .BasicAuthentication(USER_NAME, PASSWORD)
                 .get;

  if (LResp.StatusCode <> 200) then
    raise Exception.Create(LResp.Content);

end;


end.
