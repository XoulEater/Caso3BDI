import { Model, BuildOptions } from 'sequelize';
export interface IContainersAttributes {
  containerID: number,
  durability: number,
  containerTypeID: number,
  enable: boolean,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
}
export interface IContainersModel extends IContainersAttributes, Model {}
export type IContainersModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContainersModel;
};