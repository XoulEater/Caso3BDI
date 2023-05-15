import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    sedeRecoID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "sedeRecoID"
    },
    empresaID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: "((1))",
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
    description: {
      type: nvarchar(50),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "description"
    }
  };
  const options = {
    tableName: "sedesReco",
    comment: "",
    indexes: []
  };
  const SedesRecoModel = sequelize.define("sedesReco_model", attributes, options);
  return SedesRecoModel;
}