import { Model, BuildOptions } from 'sequelize';
export interface IContactoXempresaAttributes {
  empresaID: number,
  contactValueID: number,
}
export interface IContactoXempresaModel extends IContactoXempresaAttributes, Model {}
export type IContactoXempresaModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContactoXempresaModel;
};