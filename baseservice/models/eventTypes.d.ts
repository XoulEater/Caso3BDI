import { Model, BuildOptions } from 'sequelize';
export interface IEventTypesAttributes {
  eventTID: number,
  enable: boolean,
  name: any,
}
export interface IEventTypesModel extends IEventTypesAttributes, Model {}
export type IEventTypesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IEventTypesModel;
};