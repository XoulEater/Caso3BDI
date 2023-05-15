import { Model, BuildOptions } from 'sequelize';
export interface IRegionesAttributes {
  regionID: number,
  name: any,
  enable: boolean,
}
export interface IRegionesModel extends IRegionesAttributes, Model {}
export type IRegionesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IRegionesModel;
};