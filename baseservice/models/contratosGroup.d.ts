import { Model, BuildOptions } from 'sequelize';
export interface IContratosGroupAttributes {
  contratoGroupID: string,
  contratoID: number,
  porcentaje: number,
}
export interface IContratosGroupModel extends IContratosGroupAttributes, Model {}
export type IContratosGroupModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContratosGroupModel;
};