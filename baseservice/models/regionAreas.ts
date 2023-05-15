import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    regionID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "regionID",
      references: {
        key: "regionID",
        model: "regiones_model"
      }
    },
    ciudadID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "ciudadID",
      references: {
        key: "ciudadID",
        model: "ciudades_model"
      }
    },
    estadoID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "estadoID",
      references: {
        key: "estadoID",
        model: "estados_model"
      }
    },
    paisID: {
      type: DataTypes.INTEGER,
      allowNull: true,
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
    tableName: "regionAreas",
    comment: "",
    indexes: []
  };
  const RegionAreasModel = sequelize.define("regionAreas_model", attributes, options);
  return RegionAreasModel;
}