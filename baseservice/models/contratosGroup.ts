import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    contratoGroupID: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "contratoGroupID"
    },
    contratoID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "contratoID",
      references: {
        key: "contratoID",
        model: "contratos_model"
      }
    },
    porcentaje: {
      type: DataTypes.DECIMAL,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "porcentaje"
    }
  };
  const options = {
    tableName: "contratosGroup",
    comment: "",
    indexes: []
  };
  const ContratosGroupModel = sequelize.define("contratosGroup_model", attributes, options);
  return ContratosGroupModel;
}