import { Model, BuildOptions } from 'sequelize';
export interface ILevelsAttributes {
  levelID: number,
  name: any,
  enable: boolean,
}
export interface ILevelsModel extends ILevelsAttributes, Model {}
export type ILevelsModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ILevelsModel;
};