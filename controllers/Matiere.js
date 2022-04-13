const { Matiere,achat_matieres} = require("../models");
const sequelize = require("sequelize");
exports.index = async (req, res) => {
	const payements = await Matiere.findAll({
		attributes: {
			include: [
				[
					sequelize.literal(
						"(SELECT SUM(achat_matieres.quantite) FROM achat_matieres WHERE achat_matieres.MatiereId = Matiere.id) - (SELECT SUM(consomatieres.quantite) FROM consomatieres WHERE consomatieres.MatiereId = Matiere.id)"
					),
					"quantite",
				],
				[
					sequelize.literal(
						"(SELECT achat_matieres.prixUnitaire FROM achat_matieres WHERE achat_matieres.MatiereId = Matiere.id ORDER BY `createdAt` DESC LIMIT 1)"
					),
					"prix",
				],
			],
		},
	});
	return res.json(payements);
};
exports.show = async (req, res) => {
	const payement = await Matiere.findOne({ where: { id: req.params.id } });
	return res.json(payement);
};
exports.create = async (req, res) => {
	const payement = Matiere.create(req.body);
	return res.json(payement);
};
exports.update = async (req, res) => {
	const payement = await Matiere.update(req.body, {
		where: { id: req.params.id },
	});
	return res.json(payement);
};
exports.delete = async (req, res) => {
	const payement = await Matiere.destroy({ where: { id: req.params.id } });
	return res.json(payement);
};
exports.arrivage = async (req, res) => {
    // bulk create achat_matieres
    const arrivage = await achat_matieres.bulkCreate(req.body);
    return res.json(arrivage);

}
