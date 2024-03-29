const bcrypt = require("bcrypt-nodejs");

const hashPwd = (user, options) => {
	if (!user.changed("password")) return;
	const salt = bcrypt.genSaltSync(process.env.HASHING_FACTOR);
	const hash = bcrypt.hashSync(user.password, salt, null);
	user.setDataValue("password", hash);
};

module.exports = (sequelize, DataTypes) => {
	const Client = sequelize.define(
		"Client",
		{
			raisonSociale: {
				type: DataTypes.STRING,
				allowNull: false,
				unique: true,
			},
			numero: {
				type: DataTypes.STRING,
				allowNull: false,
				unique: true,
			},
			numeroSecondaire: {
				type: DataTypes.STRING,
				allowNull: true,
				unique: true,
			},
			password: {
				type: DataTypes.STRING,
				allowNull: false,
				notEmpty: true,
			},
			// nrc, numero d'article 
			username: {
				type: DataTypes.STRING,
				allowNull: false,
				unique: true,
				notEmpty: true,
			},
			image: {
				type: DataTypes.STRING,
				allowNull: true,
			},
			nif: {
				type: DataTypes.STRING,
				allowNull: true,
				unique: true,
				length: 15,
			},
			nis: {
				type: DataTypes.STRING,
				allowNull: true,
				unique: true,
			},
			miseEnAvant: {
				type: DataTypes.BOOLEAN,
				allowNull: false,
				defaultValue: false,
			}
		},
		{
			validate: {
				async num() {
					// let all = await Client.findAll();
					// if (this.id) all = all.filter((el) => el.id != this.id);
					// if (
					// 	all.some(
					// 		(e) =>
					// 			e.numero == this.numero ||
					// 			e.numero == this.numeroSecondaire ||
					// 			e.numeroSecondaire == this.numero ||
					// 			e.numeroSecondaire == this.numeroSecondaire
					// 	)
					// )
					// 	throw new Error(
					// 		"le numero	introduit appartient a un client existant"
					// 	);
				},
			},
			hooks: {
				beforeCreate: hashPwd,
				beforeUpdate: hashPwd,
				beforeSave: hashPwd,
			},
			paranoid: true,
			freezeTableName: true,
			tableName: "clients",
		}
	);
	Client.prototype.verifyHash = async function (password) {
		return bcrypt.compareSync(password, this.password);
	};
	Client.associate = (models) => {
		Client.belongsTo(models.User, {
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
		Client.belongsTo(models.TypeClient, {
			foreignKey: {
				allowNull: false,
			},
			onDelete: "CASCADE",
			onUpdate: "CASCADE",
		});
		Client.hasMany(models.Adresse);
		Client.hasMany(models.Payement);
		Client.hasMany(models.Commande)
		Client.hasMany(models.Vente)
		// Client.belongsToMany(models.Produit, {
		// 	through: models.ClientPanier,
		// 	onDelete: "CASCADE",
		// 	onUpdate: "CASCADE",
		// 	as: "Panier"
		// })
	};
	return Client;
};
