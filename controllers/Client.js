const { Op } = require("sequelize");
const {Client,TypeClient} = require('../models')


exports.index = async (req, res) => {
	const clients = await Client.findAll(
		{
			include: [TypeClient],
			where: req.where,
			exclude: [
				'password'
			]
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