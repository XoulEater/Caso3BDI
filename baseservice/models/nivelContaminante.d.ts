import { Model, BuildOptions } from 'sequelize';
export interface INivelContaminanteAttributes {
  sedeProduID: number,
  nivel: number,
  endDate?: Date,
  startDate: Date,
  username: string,
  enable: boolean,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
}
export interface INivelContaminanteModel extends INivelContaminanteAttributes, Model {}
export type INivelContaminanteModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): INivelContaminanteModel;
};