module.exports = (sequelize, DataTypes) => {
	const Adresse = sequelize.define(
		"Adresse",
		{
			adresse: {
				type: DataTypes.STRING,
				allowNull: false,
			},
			latitude: {
				type: DataTypes.STRING,
				allowNull: true,
			},
			longitude: {
				type: DataTypes.STRING,
				allowNull: true,
			},
			rc: {
				type: DataTypes.STRING,
				allowNull: true,
			},
			ai: {
				type: DataTypes.STRING,
				allowNull: true,
			},
		},
		{
			paranoid: true,
			freezeTableName: true,
			tableName: "adresses",
		}
	);
	Adresse.associate = (models) => {
		Adresse.belongsTo(models.Client, {
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
		Adresse.belongsTo(models.Wilaya, {
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
	};
	return Adresse;
};
