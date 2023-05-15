import { Model, BuildOptions } from 'sequelize';
export interface IHorarioAttributes {
  horarioID: string,
  dia: number,
  startHour: any,
  endHour: any,
  enable: boolean,
  weekLapse: number,
}
export interface IHorarioModel extends IHorarioAttributes, Model {}
export type IHorarioModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IHorarioModel;
};