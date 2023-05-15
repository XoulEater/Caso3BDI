import { Model, BuildOptions } from 'sequelize';
export interface ISysdiagramsAttributes {
  name: any,
  principal_id: number,
  diagram_id: number,
  version?: number,
  definition?: any,
}
export interface ISysdiagramsModel extends ISysdiagramsAttributes, Model {}
export type ISysdiagramsModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): ISysdiagramsModel;
};