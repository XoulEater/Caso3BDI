import { Model, BuildOptions } from 'sequelize';
export interface IModelosAttributes {
  modeloID: number,
  name: any,
  brandID: number,
  year: number,
}
export interface IModelosModel extends IModelosAttributes, Model {}
export type IModelosModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IModelosModel;
};