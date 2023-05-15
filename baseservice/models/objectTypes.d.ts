import { Model, BuildOptions } from 'sequelize';
export interface IObjectTypesAttributes {
  objectTypeID: number,
  name: any,
  enable: boolean,
}
export interface IObjectTypesModel extends IObjectTypesAttributes, Model {}
export type IObjectTypesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IObjectTypesModel;
};