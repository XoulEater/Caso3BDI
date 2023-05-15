import { Model, BuildOptions } from 'sequelize';
export interface IPlantasAttributes {
  plantaID: number,
  addressID: number,
  description: any,
  enable: boolean,
}
export interface IPlantasModel extends IPlantasAttributes, Model {}
export type IPlantasModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IPlantasModel;
};