import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    actorID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "actorID"
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
    objectTypeID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "objectTypeID",
      references: {
        key: "objectTypeID",
        model: "objectTypes_model"
      }
    },
    freeName: {
      type: nvarchar(50),
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "freeName"
    },
    cuenta: {
      type: nvarchar(20),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "cuenta"
    }
  };
  const options = {
    tableName: "actores",
    comment: "",
    indexes: []
  };
  const ActoresModel = sequelize.define("actores_model", attributes, options);
  return ActoresModel;
}