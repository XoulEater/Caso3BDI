import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    statusContainerID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "statusContainerID"
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
    tableName: "statusContainers",
    comment: "",
    indexes: []
  };
  const StatusContainersModel = sequelize.define("statusContainers_model", attributes, options);
  return StatusContainersModel;
}