const { Op } = require("sequelize");
const {Client,TypeClient,Payement,Vente,Produit,TypeProduit, sequelize} = require('../models')

exports.index = async (req, res) => {
	const clients = await Client.findAll(
		{
			include: [TypeClient],
			where: req.where,
			attributes: {

				exclude: [
					'password'
				]
			}
		}
	)
    return res.json(clients)

}
exports.show = async (req, res) => {
	const client = await Client.findOne({
		where: {
			id: req.params.id,
		},
		// remove password from rows
		attributes: {
			exclude: ["password"],

		},
		include: [
			TypeClient,
			{
				model: Payement,
				attributes: {
					include: [
						[
							sequelize.literal(
								"(SELECT SUM(ventes_payements.montant) FROM ventes_payements WHERE ventes_payements.PayementId = Payements.id)"
							),
							"montant_total",
						],
					],
				},
			},
			// {
			// 	model:Commande
			// },
		],
	});
	return res.json({
		client
	});
};
exports.create = async (req, res) => {
	console.log(req.body)
	try {
		const client = await Client.create({...req.body,UserId: req.user.id});
		return res.json(client);
	} catch (err) {
		console.log(err)
	}
};
exports.update = async (req, res) => {
	const client = await Client.update(req.body, {
		where: { id: req.params.id },
	});
	return res.json(client);
};
exports.delete = async (req, res) => {
	const client = await Client.destroy({
		where: { id: req.params.id },
	});
	return res.json(client);
};
exports.login = async (req, res) => {
	res.send('ok')
	// const client = await Client.destroy({
	// 	where: { id: req.params.id },
	// });
	// return res.json(client);
};

exports.count = async (req, res) => {
	const count = await Client.count();
	return res.json({count});
}
exports.bestBuyer = async (req, res) => {

	// order client by number of ventes
	const clients = await Client.findAll({
		include: [TypeClient],
		
	})
	return res.json(clients)
}



exports.etatActuelle = async (req, res) => {
	const { id } = req.params
	const { debut, fin } = req.query
	const [startDate ,endDate] = [new Date(debut),new Date(fin)]
	

	let count_vente = 0

	const client = await Client.findOne({
		where: {
			id,
		},
		include: [
			{
				model: Vente,
				include: [{
					model: Produit,
					include: [TypeProduit]
				}, {
					model:Payement
				}]
			},
		]
	})
	const produits = []
	let totalVersement = 0
	let ca = 0
	client.Ventes.forEach(vente => {
		// compare two date		
		totalVersement+=vente.Payements.reduce((prev,el) => {
			return prev + el.ventes_payement.montant
		}, 0)
		if (startDate.getTime() > vente.createdAt.getTime() || endDate.getTime() < vente.createdAt.getTime()) return;
		count_vente++
		vente.Produits.forEach(({ dataValues }) => {
			const { produits_vente, ...p } = dataValues
			ca += produits_vente.prix * produits_vente.quantite
			const idx = produits.indexOf(el => el.id == p.id)
			if (idx>=0) {
				produits[idx].quantite += produits_vente.quantite
			} else {
				produits.push({...p,quantite:produits_vente.quantite})
			}
		})
	});
	return res.json({
		count_vente,
		produits,
		totalVersement,
		ca,
		solde: ca - totalVersement
	})
}