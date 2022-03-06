const { Commande, Client, User, Produit, Sequelize, sequelize } = require("../models");
exports.index = async (req, res) => {
	const commandes = await Commande.findAll({
		include: [
			Produit,
			{
				model: Client,
				attributes: [
					"id",
					"raisonSociale",
					"numero",
					"numeroSecondaire",
					"typeClientId",
				],
				include: ["TypeClient"],
			},
			{
				model: User,
				attributes: {
					exclude: ["password", "createdAt", "updatedAt", "deletedAt"],
				},
			},
		],
		attributes: {
			include: [
				[sequelize.literal(
					"sum(`Produits->produits_commande`.prix * `Produits->produits_commande`.quantite)"
				),"montant"]
			],
			exclude: ["ClientId", "UserId"],
		},
		group:["Commande.id"]
	});
	return res.json(commandes);
};
exports.show = async (req, res) => {
	const commande = await Commande.findOne({
		include: [
			Produit,
			{
				model: Client,
				attributes: [
					"id",
					"raisonSociale",
					"numero",
					"numeroSecondaire",
					"typeClientId",
				],
				include: ["TypeClient"],
			},
			{
				model: User,
				attributes: {
					exclude: ["password", "createdAt", "updatedAt", "deletedAt"],
				},
			},
		],
		attributes: {
			include: [
				[sequelize.literal(
					"sum(`Produits->produits_commande`.prix * `Produits->produits_commande`.quantite)"
				),"montant"]
			],
			exclude: ["ClientId", "UserId"],
		},
		where: {
			id: req.params.id,
		},
	});
	return res.json(await commande.toJSON());
};
exports.create = async (req, res) => {
	const commande = await Commande.create(req.body);
	return res.json(commande);
};
exports.update = async (req, res) => {
	const commande = await Commande.update(req.body, {
		where: { id: req.params.id },
	});
	return res.json(commande);
};
exports.delete = async (req, res) => {
	const commande = await Commande.destroy({
		where: { id: req.params.id },
	});
	return res.json(commande);
};
