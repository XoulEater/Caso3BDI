import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    sedeProduID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "sedeProduID",
      references: {
        key: "sedeProduID",
        model: "sedesProdu_model"
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
    tableName: "contactoXprodu",
    comment: "",
    indexes: []
  };
  const ContactoXproduModel = sequelize.define("contactoXprodu_model", attributes, options);
  return ContactoXproduModel;
}