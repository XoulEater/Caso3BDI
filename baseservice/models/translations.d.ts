import { Model, BuildOptions } from 'sequelize';
export interface ITranslationsAttributes {
  translationID: number,
  label: any,
  refenceID: number,
  lenguageID: number,
  posttime: Date,
  objectTypeID: number,
}
export interface ITranslationsModel extends ITranslationsAttributes, Model {}
export type ITranslationsModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ITranslationsModel;
};