import { Model, BuildOptions } from 'sequelize';
export interface IContainersXmovLAttributes {
  movementLogID: number,
  containerID: number,
  durability: number,
  tweight: number,
  statusContainerID: number,
}
export interface IContainersXmovLModel extends IContainersXmovLAttributes, Model {}
export type IContainersXmovLModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContainersXmovLModel;
};