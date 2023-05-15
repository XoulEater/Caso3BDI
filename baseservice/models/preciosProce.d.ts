import { Model, BuildOptions } from 'sequelize';
export interface IPreciosProceAttributes {
  startDate: Date,
  endDate?: Date,
  precio: any,
  regionID?: number,
  enable: boolean,
  procesoID: number,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
}
export interface IPreciosProceModel extends IPreciosProceAttributes, Model {}
export type IPreciosProceModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IPreciosProceModel;
};