import express from "express";
import cors from "cors";
import controllerUsuarios from "./controllers/controller.usuarios.js";
import controllerMercados from "./controllers/controller.mercados.js";

const app = express();

// Middleware JSON
app.use(express.json());

// Middleware CORS
app.use(cors());

// Controllers
app.use(controllerUsuarios);
app.use(controllerMercados);


/*
    Verbos HTTP:
    --------------------------
    GET -> Retornar dados
    POST -> Cadastrar dados
    PUT -> Editar dados
    PATCH -> Editar dados
    DELETE -> Excluir dados
*/



// URI Params (/clientes/123)...
/*
app.get("/clientes/:id", function(request, response){
    return response.send("Listando somente o cliente: " + request.params.id);
});

app.post("/clientes", function(request, response){
    const body = request.body;    
    return response.send("Novo cliente: " + body.nome + " - " + 
    body.email);
});

app.put("/clientes", function(request, response){
    return response.send("Alterando um cliente com PUT");
});

app.patch("/clientes", function(request, response){
    return response.send("Alterando um cliente com PATCH");
});

app.delete("/clientes", function(request, response){
    return response.send("Excluindo clientes");
});
*/

app.listen(3000, function(){
    console.log('Servidor no ar.');
});