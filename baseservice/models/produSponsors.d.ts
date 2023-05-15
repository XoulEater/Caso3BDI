import { Model, BuildOptions } from 'sequelize';
export interface IProduSponsorsAttributes {
  produSponsorID: number,
  sedeProduID: number,
  ciudadID?: number,
  estadoID?: number,
  regionID?: number,
  claseDesechoID?: number,
  sedeProduID2?: number,
  industriaTypeID?: number,
  porcentaje: number,
  contratoID: number,
}
export interface IProduSponsorsModel extends IProduSponsorsAttributes, Model {}
export type IProduSponsorsModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IProduSponsorsModel;
};