import { Model, BuildOptions } from 'sequelize';
export interface ILanguagesAttributes {
  lenguageID: number,
  description?: any,
  enable: boolean,
}
export interface ILanguagesModel extends ILanguagesAttributes, Model {}
export type ILanguagesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ILanguagesModel;
};