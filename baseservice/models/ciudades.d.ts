import { Model, BuildOptions } from 'sequelize';
export interface ICiudadesAttributes {
  ciudadID: number,
  nombre: any,
  estadoID: number,
  enable: boolean,
}
export interface ICiudadesModel extends ICiudadesAttributes, Model {}
export type ICiudadesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ICiudadesModel;
};