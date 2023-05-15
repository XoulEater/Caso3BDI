import { Model, BuildOptions } from 'sequelize';
export interface IProductosAttributes {
  productoID: number,
  enable: boolean,
  descripcion: string,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
}
export interface IProductosModel extends IProductosAttributes, Model {}
export type IProductosModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IProductosModel;
};