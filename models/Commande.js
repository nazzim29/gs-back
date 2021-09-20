module.exports = (sequelize, DataTypes) => {
  const Commande = sequelize.define("Commande", {
    date: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    vendu: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: false,
    },
  });
  Commande.associate = (models) => {
    Commande.belongsTo(models.Client, {
      foreignKey: {
        allowNull: false,
      },
      onDelete: "CASCADE",
      onUpdate: "CASCADE",
    });
    Commande.belongsTo(models.User, {
      foreignKey: {
        allowNull: false,
      },
      onDelete: "CASCADE",
      onUpdate: "CASCADE",
    });
  };
  return Commande;
};
