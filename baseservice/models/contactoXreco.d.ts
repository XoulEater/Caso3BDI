import { Model, BuildOptions } from 'sequelize';
export interface IContactoXrecoAttributes {
  sedeRecoID: number,
  contactValueID: number,
}
export interface IContactoXrecoModel extends IContactoXrecoAttributes, Model {}
export type IContactoXrecoModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContactoXrecoModel;
};