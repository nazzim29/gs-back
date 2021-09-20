const passport = require("passport");
const { User,Fonction,Autorisation } = require("./models");

const JwtStrategy = require("passport-jwt").Strategy;
const ExtractJwt = require("passport-jwt").ExtractJwt;

passport.use(
	new JwtStrategy(
		{
			jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
			secretOrKey: process.env.AUTH_SECRET,
		},
		async (jwtPayload, done) => {
			try {
				const user = await User.findOne({
					where: { id: jwtPayload },
          include: {all:true,nested:true},
				});
				if (!user) return done(new Error("User not found"), null);
				return done(null, user);
			} catch (e) {
				return done(null, null);
			}
		}
	)
);

module.exports = null;
