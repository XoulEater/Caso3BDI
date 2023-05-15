import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    plantaID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "plantaID",
      references: {
        key: "plantaID",
        model: "plantas_model"
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
    tableName: "contactoXplanta",
    comment: "",
    indexes: []
  };
  const ContactoXplantaModel = sequelize.define("contactoXplanta_model", attributes, options);
  return ContactoXplantaModel;
}