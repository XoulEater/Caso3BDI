import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    productoID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "productoID",
      references: {
        key: "productoID",
        model: "productos_model"
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
    cantidad: {
      type: DataTypes.FLOAT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "cantidad"
    }
  };
  const options = {
    tableName: "claseDxProdu",
    comment: "",
    indexes: []
  };
  const ClaseDxProduModel = sequelize.define("claseDxProdu_model", attributes, options);
  return ClaseDxProduModel;
}