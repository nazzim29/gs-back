module.exports = (sequelize, DataTypes) => {
  const Produit = sequelize.define("Produit", {
    quantite: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
    },
    prix: {
      type: DataTypes.FLOAT.UNSIGNED,
      allowNull: false,
    },
    contenance: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
    },
    remise: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      defaultValue: 0,
      max:100
    },
    featured: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: false,
    }
  });
  Produit.associate = (models) => {
    Produit.belongsToMany(models.Commande, {
      through: "produits_commande",
    });
    Produit.belongsToMany(models.Vente,{ through: models.produits_vente });
    Produit.belongsTo(models.TypeProduit, {
      foreignKey: {
        allowNull: false,
      },
      onDelete: "CASCADE",
      onUpdate: "CASCADE",
    });
    Produit.belongsTo(models.Couleur, {
      foreignKey: {
        allowNull: false,
      },
      onDelete: "CASCADE",
      onUpdate: "CASCADE",
    });
  };
  return Produit;
};
