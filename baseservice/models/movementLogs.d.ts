import { Model, BuildOptions } from 'sequelize';
export interface IMovementLogsAttributes {
  movementLogID: number,
  posttime: Date,
  movementTypeID: number,
  referenceID?: number,
  entrega: any,
  recibe: any,
  plantaID?: number,
  sedeRecoID?: number,
  sedeProduID?: number,
  contratoID: number,
  desechoID?: number,
}
export interface IMovementLogsModel extends IMovementLogsAttributes, Model {}
export type IMovementLogsModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IMovementLogsModel;
};