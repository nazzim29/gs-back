const { User, Profile, Autorisation,Client,TypeClient } = require("../models");
const { Op } = require("sequelize");
const jwt = require("jsonwebtoken");
const passport = require("passport");
const jwtSign = (user,type) => {
	const ONE_DAY = "1 days";
	return jwt.sign({ id: user.id,type }, process.env.AUTH_SECRET);
};

exports.index = async (req, res) => {
	const users = await User.findAll({
		where: req.where,
		attributes: {
			exclude: ["password", "ProfileId"],
		},
		include: { model: Profile, include: Autorisation },
	});
	return res.json(users);
};

exports.show = async (req, res) => {
	const user = await User.findOne({
		where: { id: req.params.id },
		attributes: {
			exlude: ["password", "ProfileId"],
		},
		include: Profile,
	});
	return res.json(user);
};

exports.create = async (req, res) => {
	try {
		console.log(req.body);
		// (!req.body.ProfileId)&&(req.body.ProfileId = req.body.fonction.id)
		let { password, ...user } = (await User.create(req.body)).toJSON();
		return res.json(user);
	} catch (err) {
		console.log(err);
		return res.status(500).send(err.name || err.original.code);
	}
};

exports.update = async (req, res) => {
	const user = await User.update(req.body, { where: { id: req.params.id } });
	return res.json(user);
};

exports.delete = async (req, res) => {
	const user = await User.destroy({ where: { id: req.params.id } });
	return res.json(user);
};
exports.login = async (req, res) => {
	const { username, password } = req.body;
	console.log('salut')
	switch (req.body.type) {
		case 'admin':
			const user = await User.findOne({
				where: { username },
				include: [
					{
						model: Profile,
						include: [Autorisation],
					},
				],
			});
			if (!user) return res.status(403).send({ success: false });
			user.verifyHash(password).then((isValid) => {
				if (!isValid) return res.status(403).send({ success: false });
				const { p, ...userjson } = user.toJSON();
				return res.send({ user: userjson, token: jwtSign(userjson, "user") });
			})
			break;
		case 'client':
			try {
				
				const client = await Client.findOne({ where: { username }, include: [TypeClient] });
				if (!client) return res.status(403).send({ success: false });
				client.verifyHash(password).then((isValid) => {
					console.log(isValid)
					if (!isValid) return res.status(403).send({ success: false });
					const { p, ...userjson } = client.toJSON();
					return res.send({ user: userjson, token: jwtSign(userjson, "client") });
				}).catch((err) => {
					console.log(err)
				})
			} catch (err) {
				console.log(err)
				res.status(500).send(err)
			}
			break;
		default:
			return res.status(403).send({ success: false });
	}
	
	
	
	
};

exports.register = async (req, res) => {
	try {
		const user = await User.create(req.body);
		const { password, ...userjson } = user.toJSON();
		res.send({ user: userjson, token: jwtSign(userjson) });
	} catch (err) {
		return res.status(403).send(err);
	}
};

exports.checklogin = async (req, res) => {
	if (req.user)
		return res.status(200).send({ success: true, user: req.user.toJSON() });
	return res.status(403).send({ success: false });
};
exports.count = async (req, res) => {
	const count = await User.count({ where: req.where });
	return res.json(count);
}