const bcrypt = require("bcrypt-nodejs");

const hashPwd = (user, options) => {
  console.log(user)
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
			username: {
				type: DataTypes.STRING,
				allowNull: false,
				unique: true,
				notEmpty: true,
			},
		},
		{
			validate: {
				async num() {
					let all = await Client.findAll();
					if (this.id) all = all.filter((el) => el.id != this.id);
					if (
						all.some(
							(e) =>
								e.numero == this.numero ||
								e.numero == this.numeroSecondaire ||
								e.numeroSecondaire == this.numero ||
								e.numeroSecondaire == this.numeroSecondaire
						)
					)
						throw new Error(
							"le numero introduit appartient a un client existant"
						);
				},
			},
			hooks: {
				beforeCreate: hashPwd,
				beforeUpdate: hashPwd,
				beforeSave: hashPwd,
			},
			paranoid: true,
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
	};
	return Client;
};
