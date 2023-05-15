import * as express from 'express';
import { Logger } from '../common'
import { EsencialController } from '../controllers'
const app = express();  
const log = new Logger();
//ORM

/*
import { Sequelize } from 'sequelize';
import Actores from '../models/actores';

const sequelize = new Sequelize('database', 'username', 'password', {
    host: 'localhost',
    dialect: 'mssql',
    dialectOptions: {
      options: {
        encrypt: true, // Si estás utilizando una conexión cifrada (SSL/TLS) con SQL Server
      },
    },
  });
  const Project = Actores(sequelize)
*/


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

});

export { app as esencialrouter };
