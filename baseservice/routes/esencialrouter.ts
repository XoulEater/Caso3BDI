import * as express from 'express';
import { Logger } from '../common'
import { EsencialController } from '../controllers'
const app = express();  
const log = new Logger();


app.get("/getGananciasPool", (req, res, next) => {
    EsencialController.getInstance().getGananciasPool()
    .then((data:any)=>{
        res.json(data);
    })
    .catch((err:any)=>{
        log.error(err);
        return "{msg: \"error\"}";
    });
});

app.get("/getGananciasNoPool", (req, res, next) => {
    EsencialController.getInstance().getGananciasNoPool()
    .then((data:any)=>{
        res.json(data);
    })
    .catch((err:any)=>{
        log.error(err);
        return "{msg: \"error\"}";
    });
});


app.get("/getcontainersORM", async (req, res) => {
    EsencialController.getInstance().getGananciasORM()
    .then((data:any)=>{
        res.json(data);
    })
    .catch((err:any)=>{
        log.error(err);
        return "{msg: \"error\"}";
    });
});

export { app as esencialrouter };
