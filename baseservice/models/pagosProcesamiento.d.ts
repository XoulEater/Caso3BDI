import { Model, BuildOptions } from 'sequelize';
export interface IPagosProcesamientoAttributes {
  pagoProcesamientoID: number,
  posttime: Date,
  monto: any,
  plantaID: number,
  contratoID: number,
  desechoID: number,
  cantidad: number,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
  monedaID: number,
}
export interface IPagosProcesamientoModel extends IPagosProcesamientoAttributes, Model {}
export type IPagosProcesamientoModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IPagosProcesamientoModel;
};