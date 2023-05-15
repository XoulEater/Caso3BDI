import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    industriaTypeID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "industriaTypeID"
    },
    description: {
      type: nvarchar(50),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "description"
    },
    enable: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: 1,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "enable"
    }
  };
  const options = {
    tableName: "industriaTypes",
    comment: "",
    indexes: []
  };
  const IndustriaTypesModel = sequelize.define("industriaTypes_model", attributes, options);
  return IndustriaTypesModel;
}