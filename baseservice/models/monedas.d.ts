import { Model, BuildOptions } from 'sequelize';
export interface IMonedasAttributes {
  monedaID: number,
  descripcion: any,
  simbolo: any,
  acronimo: any,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
  enable: boolean,
}
export interface IMonedasModel extends IMonedasAttributes, Model {}
export type IMonedasModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IMonedasModel;
};