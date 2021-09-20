const passport = require("passport");

exports.isAuth = (req, res, next) => {
	passport.authenticate("jwt", (err, user) => {
		if (err) return res.status(403).json({ error: "user not loged-in" });
		if (user) {
			req.user = user;
			return next();
		}
		return res.status(500).json({ error: "internal server error" });
	});
};

exports.can = async(action) => {
	return async (req, res, next) => {
		if (!req.user) res.status(403).json({ error: "user not loged-in" });
		const autorisations = req.user.Fonction.Autorisations.map((e) => e.nom);
		if (autorisations.include(action)) return next();
		if (!req.user["has" + action.split("-")[1]])
			return res.status(401).json({ error: "unauthorized" });
        if (autorisations.include(action.split("-")[0] + "-own-" + action.split("-")[1])&& (await req.user["has" + action.split("-")[1]](req.params.id) ))
            return next()
        else return req.status(401).json({ error: "unauthorized" });
	};
};
