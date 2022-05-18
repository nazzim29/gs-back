const {
	Client,
	TypeProduit,
	Couleur,
	ClientPanier,
	Commande,
	sequelize,
	produits_commande,
} = require("../models");

exports.index = async (req, res) => {
	if (!req.user instanceof Client)
		return res.status(403).send({ error: "unauthorized" });
	const panier = await req.user.getPanier({
		include: [{ model: TypeProduit }, { model: Couleur }],
	});
	return res.json(panier);
};

exports.addToCart = async (req, res) => {
	try {
		const { user } = req;
		if (!user instanceof Client)
			return res.status(403).send({ error: "unauthorized" });
		await req.user.addPanier(req.params.id, { through: { quantite: 1 } });
		return this.index(req, res);
	} catch (error) {
		console.log(error);
		return res.status(500).send({ error: error.message });
	}
};

exports.removeFromCart = async (req, res) => {
	try {
		const { user } = req;
		if (!user instanceof Client)
			return res.status(403).send({ error: "unauthorized" });
		await req.user.removePanier(req.params.id);
		return this.index(req, res);
	} catch (error) {
		console.log(error);
		return res.status(500).send({ error: error.message });
	}
};

exports.changeQuantity = async (req, res) => {
	const { user } = req;
	if (!user instanceof Client)
		return res.status(403).send({ error: "unauthorized" });
	try {
		await ClientPanier.update(
			{ quantite: req.body.quantite },
			{ where: { ProduitId: req.params.id, ClientId: user.id } }
		);
		return this.index(req, res);
	} catch (error) {
		console.log(error);
		return res.status(500).send({ error: error.message });
	}
};

exports.clearCart = async (req, res) => {
	const { user } = req;
	if (!user instanceof Client)
		return res.status(403).send({ error: "unauthorized" });
	try {
		await user.setPanier([]);
		return this.index(req, res);
	} catch (error) {
		console.log(error);
		return res.status(500).send({ error: error.message });
	}
};

exports.validate = async (req, res) => {
	const { user } = req;
	if (!user instanceof Client)
		return res.status(403).send({ error: "unauthorized" });
	const transaction = await sequelize.transaction();
	try {
		const Produits = await user.getPanier();
		const commande = await Commande.create(
			{
				ClientId: user.id,
				UserId: user.UserId,
			},
			{ transaction }
		);
		for (let i in Produits) {
			console.log(i, "/", Produits.length);
			await produits_commande.create({
				CommandeId: commande.id,
				ProduitId: Produits[i].id,
				quantite: Produits[i].ClientPanier.quantite,
			},{transaction}).then(console.log);
		}
		await user.setPanier([], { transaction })
		await transaction.commit();
		return res.json([]);
	} catch (error) {
		console.log(error);
		await transaction.rollback();
		return res.status(500).send({ error: error.message });
	}
};
