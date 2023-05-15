import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    movementLogID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "movementLogID"
    },
    posttime: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "posttime"
    },
    movementTypeID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: "0 = in EV\r\n1 = out EV\r\n2 = in SP\r\n3 = out SP",
      field: "movementTypeID",
      references: {
        key: "movementTypeID",
        model: "movementTypes_model"
      }
    },
    referenceID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "referenceID"
    },
    entrega: {
      type: varbinary,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "entrega"
    },
    recibe: {
      type: varbinary,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "recibe"
    },
    plantaID: {
      type: DataTypes.BIGINT,
      allowNull: true,
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
    sedeRecoID: {
      type: DataTypes.BIGINT,
      allowNull: true,
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
    sedeProduID: {
      type: DataTypes.BIGINT,
      allowNull: true,
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
    contratoID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "contratoID",
      references: {
        key: "contratoID",
        model: "contratos_model"
      }
    },
    desechoID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "desechoID"
    }
  };
  const options = {
    tableName: "movementLogs",
    comment: "",
    indexes: []
  };
  const MovementLogsModel = sequelize.define("movementLogs_model", attributes, options);
  return MovementLogsModel;
}