import { Model, BuildOptions } from 'sequelize';
export interface IMarcasAttributes {
  brandID: number,
  name: any,
  enable: boolean,
}
export interface IMarcasModel extends IMarcasAttributes, Model {}
export type IMarcasModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IMarcasModel;
};