module.exports = (sequelize, DataTypes) => {
	const Commande = sequelize.define(
		"Commande",
		{
			etat: {
				type: DataTypes.ENUM("en negiciation", "valide admin", "valide client","vendu"),
				allowNull: false,
				defaultValue: "en negiciation",
			},
			validationClient: {
				type: DataTypes.BOOLEAN,
				allowNull: false,
				defaultValue: false,
			},
			validationAdmin: {
				type: DataTypes.BOOLEAN,
				allowNull: false,
				defaultValue: false,
			},
			bonDeCommande: {
				type: DataTypes.STRING,
				allowNull:true,
			}
		},
		{
			paranoid: true,
			// hooks: {
			// 	async afterfindasync(commande,op,fn) {
			// 		commande.montant = (await commande.getProduits()).reduce(
			// 			(sum, produit) => {
			// 				console.log(produit);
			// 				return (
			// 					sum + produit.produits_commande.prix * produit.produits_commande
			// 				);
			// 			},
			// 			0
			// 		);
			// 		return fn(null,commande)
			// 	},
			// },
		}
	);
	Commande.associate = (models) => {
		Commande.addScope(
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
						// where: { deletedAt: null },
					},
					models.Produit,
					{
						model: models.User,
						attributes: {
							exclude: ["password", "createdAt", "updatedAt", "deletedAt"],
						},
					},
				],
				attributes: {
					include: [
						[
							sequelize.literal(
								"(SELECT SUM(produits_commandes.quantite * produits_commandes.prix) AS montant FROM  commandes LEFT JOIN produits_commandes ON commandes.id = produits_commandes.CommandeId LEFT JOIN produits ON produits.id = produits_commandes.ProduitId WHERE commandes.id = Commande.id)"
							),
							"montant",
						],
					],
					exclude: ["ClientId", "UserId"],
				},
			},
			{ override: true }
		);
		Commande.belongsTo(models.Client, {
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
		Commande.belongsTo(models.User, {
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
		Commande.belongsToMany(models.Produit, {
			through: models.produits_commande,
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
	};
	return Commande;
};
