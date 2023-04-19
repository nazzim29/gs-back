module.exports = (sequelize, DataTypes) => {
  const func = sequelize.define(
		"autorisations_fonctions",
		{
			type: {
				type: DataTypes.ENUM("own", "all"),
				allowNull: false,
			},
		},
		{
			freezeTableName: true,
			tableName: "autorisation_fonctions",
		}
	);
  return func;
};
