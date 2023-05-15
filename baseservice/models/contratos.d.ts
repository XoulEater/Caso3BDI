import { Model, BuildOptions } from 'sequelize';
export interface IContratosAttributes {
  contratoID: number,
  startDate: Date,
  endDate?: Date,
  recoType: boolean,
  sedeProduID?: number,
  sedeRecoID?: number,
  reqGroupID: string,
  comisionID: string,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
  precio: any,
  empresaID: number,
}
export interface IContratosModel extends IContratosAttributes, Model {}
export type IContratosModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContratosModel;
};