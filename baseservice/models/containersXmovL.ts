import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    movementLogID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "movementLogID",
      references: {
        key: "movementLogID",
        model: "movementLogs_model"
      }
    },
    containerID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "containerID",
      references: {
        key: "containerID",
        model: "containers_model"
      }
    },
    durability: {
      type: DataTypes.DECIMAL,
      allowNull: false,
      defaultValue: "((100.00))",
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "durability"
    },
    tweight: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "tweight"
    },
    statusContainerID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "statusContainerID",
      references: {
        key: "statusContainerID",
        model: "statusContainers_model"
      }
    }
  };
  const options = {
    tableName: "containersXmovL",
    comment: "",
    indexes: []
  };
  const ContainersXmovLModel = sequelize.define("containersXmovL_model", attributes, options);
  return ContainersXmovLModel;
}