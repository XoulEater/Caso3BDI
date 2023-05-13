import { Logger } from '../common'

const sql = require('mssql')
// Aca se tiene que hacer la conexion con el SQL
const sqlConfig = {
    user: "sa",
    password: "123456",
    database: "ferianueva",
    server: "localhost",
    pool: {
      max: 1,
      min: 1,
      idleTimeoutMillis: 30000
    },
    options: {
      encrypt: true, 
      trustServerCertificate: true 
    }
}

export class data_feria {
    private log: Logger;

    public constructor()
    {
        this.log = new Logger();

        // via singleton, accediendo a un solo pool tengo una conexiona la base de datos
    }

    public getClientsByFilter(filter: string) : Promise<any>
    {
        //Aca es donde solicita la llamada de la database
        //Se le asigna con el execute
        return sql.connect(sqlConfig).then((pool:any) => {
            //Aca es donde todo arranca
            return pool.request()
                // Parametro del stored procedure
                .input("searchcriteria", sql.VarChar(40), filter)
                // Se llama a ejecutar el procedure
                .execute("getFilteredClients")
        })
    }

}
