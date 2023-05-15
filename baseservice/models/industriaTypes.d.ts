import { Model, BuildOptions } from 'sequelize';
export interface IIndustriaTypesAttributes {
  industriaTypeID: number,
  description: any,
  enable: boolean,
}
export interface IIndustriaTypesModel extends IIndustriaTypesAttributes, Model {}
export type IIndustriaTypesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IIndustriaTypesModel;
};