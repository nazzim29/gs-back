module.exports = (sequelize, DataTypes) => {
  const Payement = sequelize.define("Payement", {
    montant: {
      type: DataTypes.DECIMAL,
      allowNull: false,
    },
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
      through: "VentePayement",
      onDelete: "CASCADE",
    });
  };
  return Payement;
};
