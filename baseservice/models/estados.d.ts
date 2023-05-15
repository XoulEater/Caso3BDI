import { Model, BuildOptions } from 'sequelize';
export interface IEstadosAttributes {
  estadoID: number,
  nombre: any,
  paisID: number,
  enable: boolean,
}
export interface IEstadosModel extends IEstadosAttributes, Model {}
export type IEstadosModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IEstadosModel;
};