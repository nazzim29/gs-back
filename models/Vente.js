module.exports = (sequelize, DataTypes) => {
	const Vente = sequelize.define(
		"Vente",
		{
			date: {
				type: DataTypes.DATE,
				allowNull: false,
				defaultValue: DataTypes.NOW,
			},
			etat: {
				type: DataTypes.ENUM("en cours de traitement", "en cours de livraison", "livrée"),
				allowNull: false,
				defaultValue: "en attente",
			}, 
		},
		{
			paranoid: true,
		}
	);

	Vente.associate = (models) => {
        Vente.addScope(
            "defaultScope",
            {
                include: [
                    {
                        model: models.Client,
                        attributes: [
                            "id",
                            "raisonSociale",
                            "numero",
                            "numeroSecondaire",
                            "typeClientId",
                        ],
                        include: "TypeClient",
                        where: { deletedAt: null },
                    },
                    {
                        model: models.User,
                        attributes: {
                            exclude: ["password", "createdAt", "updatedAt", "deletedAt"],
                        },
                    },
                    {
                        model: models.Produit,
                        include:[models.TypeProduit,models.Couleur]
                    }
                ],
                attributes: {
                    include: [
                        [
                            sequelize.literal(
                                "(SELECT SUM(produits_ventes.quantite * produits_ventes.prix) AS montant FROM  ventes LEFT JOIN produits_ventes ON ventes.id = produits_ventes.VenteId LEFT JOIN produits ON produits.id = produits_ventes.ProduitId WHERE ventes.id = Vente.id)"
                            ),
                            "montant",
                        ],
                    ],
                    exclude: ["ClientId", "UserId"],
                },
            },
            { override: true }
        );
		Vente.belongsTo(models.Client);
		Vente.belongsTo(models.User);
		Vente.belongsToMany(models.Produit, {
			through: models.produits_vente,
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
	};
	return Vente;
};
