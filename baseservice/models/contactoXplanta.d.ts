import { Model, BuildOptions } from 'sequelize';
export interface IContactoXplantaAttributes {
  plantaID: number,
  contactValueID: number,
}
export interface IContactoXplantaModel extends IContactoXplantaAttributes, Model {}
export type IContactoXplantaModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContactoXplantaModel;
};