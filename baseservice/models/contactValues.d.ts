import { Model, BuildOptions } from 'sequelize';
export interface IContactValuesAttributes {
  contactValueID: number,
  contactTypeID: number,
  value: any,
  posttime: Date,
  enable: boolean,
}
export interface IContactValuesModel extends IContactValuesAttributes, Model {}
export type IContactValuesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContactValuesModel;
};