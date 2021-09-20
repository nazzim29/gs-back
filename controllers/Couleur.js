const { Couleur } = require("../models");
const { Op } = require("sequelize");
exports.index = async (req, res) => {
	try {
		let couleurs = await Couleur.findAll({
			where: {
				nom: {
					[Op.like]: "%" + (req.query.nom || "") + "%",
				},
				code: {
					[Op.like]: "%" + (req.query.code || "") + "%",
				},
			},
		});
		res.json(couleurs);
	} catch (e) {
		res.status(500).send(e);
	}
};
exports.show = async (req, res) => {
	try {
		let couleur = await Couleur.findOne({ where: { id: req.params.id } });
		res.json(couleur);
	} catch (e) {
		res.status(500).send(e);
	}
};
exports.create = async (req, res) => {
	try {
		const couleur = await Couleur.create(req.body);
		return res.send(couleur);
	} catch (e) {
		return res.status(400).send(e);
	}
};
exports.update = async (req, res) => {
	try {
		const couleur = await Couleur.update(req.body, {
			where: { id: req.params.id },
		});
		return res.send(couleur);
	} catch (e) {
		return res.status(400).send(e);
	}
};
exports.delete = async (req, res) => {
	try {
		const couleur = await Couleur.destroy({ where: { id: req.params.id } });
		return res.send(couleur);
	} catch (e) {
		return res.status(400).send(e);
	}
};
