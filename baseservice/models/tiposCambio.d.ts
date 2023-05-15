import { Model, BuildOptions } from 'sequelize';
export interface ITiposCambioAttributes {
  tipoCambioID: number,
  monedaID: number,
  cambio: any,
  startdate: Date,
  enddate?: Date,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
  checksum?: any,
  enable: boolean,
}
export interface ITiposCambioModel extends ITiposCambioAttributes, Model {}
export type ITiposCambioModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ITiposCambioModel;
};