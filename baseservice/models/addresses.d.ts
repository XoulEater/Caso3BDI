import { Model, BuildOptions } from 'sequelize';
export interface IAddressesAttributes {
  addressID: number,
  ciudadID: number,
  zipcode: any,
  location: any,
}
export interface IAddressesModel extends IAddressesAttributes, Model {}
export type IAddressesModelStatic = typeof Model & {
  new (values?: object, options?: BuildOptions): IAddressesModel;
};