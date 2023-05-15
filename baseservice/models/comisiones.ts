import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    comisionID: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "comisionID"
    },
    porcentaje: {
      type: DataTypes.DECIMAL,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "porcentaje"
    },
    actorID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "actorID",
      references: {
        key: "actorID",
        model: "actores_model"
      }
    }
  };
  const options = {
    tableName: "comisiones",
    comment: "",
    indexes: []
  };
  const ComisionesModel = sequelize.define("comisiones_model", attributes, options);
  return ComisionesModel;
}