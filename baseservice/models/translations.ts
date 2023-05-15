import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    translationID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "translationID"
    },
    label: {
      type: nvarchar(100),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "label"
    },
    refenceID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "refenceID"
    },
    lenguageID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "lenguageID",
      references: {
        key: "lenguageID",
        model: "languages_model"
      }
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
    objectTypeID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "objectTypeID",
      references: {
        key: "objectTypeID",
        model: "objectTypes_model"
      }
    }
  };
  const options = {
    tableName: "translations",
    comment: "",
    indexes: []
  };
  const TranslationsModel = sequelize.define("translations_model", attributes, options);
  return TranslationsModel;
}