module.exports = (sequelize, DataTypes) => {
	const ConsoMAtiere = sequelize.define(
		"ConsoMatiere",
		{
			quantite: {
				type: DataTypes.DECIMAL,
				allowNull: false,
			},
			date: {
				type: DataTypes.DATE,
				defaultValue: DataTypes.NOW,
				allowNull: false,
			},
			raison: {
				type: DataTypes.ENUM("achat", "production"),
				allowNull: false,
			},
		},
		{ freezeTableName: true, tableName: "conso_matiere" }
	);
    ConsoMAtiere.associate = (models) => {
        console.log(models)
        ConsoMAtiere.belongsTo(models.Production, {
            foreignKey: {
                allowNull: true,
            },
            onDelete: "SET NULL",
            onUpdate: "SET NULL",
        });
        ConsoMAtiere.belongsTo(models.Matiere, {
            foreignKey: {
                allowNull: true,
            },
            onDelete: "SET NULL",
            onUpdate: "SET NULL",
        });
        ConsoMAtiere.belongsTo(models.User, {
            foreignKey: {
                allowNull: true,
            },
            onDelete: "SET NULL",
            onUpdate: "SET NULL",
        });
	};
	return ConsoMAtiere;
};
