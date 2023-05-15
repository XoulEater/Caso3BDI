import { Sequelize, DataTypes } from 'sequelize';
export default function (sequelize: Sequelize) {
  const attributes = {
    horarioID: {
      type: DataTypes.UUIDV4,
      allowNull: false,
      defaultValue: null,
      primaryKey: true,
      autoIncrement: false,
      comment: null,
      field: "horarioID"
    },
    dia: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "dia"
    },
    startHour: {
      type: DataTypes.TIME,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "startHour"
    },
    endHour: {
      type: DataTypes.TIME,
      allowNull: false,
      defaultValue: null,
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "endHour"
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
    weekLapse: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: "((1))",
      primaryKey: false,
      autoIncrement: false,
      comment: null,
      field: "weekLapse"
    }
  };
  const options = {
    tableName: "horario",
    comment: "",
    indexes: []
  };
  const HorarioModel = sequelize.define("horario_model", attributes, options);
  return HorarioModel;
}