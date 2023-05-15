import { Model, BuildOptions } from 'sequelize';
export interface IClasesDesechoAttributes {
  claseDesechoID: number,
  recyclable: boolean,
  description: any,
}
export interface IClasesDesechoModel extends IClasesDesechoAttributes, Model {}
export type IClasesDesechoModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IClasesDesechoModel;
};