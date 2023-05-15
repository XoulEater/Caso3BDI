import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    contratoID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: true,
      comment: null,
      field: "contratoID"
    },
    startDate: {
      type: DataTypes.DATEONLY,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "startDate"
    },
    endDate: {
      type: DataTypes.DATEONLY,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "endDate"
    },
    recoType: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: 0,
      primaryKey: false,
      autoIncrement: false,
      comment: "0 = autorecolect\r\n1 = normal recolect\r\n\r\n",
      field: "recoType"
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
    reqGroupID: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "reqGroupID"
    },
    comisionID: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "comisionID"
    },
    checksum: {
      type: varbinary,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "checksum"
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "createdAt"
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "updatedAt"
    },
    computer: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "computer"
    },
    username: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "username"
    },
    precio: {
      type: money,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "precio"
    },
    empresaID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "empresaID",
      references: {
        key: "empresaID",
        model: "empresas_model"
      }
    }
  };
  const options = {
    tableName: "contratos",
    comment: "",
    indexes: []
  };
  const ContratosModel = sequelize.define("contratos_model", attributes, options);
  return ContratosModel;
}