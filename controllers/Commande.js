const {Commande} = require('../models')
exports.index = async (req,res)=>{
    const commandes = await Commande.findAll()
    return res.json(commandes)
}
exports.show = async (req, res) => {
	const commande = await Commande.findOne({
		where: {
			id: req.params.id,
		},
	});
	return res.json(commande);
};
exports.create = async (req, res) => {
	const commande = await Commande.create(req.body);
	return res.json(commande);
};
exports.update = async (req, res) => {
	const commande = await Commande.update(req.body, {
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