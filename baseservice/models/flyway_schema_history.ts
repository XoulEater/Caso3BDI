import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    installed_rank: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: false,
      comment: null,
      field: "installed_rank",
      unique: "flyway_schema_history_pk"
    },
    version: {
      type: nvarchar(50),
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "version"
    },
    description: {
      type: nvarchar(200),
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "description"
    },
    type: {
      type: nvarchar(20),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "type"
    },
    script: {
      type: nvarchar(1000),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "script"
    },
    checksum: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "checksum"
    },
    installed_by: {
      type: nvarchar(100),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "installed_by"
    },
    installed_on: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: "(getdate())",
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "installed_on"
    },
    execution_time: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "execution_time"
    },
    success: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: 0,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "success"
    }
  };
  const options = {
    tableName: "flyway_schema_history",
    comment: "",
    indexes: [{
      name: "flyway_schema_history_s_idx",
      unique: false,
      fields: ["success"]
    }]
  };
  const FlywaySchemaHistoryModel = sequelize.define("flyway_schema_history_model", attributes, options);
  return FlywaySchemaHistoryModel;
}