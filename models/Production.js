module.exports = (sequelize, DataTypes) => {
	const Production = sequelize.define(
		"Production",
		{
			date: {
				type: DataTypes.DATE,
				defaultValue: DataTypes.NOW,
				allowNull: false,
			},
			lot: {
				type: DataTypes.STRING,
				allowNull: false,
				unique: true,
			},
			quantite: {
				type: DataTypes.FLOAT,
				allowNull: false,
			},
		},
		{
			freezeTableName: true,
			tableName: "productions",
		}
	);
	Production.associate = (models) => {
        Production.belongsTo(models.Produit, {
            foreignKey: {
                allowNull: false,
            },
            onDelete: "CASCADE",
            onUpdate: "CASCADE",
        });
        Production.belongsTo(models.User, {
            foreignKey: {
                allowNull: false,
            },
            onDelete: "CASCADE",
            onUpdate: "CASCADE",
        });
	};
	return Production;
};
