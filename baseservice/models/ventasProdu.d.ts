import { Model, BuildOptions } from 'sequelize';
export interface IVentasProduAttributes {
  ventaProduID: number,
  posttime: Date,
  monto: any,
  pedidoID: string,
  plantaID: number,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
  monedaID: number,
}
export interface IVentasProduModel extends IVentasProduAttributes, Model {}
export type IVentasProduModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IVentasProduModel;
};