import { Model, BuildOptions } from 'sequelize';
export interface IReqGroupsAttributes {
  reqGroupID: string,
  claseDesechoID: number,
  cantidad: number,
  startDate: Date,
  endDate?: Date,
  enable: boolean,
  horarioID: string,
}
export interface IReqGroupsModel extends IReqGroupsAttributes, Model {}
export type IReqGroupsModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IReqGroupsModel;
};