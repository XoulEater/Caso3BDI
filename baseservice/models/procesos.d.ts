import { Model, BuildOptions } from 'sequelize';
export interface IProcesosAttributes {
  procesoID: number,
  desechoID: number,
  description: any,
  enable: boolean,
}
export interface IProcesosModel extends IProcesosAttributes, Model {}
export type IProcesosModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IProcesosModel;
};