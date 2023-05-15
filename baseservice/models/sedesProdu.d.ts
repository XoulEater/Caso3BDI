import { Model, BuildOptions } from 'sequelize';
export interface ISedesProduAttributes {
  sedeProduID: number,
  empresaID: number,
  addressID: number,
  enable: boolean,
  balance: any,
  description: any,
  industriaTypeID: number,
}
export interface ISedesProduModel extends ISedesProduAttributes, Model {}
export type ISedesProduModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ISedesProduModel;
};