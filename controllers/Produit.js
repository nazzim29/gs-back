const { Produit, TypeProduit, Couleur } = require("../models");
exports.index = async (req, res) => {
	const produits = await Produit.findAll({
		attributes: {
			exclude: ["TypeProduitId", "CouleurId"],
		},
		include: [TypeProduit, Couleur],
		where: {
			...req.query.type?{TypeProduitId: req.query.type}:{},
			...req.query.couleur ? { CouleurId: req.query.couleur } : {},
			...req.query.featured != 'true' ? {}: { featured: true },
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
	try {
		
		const produit = await Produit.create({
			...req.body,
			TypeProduitId: req.body.TypeProduit.id,
			CouleurId: req.body.Couleur.id,
			UserId: req.user.id,
		});
		return res.json(produit)
	} catch (err) {
		console.log(err);
		return res.status(500).send(err.name || err.original.code);
	}
};
exports.update = async (req, res) => {
	const produit = await Produit.update(req.body, { where: { id: req.params.id } })
	return res.json(produit)
};
exports.delete = async (req, res) => {
	const produit = await Produit.destroy({ where: { id: req.params.id } })
	return res.json(produit)
};
