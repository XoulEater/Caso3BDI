import { Model, BuildOptions } from 'sequelize';
export interface IContainerTypesAttributes {
  containerTypeID: number,
  modeloID: number,
  weight: number,
  capacity: number,
  claseDesechoID: number,
  description: any,
  cantInUse?: number,
  cantNotInUse?: number,
  cantOnRepair?: number,
  cantAvailable?: number,
  enable: boolean,
}
export interface IContainerTypesModel extends IContainerTypesAttributes, Model {}
export type IContainerTypesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IContainerTypesModel;
};