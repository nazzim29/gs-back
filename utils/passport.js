const { User, Profile, Autorisation } = require("../models");
const LocalStrategy = require("passport-local").Strategy;
var JwtStrategy = require("passport-jwt").Strategy,
	ExtractJwt = require("passport-jwt").ExtractJwt;
var opts = {};
opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = process.env.AUTH_SECRET;

module.exports = (passport) => {
	passport.use("local",
		new LocalStrategy(
			{
				usernameField: "username",
				passwordField: "password",
			},
			function (username, password, cb) {
				
				return User.findOne({
					where: { username },
					include: {
						model: Profile,
						include:[Autorisation]
					},
				})
					.then((user) => {
						if (!user) {
							return cb(null, false, {
								message: "Incorrect email or password.",
							});
						}
						if (!user.verifyHash(password))
							return cb(null, false, {
								message: "Incorrect email or password.",
							});
						return cb(null, user, { message: "Logged In Successfully" });
					})
					.catch((err) => cb(err));
			}
		)
	);
	passport.use("client",
		new LocalStrategy(
			{
				usernameField: "username",
				passwordField: "password",
			},
			function (raisonSociale, password, cb) {
				
				return Client.findOne({
					where: { raisonSociale },
				})
					.then((user) => {
						if (!user) {
							return cb(null, false, {
								message: "Incorrect email or password.",
							});
						}
						if (!user.verifyHash(password))
							return cb(null, false, {
								message: "Incorrect email or password.",
							});
						user.type
						return cb(null, user, { message: "Logged In Successfully" });
					})
					.catch((err) => cb(err));
			}
		)
	);
	passport.use(
		new JwtStrategy(opts, async function (jwt_payload, done) {
			try {
				const user = await User.findOne({
					where: { id: jwt_payload.id },
					include: [
						{
							model: Profile,
							include: [Autorisation],
						},
					],
				});
				if (!user) return done(new Error("User not found"), false);
				return done(null, user);
			} catch (e) {
				console.log(e);
				return done(e, false);
			}
		})
	);
	console.log(passport.Strategy);

	// passport.use(
	// 	new BearerStrategy(async ({ id }, done) => {
	// 		try {
	// 			const user = await User.findOne({
	// 				where: { id },
	// 				include: [{ model: Profile, include: [Autorisation] }],
	// 			});
	// 			console.log(user);
	// 			if (!user) return done(new Error("User not found"), null);
	// 			return done(null, user);
	// 		} catch (e) {
	// 			console.log(e);
	// 			return done(null, null);
	// 		}
	// 	})
	// );
};
