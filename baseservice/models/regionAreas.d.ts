import { Model, BuildOptions } from 'sequelize';
export interface IRegionAreasAttributes {
  regionID: number,
  ciudadID?: number,
  estadoID?: number,
  paisID?: number,
}
export interface IRegionAreasModel extends IRegionAreasAttributes, Model {}
export type IRegionAreasModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IRegionAreasModel;
};