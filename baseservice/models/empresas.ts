import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    empresaID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "empresaID"
    },
    description: {
      type: nvarchar(45),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "description"
    },
    type: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "type"
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
    paisID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "paisID",
      references: {
        key: "paisID",
        model: "paises_model"
      }
    }
  };
  const options = {
    tableName: "empresas",
    comment: "",
    indexes: []
  };
  const EmpresasModel = sequelize.define("empresas_model", attributes, options);
  return EmpresasModel;
}