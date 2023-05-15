import { Model, BuildOptions } from 'sequelize';

export interface IActoresAttributes {
  actorID: number,
  referenceID?: number,
  objectTypeID?: number,
  freeName?: any,
  cuenta: any,
}
export interface IActoresModel extends IActoresAttributes, Model {}
export type IActoresModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IActoresModel;
};