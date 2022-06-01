const { Produit, TypeProduit, Couleur, Matiere,sequelize,PrixProduit} = require("../models");
const fs = require("fs");
const path = require("path");
exports.index = async (req, res) => {
	const produits = await Produit.findAll({
		attributes: {
			exclude: ["TypeProduitId", "CouleurId"],
		},
		include: [TypeProduit, Couleur, Matiere],
		where: { ...req.where },
		order: [["createdAt", "DESC"]],
		attributes: {
			include: [
				[
					sequelize.literal(
						"(SELECT SUM(quantite) FROM productions WHERE ProduitId = Produit.id)"
					),
					"quantite",
				],
				[
					sequelize.literal(	
						"(SELECT SUM(quantite) FROM produits_ventes LEFT JOIN ventes ON produits_ventes.VenteId =ventes.id WHERE produits_ventes.ProduitId = Produit.id AND ventes.etat <> 'en attente de livraison')"
					),
					"vendu",
				],
				[
					sequelize.literal(
						"(SELECT SUM(quantite) FROM produits_commandes WHERE produits_commandes.CommandeId IN ( SELECT id FROM commandes WHERE commandes.etat <> 'vendu' AND commandes.deletedAt IS NULL) AND produits_commandes.ProduitId = Produit.id)"
					),
					"quantiteCommande",
				],
				[
					sequelize.literal(
						"(SELECT prixproduits.prix FROM prixproduits where ProduitId = Produit.id ORDER BY prixproduits.createdAt DESC LIMIT 1)"
					),
					"prix",
				],
			],
			// exclude: ["ClientId", "UserId"],
		},
	});

	return res.json(produits);
};
exports.show = async (req, res) => {
	const produit = await Produit.findOne({
		where: {
			id: req.params.id,
		},
	});
	return res.json(produit);
};
exports.create = async (req, res) => {
	console.log(req.body);
	const t = await sequelize.transaction();
	try {
		const produit = await Produit.create({
			...req.body,
			TypeProduitId: req.body.TypeProduit.id,
			CouleurId: req.body.Couleur.id,
			UserId: req.user.id,
			...(req.body.image == "undefined" && { image: 'default.jpeg' }),
		}, { transaction: t });
		const prix = await PrixProduit.create({ prix: req.body.prix, ProduitId: produit.id }, { transaction: t });
		await t.commit();
		produit.prix = prix.prix
		return res.json(produit);
	} catch (err) {
		await t.rollback();
		console.log(err);
		return res.status(500).send(err.name || err.original.code);
	}
};
exports.storeImage = async (req, res, next) => {
	if (req.file) {
		try {
			console.log("hey");
			let newpath = req.file.path + path.extname(req.file.originalname);
			await fs.rename(req.file.path, newpath, (err) => {
				req.body.image =
					req.file.filename + path.extname(req.file.originalname);
				return next();
			});
		} catch (err) {
			console.log(err);
			return res.status(500).send();
		}
	} else {
		next();
	}
};
exports.update = async (req, res) => {
	try {
		
		const t = await sequelize.transaction();
		const produit = await Produit.update(req.body, {
			where: { id: req.params.id },
			transaction: t,
		});
		const prix = await PrixProduit.create({
			prix: req.body.prix,
			ProduitId: req.params.id,
		}, { transaction: t });
		t.commit();
		produit.prix = prix.prix
		return res.json(produit);
	} catch (err) {
		t.rollback();
		console.log(err);
	}
};
exports.delete = async (req, res) => {
	const produit = await Produit.destroy({ where: { id: req.params.id } });
	return res.json(produit);
};
exports.addFormule = async (req, res) => {
	const produit = await Produit.findByPk(req.params.id);
	if (!produit) return res.status(404).send();
	try {
		console.log(req.body);
		await produit.addMatiere(req.body.MatiereId, {
			through: { quantite: req.body.quantite },
		});
		return res.json(produit);
	} catch (err) {
		console.log(err);
		return res.status(500).send(err.name || err.original.code);
	}
};
exports.removeFormule = async (req, res) => {
	const produit = await Produit.findByPk(req.params.ProduitId);
	if (!produit) return res.status(404).send();
	try {
		await produit.removeMatiere(req.params.MatiereId);
		return res.json(produit);
	} catch (err) {
		console.log(err);
		return res.status(500).send(err.name || err.original.code);
	}
};
