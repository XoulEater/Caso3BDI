import { Model, BuildOptions } from 'sequelize';
export interface IPlantaLogsAttributes {
  plantaLogID: number,
  plantaID: number,
  claseDesechoID: number,
  quantity: number,
  costo: any,
  sedeProduID: number,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
}
export interface IPlantaLogsModel extends IPlantaLogsAttributes, Model {}
export type IPlantaLogsModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IPlantaLogsModel;
};