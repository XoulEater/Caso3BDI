import * as express from 'express';
import { Logger } from '../common'
import { EsencialController } from '../controllers'

const app = express();
const log = new Logger();
// Es para el api
app.post("/getcontainersPool", (req, res,next) => {
    EsencialController.getInstance().getAllContainersPool(req.body.filter)
    .then((data:any)=>{
        res.json(data);
    })
    .catch((err:any)=>{
        log.error(err);
        return "{msg: \"error\"}";
    });
});

app.post("/getcontainersNoPool", async (req, res,next) => {
    EsencialController.getInstance().getAllContainersNoPool(req.body.filter)
    .then((data:any)=>{
        res.json(data);
    })
    .catch((err:any)=>{
        log.error(err);
        return "{msg: \"error\"}";
    });
});

export { app as esencialrouter };
