import { Router } from "express";
import db from '../config/database.js';

const controllerMercados = Router();

/*
controllerMercados.get("/mercados/:id_mercado", function(request, response){    
    
    let ssql = "select * from usuario where id_usuario = ?";

    db.query(ssql, [request.params.id_usuario], function(err, result) {
        if (err) {
            return response.status(500).send(err);
        } else {            
            return response.status(result.length > 0 ? 200 : 404).json(result[0]);
        }
    });
});
*/

controllerMercados.get("/mercados", function(request, response){    
    
    let filtro = [];
    let ssql = "select * from mercado ";
    //ssql += "where id_mercado > 0 ";

    /*
    if (request.query.busca) {
        ssql += "and nome = ? ";
        filtro.push(request.query.busca);        
    }

    if (request.query.ind_entrega) {
        ssql += "and ind_entrega = ? ";
        filtro.push(request.query.ind_entrega);        
    }

    if (request.query.ind_retira) {
        ssql += "and ind_retira = ? ";
        filtro.push(request.query.ind_retira);
    }
    */

    db.query(ssql, [], function(err, result) {
        if (err) {            
            return response.status(500).send(err);
        } else {  
            //return response.status(result);  <== ERRO
            return response.status(200).json(result);
        }
    });
});






export default controllerMercados;