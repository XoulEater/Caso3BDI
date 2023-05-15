import { Model, BuildOptions } from 'sequelize';
export interface IPreciosProduAttributes {
  productoID: number,
  startDate: Date,
  endDate?: Date,
  regionID?: number,
  precioProduccion: any,
  precioVenta: any,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
  enable: boolean,
}
export interface IPreciosProduModel extends IPreciosProduAttributes, Model {}
export type IPreciosProduModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IPreciosProduModel;
};