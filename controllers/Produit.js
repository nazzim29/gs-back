const { Produit, TypeProduit, Couleur } = require("../models");
exports.index = async (req, res) => {
	const produits = await Produit.findAll({
		attributes: {
			exclude: ["TypeProduitId", "CouleurId"],
		},
		include: [TypeProduit, Couleur],
		where: {
			TypeProduitId: req.query.type ? req.query.type : undefined,
			CouleurId: req.query.couleur ? req.query.couleur : undefined,
		},
	});
	return res.json(produits)
};
exports.show = async (req, res) => {
	const produit = await Produit.findOne({
		where: {
			id: req.params.id
		}
	})
	return res.json(produit)
};
exports.create = async (req, res) => {
	const produit = await Produit.create(req.body)
	return res.json(produit)
};
exports.update = async (req, res) => {
	const produit = await Produit.update(req.body, { where: { id: req.params.id } })
	return res.json(produit)
};
exports.delete = async (req, res) => {
	const produit = await Produit.destroy({ where: { id: req.params.id } })
	return res.json(produit)
};
