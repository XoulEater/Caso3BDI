import { Model, BuildOptions } from 'sequelize';
export interface IStatusContainersAttributes {
  statusContainerID: number,
  description: any,
  enable: boolean,
}
export interface IStatusContainersModel extends IStatusContainersAttributes, Model {}
export type IStatusContainersModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IStatusContainersModel;
};