import { Model, BuildOptions } from 'sequelize';
export interface IContactoXproduAttributes {
  sedeProduID: number,
  contactValueID: number,
}
export interface IContactoXproduModel extends IContactoXproduAttributes, Model {}
export type IContactoXproduModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContactoXproduModel;
};