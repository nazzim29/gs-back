module.exports = (sequelize, DataTypes) => {
	const ProduitCommande = sequelize.define(
		"ventes_payement",
		{
			montant: {
				type: DataTypes.FLOAT.UNSIGNED,
				allowNull: true,
			},
		},
		{
			freezeTableName: true,
			tableName: "ventes_payements",
		}
	);
	return ProduitCommande;
};
