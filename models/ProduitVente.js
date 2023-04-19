module.exports = (sequelize, DataTypes) => {
	const ProduitVente = sequelize.define(
		"produits_vente",
		{
			quantite: {
				type: DataTypes.FLOAT.UNSIGNED,
				allowNull: false,
			},
			prix: {
				type: DataTypes.FLOAT,
				allowNull: false,
			},
		},
		{
			freezeTableName: true,
			tableName: "produits_ventes",
		}
	);
	return ProduitVente;
};
