const { Vente, Produit, User, Client,Payement,Sequelize } = require("../models");
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
	try {
		
		const vente = await Vente.findOne({
			where: { id: req.params.id },
			include: [
				{
					model: Produit,
				},
				{
					model: Payement,
					attributes: {
						include: [
							[
								Sequelize.literal(
									"(SELECT SUM(ventes_payements.montant) AS total FROM ventes_payements where ventes_payements.PayementId = Payements.id)"
								),
								"montant",
							],
						],
					},
				},
			],
		});
	if (!vente) return res.status(404).json({ error: "vente not found" });
	console.log(req.user.id, vente.Client.id);
	if (req.user instanceof Client && vente.Client.id !== req.user.id)
		return res.status(403).json({ error: "access denied" });
		return res.json(vente);
	} catch (err) {
		console.log(err)
	}
};
exports.create = async (req, res) => {
	const vente = await Vente.create(req.body);
	return res.json(vente);
};
exports.update = async (req, res) => {
	try{
		const vente = await Vente.update(req.body, { where: { id: req.params.id } });
		return res.json(vente);

	}catch(err){
		console.log(err)
	}
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
		duplicatat: req.user instanceof Client ? true : false,
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
		.toFile(async function (err, file) {
			console.log('cc')
			if (req.user instanceof User && vente.etat == 'en cours de traitement') {
				 await vente.update({ etat: "en cours de livraison" });
			}
			res.download(file.filename);
		});
};


exports.count = async (req,res) => {
	//count ventes by month
	// count ventes by month
	const ventes = Vente.findAll({
		where: {
			...req.where,
		},
		attributes: [
			// [Sequelize.fn("COUNT", Sequelize.col("Vente.id")), "count"],
			[Sequelize.fn("MONTH", Sequelize.col("Vente.createdAt")), "month"],
			[Sequelize.fn("YEAR", Sequelize.col("Vente.createdAt")), "year"],
		],
		group: [	
			'year','month'
		],
	});
	return res.json(ventes);
}
exports.tauxDePaiement = async (req, res) => {
	//sum montant vente
	const ventes = await Vente.findAll({
		where: {
			...req.where,
		},
		attributes: [
			[Sequelize.fn("SUM", Sequelize.col("Vente.montant")), "montant"],
			[Sequelize.fn("SUM", Sequelize.col("Vente.versement")), "paye"],
		],
	});
	return res.json(ventes);

}
exports.getfacture = async (req, res) => {
	try {
		const vente = await Vente.findByPk(req.params.id);
		//read file content as string
		const file = fs.readFileSync("private/template/facture/index.html", "utf8");

		//render file content as with mustach
		console.log({vente});
		const html = moustache.render(file, {
			client: vente.Client,
			commande: vente,
			produits: await vente.getProduits(),
			moment: moment,
			duplicatat: false,
			formatDate: function () {
				if (!/Date\]$/.test(Object.prototype.toString.call(this))) {
					return "Invalid Date:" + this;
				}
				return (
					this.getDate() +
					"/" +
					(this.getMonth() + 1) +
					"/" +
					this.getFullYear()
				);
			},
			subtotal: function () {
				return this.prix * this.quantite;
			},
		});
		console.log("aaaaaaaaaaaaaaaaaaaal")
		pdf
			.create(html, {
				directory: "tmp",
				base: "private/template/facture/",
				type: "pdf",
			})
			.toStream(async function (err, stream) {	
				console.log(vente)
				await vente.update({ etat: "en cours de livraison" });
				stream.pipe(res);
			});
	} catch (error) {
		console.log(error);
		res.send(error);
	}
};