import { Logger } from '../common'

const sql = require('mssql')
// Aca se tiene que hacer la conexion con el SQL
const sqlConfig = {
    user: "whiit",
    password: "12345678",
    database: "esencialVerde",
    server: "localhost",
    pool: {
      max: 20,
      min: 10,
      idleTimeoutMillis: 30000
    },
    options: {
      encrypt: true, 
      trustServerCertificate: true 
    }
}

export class data_esencial {
    private log: Logger;

    public constructor()
    {
        this.log = new Logger();

        // via singleton, accediendo a un solo pool tengo una conexiona la base de datos
    }

    public getGanancias()
    {
        //Aca es donde solicita la llamada de la database
        //Se le asigna con el execute
        return sql.connect(sqlConfig).then((pool:any) => {
            //Aca es donde todo arranca
            return pool.request()
                .execute("test")
        })
    }

}
