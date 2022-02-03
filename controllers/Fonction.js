const { Profile, Autorisation, autorisations_fonctions } = require("../models");
exports.index = async (req, res) => {
	try {
		
		const fonctions = await Profile.findAll({
			where: req.where,
			include: [{ model: Autorisation}],
		});
		
		return res.json(fonctions);
	} catch (err) {
		console.log("err",err);
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
		const fonction = await Profile.update(req.body, {
			where: { id: req.params.id },
		}).then((id) => {
			return Profile.findOne({
				where: { id },
				include: [{ model: Autorisation }],
			});
		});
		// set autorisations of this fonction many to many relation sequelize
		let saved 
		// await fonction.setAutorisations(Autorisations.map(({id, autorisations_fonctions:{type}}) => (id)),{through:Autorisations.map(({autorisations_fonctions:{type}})=>(type))});
		// for (let a in Autorisations) { 

		// 	console.log(Autorisations[a].autorisations_fonctions.type);
		// 	await fonction.addAutorisation(Autorisations[a].id, { through: { type: Autorisations[a].autorisations_fonctions.type || 'all' } });
		// }

		return res.json(fonction);
	} catch (err) {
		console.log(err);
	}
};
exports.delete = async (req, res) => {
	const fonction = await Profile.destroy({ where: { id: req.params.id } });
	return res.json(fonction);
};
