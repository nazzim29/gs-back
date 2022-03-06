const passport = require("passport");

exports.isAuth = (fonctionalite) => {
	if (!fonctionalite) return passport.authenticate("jwt", { session: false });
	return [
		passport.authenticate("jwt", { session: false }),
		can(fonctionalite),
	];
};

function can(action) {
	return async(req, res, next) => {
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
			(await (req.user["has" + action.split("-")[1]](req.params.id)))
		)
			return next();
		else return req.status(401).json({ error: "unauthorized" });
	};
}
