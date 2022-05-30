module.exports = (sequelize, DataTypes) => {
  const func = sequelize.define("autorisations_fonctions", {
    type: {
      type: DataTypes.ENUM("own", "all"),
      allowNull: false,
    },
  });
  return func;
};
