import { Model, BuildOptions } from 'sequelize';
export interface IDesechosAttributes {
  desechoID: number,
  description: any,
  claseDesechoID: number,
  enable: boolean,
}
export interface IDesechosModel extends IDesechosAttributes, Model {}
export type IDesechosModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IDesechosModel;
};