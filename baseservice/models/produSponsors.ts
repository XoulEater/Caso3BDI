import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    produSponsorID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: false,
      comment: null,
      field: "produSponsorID"
    },
    sedeProduID: {
      type: DataTypes.BIGINT,
      allowNull: false,
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
    ciudadID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "ciudadID",
      references: {
        key: "ciudadID",
        model: "ciudades_model"
      }
    },
    estadoID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "estadoID",
      references: {
        key: "estadoID",
        model: "estados_model"
      }
    },
    regionID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "regionID",
      references: {
        key: "regionID",
        model: "regiones_model"
      }
    },
    claseDesechoID: {
      type: DataTypes.INTEGER,
      allowNull: true,
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
    sedeProduID2: {
      type: DataTypes.BIGINT,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "sedeProduID2",
      references: {
        key: "sedeProduID",
        model: "sedesProdu_model"
      }
    },
    industriaTypeID: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "industriaTypeID",
      references: {
        key: "industriaTypeID",
        model: "industriaTypes_model"
      }
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
    contratoID: {
      type: DataTypes.BIGINT,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "contratoID",
      references: {
        key: "contratoID",
        model: "contratos_model"
      }
    }
  };
  const options = {
    tableName: "produSponsors",
    comment: "",
    indexes: []
  };
  const ProduSponsorsModel = sequelize.define("produSponsors_model", attributes, options);
  return ProduSponsorsModel;
}