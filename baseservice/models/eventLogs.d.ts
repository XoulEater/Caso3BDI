import { Model, BuildOptions } from 'sequelize';
export interface IEventLogsAttributes {
  eventID: number,
  posttime: Date,
  computer: any,
  username: any,
  checksum?: any,
  description: any,
  reference1: any,
  reference2?: any,
  value1: number,
  value2?: number,
  enable: boolean,
  sourceID: number,
  levelID: number,
  eventTID: number,
  objectTypeID: number,
}
export interface IEventLogsModel extends IEventLogsAttributes, Model {}
export type IEventLogsModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IEventLogsModel;
};