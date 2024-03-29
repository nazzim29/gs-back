module.exports = (sequelize,DataTypes)=>{
    const TypeClient = sequelize.define(
			"TypeClient",
			{
				type: {
					type: DataTypes.STRING,
					allowNull: false,
					unique: true,
				},
				icon: {
					type: DataTypes.STRING,
					allowNull: false,
					notEmpty: true,
				},
			},
			{
				freezeTableName: true,
				tableName: "typeclients",
			}
		);
    TypeClient.associate = (models)=>{
        TypeClient.hasMany(models.Client)
    }


    return TypeClient
}