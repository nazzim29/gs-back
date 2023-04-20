module.exports = (sequelize,DataTypes)=>{
    const TypeProduit = sequelize.define(
			"TypeProduit",
			{
				nom: {
					type: DataTypes.STRING,
					allowNull: false,
					unique: true,
				},
			},
			{
				freezeTableName: true,
				tableName: "typeproduits",
			}
		);
    TypeProduit.associate = (models)=>{
        TypeProduit.hasMany(models.Produit)
    }
    return TypeProduit
}