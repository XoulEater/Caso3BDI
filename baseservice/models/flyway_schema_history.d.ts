import { Model, BuildOptions } from 'sequelize';
export interface IFlywaySchemaHistoryAttributes {
  installed_rank: number,
  version?: any,
  description?: any,
  type: any,
  script: any,
  checksum?: number,
  installed_by: any,
  installed_on: Date,
  execution_time: number,
  success: boolean,
}
export interface IFlywaySchemaHistoryModel extends IFlywaySchemaHistoryAttributes, Model {}
export type IFlywaySchemaHistoryModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IFlywaySchemaHistoryModel;
};