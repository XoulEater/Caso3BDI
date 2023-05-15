import { Model, BuildOptions } from 'sequelize';
export interface ISedesRecoAttributes {
  sedeRecoID: number,
  empresaID: number,
  addressID: number,
  enable: boolean,
  description: any,
}
export interface ISedesRecoModel extends ISedesRecoAttributes, Model {}
export type ISedesRecoModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ISedesRecoModel;
};