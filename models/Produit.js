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
			description: {
				type: DataTypes.TEXT,
				allowEmpty: false,
				allowNull: false,
			},
			image: {
				type: DataTypes.STRING,
				allowNull: false,
				allowEmpty: false,
				defaultValue: "default.jpg",
			},
		},
		{
			paranoid: true,
			freezeTableName: true,
			tableName: "produits",
		}
	);
	Produit.associate = (models) => {
		Produit.belongsToMany(models.Commande, {
			through: models.produits_commande,
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
		//m:n relation between matiere and produit through Formule
		Produit.belongsToMany(models.Matiere, {
			through: models.Formule,
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
		Produit.belongsToMany(models.Client, {
			through: models.ClientPanier,
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
		Produit.hasMany(models.Production, {
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		})
		Produit.belongsToMany(models.Vente, {
			through: models.produits_vente,
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
	};
	return Produit;
};
