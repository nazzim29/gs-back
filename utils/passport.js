const { User, Profile, Autorisation } = require("../models");

const JwtStrategy = require("passport-jwt").Strategy;
const ExtractJwt = require("passport-jwt").ExtractJwt;


module.exports = (passport) => {
	console.log(passport);
	passport.use(
		new JwtStrategy(
			{
				jwtFromRequest: (req) => {
					return req.headers.authorization;
				},
				secretOrKey: process.env.AUTH_SECRET,
			},
			async ({id}, done) => {
				try {
					const user = await User.findOne({
						where: { id },
						include: [{ model: Profile, include: [Autorisation] }],
					});
					
					if (!user) return done(new Error("User not found"), null);
					return done(null, user);
				} catch (e) {
					console.log(e)
					return done(null, null);
				}
			}
		)
	);
};
