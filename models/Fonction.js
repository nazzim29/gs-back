module.exports = (sequelize, DataTypes) => {
  const Fonction = sequelize.define("Fonction", {
    nom: {
      type: DataTypes.STRING,
      allowNull: false,
      notEmpty: true,
    },
  });
  Fonction.associate = (models) => {
    Fonction.hasMany(models.User,{
        foreignKey:{
            allowNull:false,
        },
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE'
    });
    
  };

  return Fonction;
};
