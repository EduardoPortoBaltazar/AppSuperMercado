import express from 'express';
import { response } from 'express';

const app = express ();

//Middleware JSON
app.use(express.json());


app.get("/clientes", function(resquest, response){
    return response.send("Listando todos os dados...");        
});


app.listen(3000, function(){
  console.log('Servidor no Ar.')   
});