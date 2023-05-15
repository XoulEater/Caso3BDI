import { Model, BuildOptions } from 'sequelize';
export interface IComisionesAttributes {
  comisionID: string,
  porcentaje: number,
  actorID: number,
}
export interface IComisionesModel extends IComisionesAttributes, Model {}
export type IComisionesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IComisionesModel;
};