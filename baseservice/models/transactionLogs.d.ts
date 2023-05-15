import { Model, BuildOptions } from 'sequelize';
export interface ITransactionLogsAttributes {
  transactionLogID: number,
  transactionTypeID: number,
  referenceID: number,
  monto: any,
  posttime: Date,
  actorID: number,
  discount?: any,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
  monedaID: number,
}
export interface ITransactionLogsModel extends ITransactionLogsAttributes, Model {}
export type ITransactionLogsModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ITransactionLogsModel;
};