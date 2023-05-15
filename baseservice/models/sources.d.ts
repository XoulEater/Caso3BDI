import { Model, BuildOptions } from 'sequelize';
export interface ISourcesAttributes {
  sourceID: number,
  name: any,
  enable: boolean,
}
export interface ISourcesModel extends ISourcesAttributes, Model {}
export type ISourcesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ISourcesModel;
};