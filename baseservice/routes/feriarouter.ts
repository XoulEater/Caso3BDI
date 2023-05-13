import * as express from 'express';
import { Logger } from '../common'
import { FeriaController } from '../controllers'

const app = express();
const log = new Logger();
// Es para el api
app.post("/getfilteredclients", (req, res,next) => {
    // Toma la info de la base de datos
    // Se hace la llamada al controlador
    FeriaController.getInstance().getFilteredClients(req.body.filter)
    .then((data:any)=>{
        res.json(data);
    })
    // Se recibe el res con la data en formato json
    .catch((err:any)=>{
        log.error(err);
        return "{msg: \"error\"}";
    });
    //Procesa la data

});

export { app as feriarouter };