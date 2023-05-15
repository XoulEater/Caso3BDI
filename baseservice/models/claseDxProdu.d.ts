import { Model, BuildOptions } from 'sequelize';
export interface IClaseDxProduAttributes {
  productoID: number,
  claseDesechoID: number,
  cantidad: number,
}
export interface IClaseDxProduModel extends IClaseDxProduAttributes, Model {}
export type IClaseDxProduModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IClaseDxProduModel;
};