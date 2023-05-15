import { Model, BuildOptions } from 'sequelize';
export interface IContactTypesAttributes {
  contactTypeID: number,
  name: any,
}
export interface IContactTypesModel extends IContactTypesAttributes, Model {}
export type IContactTypesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContactTypesModel;
};