import { Connection, Request, TYPES } from "tedious";

export class data_esencialNoPool {
  public constructor() {}

  public getGanancias() {
    const config = {
      server: "localhost",
      authentication: {
        type: "default",
        options: {
          userName: "whiit",
          password: "12345678"
        },
      },
      options: {
        trustServerCertificate: true,
        database: "esencialVerde",
        rowCollectionOnDone : true,
        rowCollectionOnRequestCompletion : true,
        useColumnNames : true,
        encrypt: true
      },
    };
    
    var connection = new Connection(config);
    
    return new Promise((resolve, reject) => {
      connection.on("connect", (err: Error) => {
        if (err) {
          console.log("Error: ", err);
          reject(err);
          return;
        }
        const request = new Request('test', (err: Error, rowCount: number, rows : any) => {
          if (err) {
            console.log(err);
            reject(err);
          }
          else {
            resolve({rows})
            //this.sleep(2000);
            connection.close()
          }
          
        });
    
        connection.callProcedure(request);
      
      });
      connection.connect();
    });
  }
  
  private sleep(milliseconds:any) {
    const date = Date.now();
    let currentDate = null;
    do {
      currentDate = Date.now();
    } while (currentDate - date < milliseconds);
    };
}
