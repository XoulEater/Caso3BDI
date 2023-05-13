import { Logger } from '../common'
import { data_esencial } from '../repositories/data_esencial'
import { data_esencialNoPool } from '../repositories/data_esencialNoPool'

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

    public getAllContainersPool(filter: string) : Promise<any> 
    {
        const esencialData = new data_esencial();
        return esencialData.getContainers(filter);
    }

    public getAllContainersNoPool(filter: string) : Promise<any> 
    {
        const esencialData = new data_esencialNoPool();
        return esencialData.getContainersNoPool(filter);
    }
}
