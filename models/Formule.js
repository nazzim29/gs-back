module.exports = (sequelize, DataTypes) => {
	const Formule = sequelize.define("Formule", {
        quantite: {
            type: DataTypes.FLOAT.UNSIGNED,
            allowNull: false,
        },
        MatiereId: {
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull: false,
            references: {
                model: "Matiere",
                key: "id",
            }
        },
        ProduitId: {
            type: DataTypes.INTEGER.UNSIGNED,
            allowNull: false,
            references: {
                model: "Produit",
                key: "id",
            }
        }
	});
	return Formule;
};
