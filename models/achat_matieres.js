module.exports = (sequelize, DataTypes) => {
	const func = sequelize.define("achat_matieres", {
        quantite: {
            type: DataTypes.FLOAT,
            allowNull: false,
        },
        prixUnitaire: {
            type: DataTypes.FLOAT,
            allowNull: false,
        }
    }, {
        paranoid:true
    });
    func.associate = (models) => {
        func.belongsTo(models.Matiere, {
            foreignKey: {
                allowNull: false,
            },
            onDelete: "CASCADE",
            onUpdate: "CASCADE",
        });
    };
	return func;
};
