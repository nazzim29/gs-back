module.exports = (sequelize, DataTypes) => {
	const Couleur = sequelize.define(
		"Couleur",
		{
			nom: {
				type: DataTypes.STRING,
				allowNull: false,
			},
			code: {
				type: DataTypes.STRING,
				allowNull: false,
				unique: true,
			},
		},
		{
			paranoid: true,
			freezeTableName: true,
			tableName: "couleurs",
		}
	);
	Couleur.associate = (models) => {
		// Couleur.hasMany(models.Produit)
	};
	return Couleur;
};
