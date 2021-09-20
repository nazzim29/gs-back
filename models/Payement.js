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
    Payement.belongsToMany(models.Commande, {
      through: "payements_commande",
    });
    Payement.belongsToMany(models.Vente, {
      through: "payements_vente",
    });
  };
  return Payement;
};
