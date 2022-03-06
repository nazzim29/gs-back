const { Op } = require('sequelize/types');
const {Client,TypeClient} = require('../models')


exports.index = async (req, res) => {
	const clients = await Client.findAll(
		{
			include: [TypeClient],
			where: {
				...req.query.TypeClientId && { TypeClientId: req.query.TypeClientId },
				...req.query.raisonSociale && { raisonSociale: {[Op.substring] : req.query.raisonSociale} },
				...req.query.numero && { numero: {[Op.substring] : req.query.numero} },
				...req.query.numeroSecondaire && { numeroSecondaire: {[Op.substring] : req.query.numeroSecondaire} },

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
	});
	return res.json(client);
};
exports.create = async (req, res) => {
	const client = await Client.create(req.body);
	return res.json(client);
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