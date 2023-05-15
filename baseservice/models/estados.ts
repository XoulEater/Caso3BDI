import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    estadoID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "estadoID"
    },
    nombre: {
      type: nvarchar(30),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "nombre"
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
    tableName: "estados",
    comment: "",
    indexes: []
  };
  const EstadosModel = sequelize.define("estados_model", attributes, options);
  return EstadosModel;
}