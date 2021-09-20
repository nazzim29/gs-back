const fs = require("fs");
const path = require("path");
const Sequelize = require("sequelize");

const db = {};
const sequelize = new Sequelize(process.env.DB_NAME,process.env.DB_USERNAME,process.env.DB_PASSWORD,{
    dialect: "mysql",
    host: process.env.DB_URL,
  });
console.log('Registring Models ...')
fs.readdirSync(__dirname)
  .filter((file) => file !== "index.js")
  .forEach((file) => {
    const model = require(path.join(__dirname, file))(sequelize,Sequelize.DataTypes);
    db[model.name] = model;
  });
// console.log(db)
Object.keys(db).forEach(function (modelName) {
  if ("associate" in db[modelName]) {
    // console.log(modelName)
    db[modelName].associate(db);
  }
});
db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;
