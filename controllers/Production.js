const { Production,User, Produit,TypeProduit,sequelize,ConsoMatiere,Matiere} = require("../models");
exports.index = async (req, res) => {
	const productions = await Production.findAll({
		include: [{model:Produit,include:[TypeProduit]},User],
		where: { ...req.where },
		order: [["createdAt", "DESC"]],
	});
	console.log(productions)
	return res.json(productions);
};
exports.show = async (req, res) => {
	const production = await Production.findOne({
		where: {
			id: req.params.id,à
		},
	});
	return res.json(production);
};
exports.create = async (req, res) => {
	const t = await sequelize.transaction();
	try {

		const production = await Production.create({
			...req.body,
			UserId: req.user.id,
		}, { transaction: t });

		//find produit by id
		const produit = await Produit.findOne({
			where: {
				id: production.ProduitId,
			},
			include: [
				Matiere
			],
			transaction: t,
		});
		for (let idxMatiere in produit.Matieres) {
			const conso = await ConsoMatiere.create(
				{
					MatiereId: produit.Matieres[idxMatiere].id,
					ProductionId: production.id,
					UserId: req.user.id,
					quantite: req.body.quantite * produit.Matieres[idxMatiere].Formule.quantite,
					raison: "production",
				},
				{ transaction: t }
			);
		}
		t.commit()
		return res.json(production);
	} catch (err) {
		console.log(err);
		return res.status(500).send(err.name || err.original.code);
	}
};
exports.update = async (req, res) => {
	const produit = await Production.update(req.body, {
		where: { id: req.params.id },
	});
	return res.json(produit);
};
exports.delete = async (req, res) => {
	const produit = await Production.destroy({ where: { id: req.params.id } });
	return res.json(produit);
};
