import { Sequelize } from 'sequelize';

const sequelize = new Sequelize({
  dialect: 'mssql',
  database: 'esencialVerde',
  username: 'whiit',
  password: '12345678',
  host: 'localhost'
});

export default sequelize;
