import { Model, BuildOptions } from 'sequelize';
export interface ICertiXempresaAttributes {
  certificacionID: number,
  empresaID: number,
  expiration: Date,
  checksum?: any,
  createdAt: Date,
  updatedAt?: Date,
  computer: string,
  username: string,
  enable: boolean,
}
export interface ICertiXempresaModel extends ICertiXempresaAttributes, Model {}
export type ICertiXempresaModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ICertiXempresaModel;
};