module.exports = (sequelize, DataTypes) => {
    const Panier = sequelize.define(
			"ClientPanier",
			{
				quantite: {
					type: DataTypes.INTEGER.UNSIGNED,
					allowNull: false,
				},
				ProduitId: {
					type: DataTypes.INTEGER.UNSIGNED,
					allowNull: false,
					references: {
						model: "produits",
						key: "id",
					},
				},
				ClientId: {
					type: DataTypes.INTEGER.UNSIGNED,
					allowNull: false,
					references: {
						model: "clients",
						key: "id",
					},
				},
			},
			{
				freezeTableName: true,
				tableName: "client_panier",
			}
		);
    return Panier
};
