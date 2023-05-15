import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    sedeRecoID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "sedeRecoID",
      references: {
        key: "sedeRecoID",
        model: "sedesReco_model"
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
    tableName: "contactoXreco",
    comment: "",
    indexes: []
  };
  const ContactoXrecoModel = sequelize.define("contactoXreco_model", attributes, options);
  return ContactoXrecoModel;
}