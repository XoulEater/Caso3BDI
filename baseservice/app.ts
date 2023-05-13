import * as express from 'express';
import * as bodyParser from 'body-parser'; //json
import Routes from './routes/routes'
//Cuando ya se intancia al app llama a routes. 
class App {

    public express: express.Application;
    private saludos:string[];

    constructor() {
        this.express = express();
        this.middleware();
        this.routes();
    }

    // Configure Express middleware.
    private middleware(): void {
        this.express.use(bodyParser.json());
        this.express.use(bodyParser.urlencoded({ extended: false }));
    }

    private routes(): void {
        // Son como los URL, es donde se guardan los request
        // Cuando se llama api carga los routes
        this.express.use('/api', Routes);
        
        // Esta es la respuesta
        this.express.use('*', (req,res) => {
            res.send("Request invalido");
        });
    }
}

export default new App().express;