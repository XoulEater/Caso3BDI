import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    addressID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "addressID"
    },
    ciudadID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "ciudadID",
      references: {
        key: "ciudadID",
        model: "ciudades_model"
      }
    },
    zipcode: {
      type: nchar(9),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "zipcode"
    },
    location: {
      type: geography,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "location"
    }
  };
  const options = {
    tableName: "addresses",
    comment: "",
    indexes: []
  };
  const AddressesModel = sequelize.define("addresses_model", attributes, options);
  return AddressesModel;
}