module.exports = (sequelize, DataTypes) => {
	console.log(Object.keys(DataTypes))
	const Commande = sequelize.define(
		"Commande",
		{
			date: {
				type: DataTypes.DATE,
				allowNull: false,
			},
			etat: {
				type: DataTypes.ENUM(
					"en negiciation",
					"en attente",
					"traité partiellement",
					"traité"
				),
				allowNull: false,
				defaultValue: "en negiciation",
			},
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
