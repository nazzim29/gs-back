const { Vente, Produit, User, Client } = require("../models");
const fs = require('fs')
const pdf = require("html-pdf");
const moment = require("moment");
const moustache = require("mustache");
exports.index = async (req, res) => {
	if (req.user instanceof User) {
		const ventes = await Vente.findAll({
			where: {
				...req.where,
			}
		})
		return res.json(ventes)
	} else {
		const ventes = await Vente.findAll({
			where: {
				...req.where,
				ClientId: req.user.id,
			},
		});
		return res.json(ventes);
	}
};
exports.show = async (req, res) => {
	const vente = await Vente.findOne({
		where: { id: req.params.id },
		include: [
			{
				model: Produit,
			},
		],
	});
	if (!vente) return res.status(404).json({ error: "vente not found" });
	console.log(req.user.id, vente.Client.id);
	if (req.user instanceof Client && vente.Client.id !== req.user.id)
		return res.status(403).json({ error: "access denied" });
	return res.json(vente);
};
exports.create = async (req, res) => {
	const vente = await Vente.create(req.body);
	return res.json(vente);
};
exports.update = async (req, res) => {
	const vente = await Vente.update(req.body, { where: { id: res.body.id } });
	return res.json(vente);
};
exports.delete = async (req, res) => {
	const vente = await Vente.destroy({ where: { id: req.params.id } });
	return res.json(vente);
};

exports.downloadFacture = async (req, res) => {
	const vente = await Vente.findOne({
		where: { id: req.params.id },
		include: [
			{
				model: Produit,
			},
		],
	});
	if (!vente) return res.status(404).json({ error: "vente not found" });
	console.log(req.user.id, vente.Client.id);
	if (req.user instanceof Client && vente.Client.id !== req.user.id)
		return res.status(403).json({ error: "access denied" });
	const facturetemplate = fs.readFileSync(
		"private/template/facture/index.html",
		"utf8"
	);
	const facture = moustache.render(facturetemplate, {
		client: vente.Client,
		commande: vente,
		duplicatat:true,
		produits: await vente.getProduits(),
		moment: moment,
		formatDate: function () {
			if (!/Date\]$/.test(Object.prototype.toString.call(this))) {
				return "Invalid Date:" + this;
			}
			return (
				this.getDate() + "/" + (this.getMonth() + 1) + "/" + this.getFullYear()
			);
		},
		subtotal: function () {
			return this.prix * this.quantite;
		},
	});
	pdf
		.create(facture, {
			directory: "tmp",
			base: "private/template/facture/",
			type: "pdf",
		})
		.toFile(function (err, file) {
			res.download(file.filename);
		});
};
