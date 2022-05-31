module.exports = (sequelize, DataTypes) => {
	const ProduitCommande = sequelize.define("ventes_payement", {
		
		montant: {
			type: DataTypes.FLOAT.UNSIGNED,
			allowNull: true,
		},
	});
	return ProduitCommande;
};
