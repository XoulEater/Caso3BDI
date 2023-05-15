import { Model, BuildOptions } from 'sequelize';
export interface IProductosGroupAttributes {
  productosGroupID: string,
  productoID: number,
  cantidad: number,
  contratoGroupID: string,
}
export interface IProductosGroupModel extends IProductosGroupAttributes, Model {}
export type IProductosGroupModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IProductosGroupModel;
};