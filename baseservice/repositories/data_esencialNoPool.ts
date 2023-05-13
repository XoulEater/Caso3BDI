import { Logger } from '../common';

const sql = require('mssql')

const sqlConfig = {
  user: "whiit",
  password: "12345678",
  database: "esencialVerde",
  server: "localhost",
  options: {
    encrypt: true, 
    trustServerCertificate: true 
  }
};

export class data_esencialNoPool {
  private log: Logger;
  

  public constructor() {
    this.log = new Logger();
  }

  public async getContainersNoPool(filter: string): Promise<any> {
    const connection = await sql.connect(sqlConfig);
    try {
        const request = new sql.Request(connection);

        request.input("actor", sql.VarChar(50), filter);

        const result = await request.execute("test");

        return result.recordset;

    } catch (err) {
      console.error(err);
      throw err;

    } finally {
      await connection.close();
    }
  }
}