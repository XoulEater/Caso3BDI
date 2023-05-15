import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    reqGroupID: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "reqGroupID"
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
    cantidad: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "cantidad"
    },
    startDate: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "startDate"
    },
    endDate: {
      type: DataTypes.DATE,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "endDate"
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
    horarioID: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "horarioID",
      references: {
        key: "horarioID",
        model: "horario_model"
      }
    }
  };
  const options = {
    tableName: "reqGroups",
    comment: "",
    indexes: []
  };
  const ReqGroupsModel = sequelize.define("reqGroups_model", attributes, options);
  return ReqGroupsModel;
}