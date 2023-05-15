import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    plantaLogID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "plantaLogID"
    },
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
    claseDesechoID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "claseDesechoID",
      references: {
        key: "claseDesechoID",
        model: "clasesDesecho_model"
      }
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "quantity"
    },
    costo: {
      type: money,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "costo"
    },
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
    checksum: {
      type: varbinary,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "checksum"
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "createdAt"
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "updatedAt"
    },
    computer: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "computer"
    },
    username: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "username"
    }
  };
  const options = {
    tableName: "plantaLogs",
    comment: "",
    indexes: []
  };
  const PlantaLogsModel = sequelize.define("plantaLogs_model", attributes, options);
  return PlantaLogsModel;
}