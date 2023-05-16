import { Logger } from '../common'
import { data_esencial } from '../repositories/data_esencial'
import { data_esencialNoPool } from '../repositories/data_esencialNoPool'

import {sequelize, showActores } from '../repositories/data_esencialORM';


//Dice cual repositorio se va a usar

export class EsencialController {
    private static instance: EsencialController;
    private log: Logger;

    private constructor()
    {
        this.log = new Logger();
        try
        {
        } catch (e)
        {
            this.log.error(e);
        }
    }

    public static getInstance() : EsencialController
    {
        if (!this.instance)
        {
            this.instance = new EsencialController();
        }
        return this.instance;
    }

    public getGananciasPool()
    {
        const esencialData = new data_esencial();
        return esencialData.getGanancias();
    }

    public getGananciasNoPool() 
    {
        const esencialData = new data_esencialNoPool();
        return esencialData.getGanancias();
    }

    public getGananciasORM()
    {
        const esencialData = showActores();
        return esencialData;
    }
}
