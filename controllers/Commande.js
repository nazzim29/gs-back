const {
	Commande,
	Produit,
	Client,
	Vente,
	produits_commande,
	Sequelize
} = require("../models");
exports.index = async (req, res) => {
	const commandes = await Commande.findAll({
		where: {
			...req.where,
		},
	});
	return res.json(commandes);
};
exports.show = async (req, res) => {
	const commande = await Commande.findByPk(req.params.id,{
		include: [
			{
				model: Produit,
			},
			{
				model:Client,
			}
		],
	});
	return res.json(await commande.toJSON());
};
exports.create = async (req, res) => {
	const commande = await Commande.create({
		...req.body,
		ClientId: req.body.Client.id,
		UserId: req.user.id,
		etat: "en negiciation",
	});
	req.params.id = commande.id;
	return await this.show(req, res);
};
exports.update = async (req, res) => {
	const commande = await Commande.update({...req.body}, { 
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

exports.addproduct = async (req, res) => {
	//add products to commande

	const v = [];
	try {
		const commande = await Commande.findByPk(req.params.id);
		const { produits_commande } = req.body;
		await commande.addProduit(req.body.produit.id, {
			through: produits_commande,
		});
		return res.json(v);
	} catch (err) {
		console.log(err);
	}
};
exports.updateProduct = async (req, res) => {
	const { id, idProduct } = req.params;
	const p = await produits_commande.update(req.body.produits_commande, {
		where: {
			CommandeId: id,
			ProduitId: idProduct,
		},
	});
};
exports.deleteProduct = async (req, res) => {
	try {
		const commande = await Commande.findByPk(req.params.id);
		await commande.removeProduit(req.params.idProduct);
		return res.status(200).json({ success: true });
	} catch (err) {
		console.log(err);
	}
};
exports.validate = async (req,res) => {
	const { id } = req.params
	// Sequelize.Transaction
	const commande = await Commande.findByPk(id)
	if (!commande) return res.status(404).json({ success: false, message: "commande not found" })
	if (commande.etat !== "en negiciation") return res.status(400).json({ success: false, message: "can't validate" })
	console.log(commande.ClientId)
	const vente = await Vente.create({UserId: req.user.id, ClientId: commande.Client.id })
	const produits = await commande.getProduits();
	for (produit in produits) {
		await vente.addProduit(produits[produit].id, { through: { quantite: produits[produit].produits_commande.quantite,prix:produits[produit].produits_commande.prix } })
	}
	commande.etat = "valide";	
	await commande.save();
	return res.status(200).json({ success: true })
}