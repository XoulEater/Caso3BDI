import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    empresaID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "empresaID",
      references: {
        key: "empresaID",
        model: "empresas_model"
      }
    },
    contactValueID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "contactValueID",
      references: {
        key: "contactValueID",
        model: "contactValues_model"
      }
    }
  };
  const options = {
    tableName: "contactoXempresa",
    comment: "",
    indexes: []
  };
  const ContactoXempresaModel = sequelize.define("contactoXempresa_model", attributes, options);
  return ContactoXempresaModel;
}