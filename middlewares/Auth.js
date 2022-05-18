const jwt = require("jsonwebtoken");
const {
	Client,
	TypeClient,
	User,
	Profile,
	Autorisation,
} = require("../models");

const jwtDecode = (token) => {
	const ONE_DAY = "1 days";
	try {
		return jwt.verify(token, process.env.AUTH_SECRET);
	} catch (error) {
		throw new Error("unauthorized");
		return null;
	}
};
const parseUser = async (req, res, next) => {
	if(!req.headers.authorization) return res.status(401).json({error:"unauthorized"})
	const token = req.headers.authorization.split(" ")[1];
	const { type, id } = jwtDecode(token);
	if (type == "client") {
		const client = await Client.findByPk(id, { include: [TypeClient] });
		if (!client) return res.status(403).send({ message: "unauthorized" });
		req.user = client;
		
		return next();
	} else if (type == "user") {
		const user =  await User.findByPk(id, {
			include: [
				{
					model: Profile,
					include: [Autorisation],
				},
			],
		});
		if (!user) return res.status(403).send({ message: "unauthorized" });
		req.user = user
		return next()
	}
	return res.status(403).send({ message: "unauthorized" });
};

exports.isAuth = (fonctionalite) => {
	if (!fonctionalite) return parseUser;
	return [parseUser, can(fonctionalite)];
};

function can(action) {
	return async (req, res, next) => {
		if (!req.user) res.status(403).json({ error: "user not loged-in" });
		const autorisations = req.user.Profile.Autorisations.map((e) => e.nom);
		return next();
		if (autorisations.include(action)) return next();
		if (!req.user["has" + action.split("-")[1]])
			return res.status(401).json({ error: "unauthorized" });
		if (
			autorisations.include(
				action.split("-")[0] + "-own-" + action.split("-")[1]
			) &&
			(await req.user["has" + action.split("-")[1]](req.params.id))
		)
			return next();
		else return req.status(401).json({ error: "unauthorized" });
	};
}
