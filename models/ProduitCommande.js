module.exports = (sequelize, DataTypes) => {
	const ProduitCommande = sequelize.define(
		"produits_commande",
		{
			quantite: {
				type: DataTypes.INTEGER.UNSIGNED,
				allowNull: false,
			},
			prix: {
				type: DataTypes.FLOAT,
				allowNull: true,
			},
		},
	);
	return ProduitCommande;
};
