import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    sedeProduID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "sedeProduID"
    },
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
    addressID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "addressID",
      references: {
        key: "addressID",
        model: "addresses_model"
      }
    },
    enable: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: 1,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "enable"
    },
    balance: {
      type: money,
      allowNull: false,
      defaultValue: "((0))",
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "balance"
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
    industriaTypeID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "industriaTypeID",
      references: {
        key: "industriaTypeID",
        model: "industriaTypes_model"
      }
    }
  };
  const options = {
    tableName: "sedesProdu",
    comment: "",
    indexes: []
  };
  const SedesProduModel = sequelize.define("sedesProdu_model", attributes, options);
  return SedesProduModel;
}