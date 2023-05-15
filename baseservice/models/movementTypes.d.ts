import { Model, BuildOptions } from 'sequelize';
export interface IMovementTypesAttributes {
  movementTypeID: number,
  description: any,
  enable: boolean,
}
export interface IMovementTypesModel extends IMovementTypesAttributes, Model {}
export type IMovementTypesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IMovementTypesModel;
};