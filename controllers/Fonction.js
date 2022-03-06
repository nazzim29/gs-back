const { Profile, Autorisation, autorisations_fonctions } = require("../models");
exports.index = async (req, res) => {
	try {
		const fonctions = await Profile.findAll({
			where: req.where,
			include: [{ model: Autorisation }],
		});
		// console.log(fonctions.map(el=>({...el.toJSON(),...{Autorisations:(await el.getAutorisations())}})));
		return res.json(fonctions);
	} catch (err) {
		console.log("err", err);
	}
};
exports.show = async (req, res) => {
	const fonction = await Profile.create(req.body);
	return res.json(fonction);
};
exports.create = async (req, res) => {
	try {
		const fonction = await Profile.create(req.body);
		return res.send(fonction.toJSON());
	} catch (e) {
		return res.send(e);
	}
};
exports.update = async (req, res) => {
	try {
		const { Autorisations } = req.body;
		console.log(req.body);
		let fonction = await Profile.update(req.body, {
			where: { id: req.params.id },
			include: { model: Autorisation, include: autorisations_fonctions },
		}).then((id) => {
			return Profile.findOne({
				where: { id },
			});
		});
		const currentAutorisations = await fonction.getAutorisations();
		console.log(currentAutorisations);
		for (let i in Autorisations) {
			if (currentAutorisations.find((el) => el.id == Autorisations[i].id)) {
				if (
					currentAutorisations.find(
						(el) =>
							el.id == Autorisations[i].id &&
							el.autorisations_fonctions.type ==
							Autorisations[i].autorisations_fonctions.type
					)
				) continue;
					await autorisations_fonctions.update(
						{
							ProfileId: fonction.id,
							AutorisationId: Autorisations[i].id,
							type: Autorisations[i].autorisations_fonctions.type || "all",
						},
						{
							where: {
								ProfileId: fonction.id,
								AutorisationId: Autorisations[i].id,
							},
						}
					);
			} else {
				await autorisations_fonctions.create({
					ProfileId: fonction.id,
					AutorisationId: Autorisations[i].id,
					type: Autorisations[i].autorisations_fonctions.type || "all",
				});
			}
		}
		for (let i in currentAutorisations) {
			if (!Autorisations.find((el) => el.id == currentAutorisations[i].id)) {
				await autorisations_fonctions.destroy({
					where: {
						ProfileId: fonction.id,
						AutorisationId: currentAutorisations[i].id,
					},
				});
			}
		}
		fonction = await Profile.findByPk(fonction.id, {
			include: { model: Autorisation },
		});
		return res.json(fonction);
	} catch (err) {
		console.log(err);
	}
};
exports.delete = async (req, res) => {
	const fonction = await Profile.destroy({ where: { id: req.params.id } });
	return res.json(fonction);
};
