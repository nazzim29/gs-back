const {
	Payement,
	Client,
	User,
	Vente,
	Sequelize,
	ventes_payement,
} = require("../models");
exports.index = async (req, res) => {
	const payements = await Payement.findAll({
		include: [Client, User],
		attributes: {
			include: [
				[
					Sequelize.literal(
						"(SELECT SUM(ventes_payements.montant) AS total FROM ventes_payements where ventes_payements.PayementId = Payement.id)"
					),
					"montant",
				],
			],
		},
	});
	return res.json(payements);
};
exports.show = async (req, res) => {
	const payement = await Payement.findByPk(req.params.id, {
		include: [
			Client,
			{
				model: Vente,
				attributes: {
					include: [
						[
							Sequelize.literal(
								"(SELECT SUM(produits_ventes.quantite * produits_ventes.prix) AS montant FROM  produits_ventes WHERE produits_ventes.VenteId = Ventes.id)"
							),
							"montant",
						],
						[
							Sequelize.literal(
								"(SELECT SUM(ventes_payements.montant) AS versement FROM ventes_payements WHERE ventes_payements.VenteId = Ventes.id)"
							),
							"versement",
						],
					],
					exclude: ["ClientId", "UserId"],
				},
			},
		],
	});
	return res.json(payement);
};
exports.create = async (req, res) => {
	const payement = await Payement.create({
		ClientId: req.body.Client.id,
		UserId: req.user.id,
	});
	for (const vente of req.body.Ventes) {
		await ventes_payement.create({
			PayementId: payement.id,
			VenteId: vente.id,
			montant: vente.montant,
		});
	}
	return res.json(payement);
};
exports.update = async (req, res) => {
	const payement = await Payement.update(req.body, {
		where: { id: req.params.id },
	});
	return res.json(payement);
};
exports.delete = async (req, res) => {
	const payement = await Payement.destroy({ where: { id: req.params.id } });
	return res.json(payement);
};