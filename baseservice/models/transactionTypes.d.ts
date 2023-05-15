import { Model, BuildOptions } from 'sequelize';
export interface ITransactionTypesAttributes {
  transactionTypeID: number,
  name: any,
  enable: boolean,
}
export interface ITransactionTypesModel extends ITransactionTypesAttributes, Model {}
export type ITransactionTypesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ITransactionTypesModel;
};