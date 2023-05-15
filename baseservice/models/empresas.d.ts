import { Model, BuildOptions } from 'sequelize';
export interface IEmpresasAttributes {
  empresaID: number,
  description: any,
  type: number,
  enable: boolean,
  paisID: number,
}
export interface IEmpresasModel extends IEmpresasAttributes, Model {}
export type IEmpresasModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IEmpresasModel;
};