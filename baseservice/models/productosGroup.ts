import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    productosGroupID: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: false,
      comment: null,
      field: "productosGroupID"
    },
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
    cantidad: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "cantidad"
    },
    contratoGroupID: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "contratoGroupID"
    }
  };
  const options = {
    tableName: "productosGroup",
    comment: "",
    indexes: []
  };
  const ProductosGroupModel = sequelize.define("productosGroup_model", attributes, options);
  return ProductosGroupModel;
}