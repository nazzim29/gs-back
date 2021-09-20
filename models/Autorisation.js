module.exports = (sequelize, DataTypes) => {
  const Autorisation = sequelize.define("Autorisation", {
    nom: {
      type: DataTypes.STRING,
      unique: true,
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  });

  Autorisation.associate = (models) => {
    Autorisation.belongsToMany(models.Fonction, {
      through: "autorisations_fonctions",
    });
  };

  return Autorisation;
};
