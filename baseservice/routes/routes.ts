import * as express from 'express';
import * as bodyParser from 'body-parser';
import { Logger } from '../common';
import { feriarouter } from './feriarouter';
import {esencialrouter} from './esencialrouter';
// Le da las intrucciones al servidor de expres de las rutas que va a crear
class Routes {

    public express: express.Application;
    public logger: Logger;

    constructor() {
        this.express = express();
        this.logger = new Logger();

        this.middleware();
        this.routes(); 
    }

    // Configure Express middleware.
    private middleware(): void {
        this.express.use(bodyParser.json());
        this.express.use(bodyParser.urlencoded({ extended: false }));
    }

    private routes(): void {
        // Se usa el kind y se mapea a esos routers 
        this.express.use('/feria', feriarouter);
        this.express.use('/esencial', esencialrouter);
        this.logger.info("feria route loaded");
        this.logger.info("esencial route loaded");
    }
}

export default new Routes().express;

