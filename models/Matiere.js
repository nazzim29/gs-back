module.exports = (sequelize, DataTypes) => {
	const Matiere = sequelize.define(
		"Matiere",
        {
            designation: {
                type: DataTypes.STRING,
                allowNull: false,
                allowEmpty: false,
			},
		},
		{
			paranoid: true,
		}
	);
	Matiere.associate = (models) => {
		Matiere.belongsToMany(models.Produit, {
			through: 'Formule',
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
		Matiere.hasMany(models.achat_matieres, {
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
	};
	return Matiere;
};
	