module.exports = (sequelize,DataTypes)=>{
    const TypeClient = sequelize.define('TypeClient',{
        type:{
            type:DataTypes.STRING,
            allowNull:false,
            unique:true
        }
    })
    TypeClient.associate = (models)=>{
        TypeClient.hasMany(models.Client)
    }


    return TypeClient
}