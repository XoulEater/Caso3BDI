import { Sequelize, DataTypes, STRING} from 'sequelize';

const sequelize = new Sequelize('esencialVerde', 'whiit', '12345678', {
  host: 'localhost',
  dialect: 'mssql',
});

const Actores = sequelize.define("Actores", {
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
    type: DataTypes.STRING,
    allowNull: true,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "freeName"
  },
  cuenta: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "cuenta"
  }
}, {
  timestamps: false,
  freezeTableName: true
});

const sedesReco = sequelize.define("sedesReco", {
  sedeRecoID: {
    type: DataTypes.BIGINT,
    allowNull: false,
    defaultValue: null,
    primaryKey: true,
    autoIncrement: true,
    comment: null,
    field: "sedeRecoID"
  },
  empresaID: {
    type: DataTypes.BIGINT,
    allowNull: false,
    defaultValue: "((1))",
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "empresaID",
    references: {
      key: "empresaID",
      model: "empresas_model"
    }
  },
  addressID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "addressID",
    references: {
      key: "addressID",
      model: "addresses_model"
    }
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
  description: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "description"
  }
}, {
  timestamps: false,
  freezeTableName: true
});

const sedesProdu = sequelize.define("sedesProdu", {
  sedeProduID: {
    type: DataTypes.BIGINT,
    allowNull: false,
    defaultValue: null,
    primaryKey: true,
    autoIncrement: true,
    comment: null,
    field: "sedeProduID"
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
  },
  addressID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "addressID",
    references: {
      key: "addressID",
      model: "addresses_model"
    }
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
  balance: {
    type: DataTypes.DECIMAL(19, 4),
    allowNull: false,
    defaultValue: "((0))",
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "balance"
  },
  description: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "description"
  },
  industriaTypeID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "industriaTypeID",
    references: {
      key: "industriaTypeID",
      model: "industriaTypes_model"
    }
  }
}, {
  timestamps: false,
  freezeTableName: true
});



const transactionLogs = sequelize.define("transactionLogs", {
  transactionLogID: {
    type: DataTypes.BIGINT,
    allowNull: false,
    defaultValue: null,
    primaryKey: true,
    autoIncrement: true,
    comment: null,
    field: "transactionLogID"
  },
  transactionTypeID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "transactionTypeID",
    references: {
      key: "transactionTypeID",
      model: "transactionTypes_model"
    }
  },
  referenceID: {
    type: DataTypes.BIGINT,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "referenceID"
  },
  monto: {
    type: DataTypes.DECIMAL(19, 4),
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "monto"
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
      model: "Actores"
    }
  },
  discount: {
    type: DataTypes.DECIMAL(19, 4),
    allowNull: true,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "discount"
  },
  checksum: {
    type: DataTypes.BLOB('tiny'),
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
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "computer"
  },
  username: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "username"
  },
  monedaID: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: null,
    primaryKey: false,
    autoIncrement: false,
    comment: null,
    field: "monedaID",
    references: {
      key: "monedaID",
      model: "monedas_model"
    }
  },
},
  {
    timestamps: false,
    freezeTableName: true
  });

Actores.hasMany(transactionLogs, { foreignKey: 'actorID' });
transactionLogs.belongsTo(Actores, { foreignKey: 'actorID' });

async function showActores() {
  try {
    // const instance = await Actores.findAll({attributes : ['actorID']});

    //const instance2 = await sedesProdu.findAll({attributes : ['balance']});

    //const instance3 = await sedesReco.findAll({attributes : ['description']});

    //const instance4 = await transactionLogs.findAll();

    const result = await transactionLogs.findAll({
      attributes: [
        [sequelize.literal("DATEPART(WEEK, [posttime])"), 'Semana'],
        'actorID',
        [sequelize.fn('SUM', sequelize.col('monto')), 'totalAmount'],
      ],
      group: ['posttime', 'actorID'],
      order: [[sequelize.literal("DATEPART(WEEK, [posttime])"), 'ASC']],
    });

    return result

  } catch (error) {
    console.error('Error al obtener los usuarios:', error);
  }
}
export { sequelize, showActores };



