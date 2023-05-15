import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    claseDesechoID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "claseDesechoID"
    },
    recyclable: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: 0,
      primaryKey: false,
      autoIncrement: false,
      comment: "0 = ",
      field: "recyclable"
    },
    description: {
      type: nvarchar(25),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "description"
    }
  };
  const options = {
    tableName: "clasesDesecho",
    comment: "",
    indexes: []
  };
  const ClasesDesechoModel = sequelize.define("clasesDesecho_model", attributes, options);
  return ClasesDesechoModel;
}