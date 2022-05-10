const {
	Commande,
	Produit,
	Client,
	Couleur,
	Vente,
	produits_commande,
	User,
	sequelize,
	TypeProduit,
	Sequelize,
} = require("../models");
exports.index = async (req, res) => {
	if (req.user instanceof Client) {
		const commandes = await Commande.findAll({
			where: {
				...req.where,
				ClientId: req.user.id,
			},
			include: [
				{
					model: Produit,
					paranoid: false,
				},
			],
		});

		return res.json(commandes);
	}
	const commandes = await Commande.findAll({
		where: {
			...req.where,
		},
	});
	console.log(commandes)
	return res.json(commandes);
};
exports.show = async (req, res) => {
	const commande = await Commande.findByPk(req.params.id, {
		include: [
			{
				model: Produit,
				include: [TypeProduit, Couleur],
				paranoid: false,
			},
			{
				model: Client,
			},
		],
	});
	console.log(commande);
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
	// await Commande.update(
	// 	{ ...req.body },
	// 	{
	// 		where: { id: req.params.id },
	// 	}
	// );
	const commande = await Commande.findByPk(req.params.id);
	for (let i in req.body.Produits) {
		if (req.body.Produits[i].produits_commande.quantite == 0) {
			await produits_commande.destroy({
				where: {
					CommandeId: req.body.Produits[i].produits_commande.CommandeId,
					ProduitId: req.body.Produits[i].produits_commande.ProduitId,
				},
			});
			continue;
		}
		const pc = await produits_commande.findOne({
			where: {
				CommandeId: commande.id,
				ProduitId: req.body.Produits[i].id,
			},
		});
		if (pc) {
			console.log("update: ", req.body.Produits[i].produits_commande);
			await produits_commande.update(req.body.Produits[i].produits_commande, {
				where: {
					CommandeId: commande.id,
					ProduitId: req.body.Produits[i].id,
				},
			});
			continue;
		}
		await produits_commande.create(req.body.Produits[i].produits_commande);
	}
	commande.Produits = await commande.getProduits();
	console.log(commande.Produits.map((el) => el.produits_commande.quantite));
	return res.json(commande);
};
exports.delete = async (req, res) => {
	const commande = await Commande.findByPk(req.params.id);
	if(!commande) return res.status(404).json({error: "Commande not found"});
	if (req.user instanceof Client && req.user.id != commande.UserId) return res.status(403).json({ error: "You are not allowed to delete this commande" });
	await commande.destroy();
	return res.json({ success: true });
};

exports.addproduct = async (req, res) => {
	//add products to commande

	const v = [];
	try {
		//new transaction
		const transaction = await sequelize.transaction();
		const commande = await Commande.findByPk(req.params.id, {
			transaction: transaction,
		});
		const { produits_commande } = req.body;
		console.log(produits_commande);
		await commande.addProduit(req.body.produit.id, {
			through: produits_commande,
			transaction: transaction,
		});
		if (req.user instanceof Client) {
			await commande.update(
				{
					etat: "en negiciation",
					validationClient: true,
					validationAdmin: false,
				},
				{ transaction: transaction }
			);
		} else {
			await commande.update(
				{
					etat: "en negiciation",
					validationClient: false,
					validationAdmin: true,
				},
				{ transaction: transaction }
			);
		}
		await transaction.commit();
		return res.json(v);
	} catch (err) {
		console.log(err);
		await transaction.rollback();
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
exports.validate = async (req, res) => {
	const { id } = req.params;
	// Sequelize.Transaction
	const transaction = await sequelize.transaction();
	try {
		const commande = await Commande.findByPk(id);
		if (!commande)
			return res
				.status(404)
				.json({ success: false, message: "commande not found" });
		if (req.user instanceof Client) {
			await commande.update(
				{
					validationClient: true,
				},
				{ transaction: transaction }
			);
		} else {
			await commande.update(
				{
					validationAdmin: true,
				},
				{ transaction: transaction }
			);
		}
		if (commande.validationClient && commande.validationAdmin) {
			
			const vente = await Vente.create({
				UserId: commande.UserId,
				ClientId: commande.Client.id,
			});
			const produits = await commande.getProduits();
			for (produit in produits) {
				await vente.addProduit(produits[produit].id, {
					through: {
						quantite: produits[produit].produits_commande.quantite,
						prix: produits[produit].produits_commande.prix,
					},
				});
			}
		}
		await transaction.commit();
		return res.status(200).json({ success: true });
	} catch (err) {
		console.log(err);
		await transaction.rollback();
	}
};
