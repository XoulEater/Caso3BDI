import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    contactTypeID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "contactTypeID"
    },
    name: {
      type: nvarchar(25),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "name"
    }
  };
  const options = {
    tableName: "contactTypes",
    comment: "",
    indexes: []
  };
  const ContactTypesModel = sequelize.define("contactTypes_model", attributes, options);
  return ContactTypesModel;
}