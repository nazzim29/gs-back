module.exports = (sequelize, DataTypes) => {
	const Produit = sequelize.define(
		"Produit",
		{
			nom: {
				type: DataTypes.STRING,
				allowNull: false,
				allowEmpty: false,
			},
			contenance: {
				type: DataTypes.INTEGER.UNSIGNED,
				allowNull: false,
			},
			featured: {
				type: DataTypes.BOOLEAN,
				allowNull: false,
				defaultValue: false,
			},
			// prix: {
			// 	type: DataTypes.VIRTUAL,
			// 	get() {
			// 		this.get
			// }
		},
		{
			paranoid: true,
		}
	);
	Produit.associate = (models) => {
		Produit.belongsToMany(models.Commande, {
			through: models.produits_commande,
		});
		Produit.belongsToMany(models.Matiere, {
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
			through: models.Formule,
			foreignKey: {
				allowNull: false,
			},
		});
		Produit.belongsToMany(models.Vente, { through: models.produits_vente });
		Produit.belongsTo(models.TypeProduit, {
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
		Produit.belongsTo(models.Couleur, {
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
	};
	return Produit;
};
