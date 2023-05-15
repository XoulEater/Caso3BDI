import { Model, BuildOptions } from 'sequelize';
export interface IPaisesAttributes {
  paisID: number,
  nombre: any,
  enable: boolean,
}
export interface IPaisesModel extends IPaisesAttributes, Model {}
export type IPaisesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IPaisesModel;
};