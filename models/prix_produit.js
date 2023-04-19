module.exports = (sequelize, DataTypes) => {
    const PrixProduit = sequelize.define(
			"PrixProduit",
			{
				prix: {
					type: DataTypes.FLOAT,
					allowNull: false,
				},
			},
			{
				freezeTableName: true,
				tableName: "prix_produits",
			}
		);
    PrixProduit.associate = (models) => {
        PrixProduit.belongsTo(models.Produit, {
            foreignKey: {
                allowNull: false,
            },
            onDelete: "CASCADE",
            onUpdate: "CASCADE",
        });
    }
	return PrixProduit;
};
