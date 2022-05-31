module.exports = (sequelize, DataTypes) => {
  const Payement = sequelize.define("Payement", {
    date: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
      allowNull: false,
    },
  });
  Payement.associate = (models) => {
    Payement.belongsTo(models.Client, {
      foreignKey: "ClientId",
      onDelete: "CASCADE",
    });
    Payement.belongsTo(models.User, {
      foreignKey: "UserId",
      onDelete: "CASCADE",
    });
    Payement.belongsToMany(models.Vente, {
			through: models.ventes_payement,
			onDelete: "CASCADE",
		});
  };
  return Payement;
};
