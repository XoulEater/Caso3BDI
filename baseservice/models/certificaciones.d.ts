import { Model, BuildOptions } from 'sequelize';
export interface ICertificacionesAttributes {
  certificacionID: number,
  nombre?: string,
  claseDesechoID: number,
  durationY: number,
  enable: boolean,
}
export interface ICertificacionesModel extends ICertificacionesAttributes, Model {}
export type ICertificacionesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ICertificacionesModel;
};