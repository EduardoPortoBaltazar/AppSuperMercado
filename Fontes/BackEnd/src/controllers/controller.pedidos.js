import { Router } from "express";
import db from '../config/database.js';

const controllerPedidos = Router();

controllerPedidos.get("/pedidos/:id_pedido", function(request, response){    
    
    let ssql = "select * from pedido ";
    ssql += "where id_pedido = ? ";
      
    // Falta tratar os itens no JSON...  <<-------------------------------------

    db.query(ssql, [request.params.id_pedido], function(err, result) {
        if (err) {            
            return response.status(500).send(err);
        } else {              
            return response.status(200).json(result[0]);
        }
    });
});


export default controllerPedidos;