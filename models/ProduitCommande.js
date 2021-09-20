module.exports = (sequelize,DataTypes)=>{
    const ProduitCommande = sequelize.define('produits_commande',{
        quantite:{
            type:DataTypes.INTEGER.UNSIGNED,
            allowNull:false,
        },
        remise:{
                type:DataTypes.FLOAT.UNSIGNED,
                allowNull:false,
                max:100,
                min:0,
                defaultValue:0
        }
    })
    return ProduitCommande
}