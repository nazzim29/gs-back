const { User, Profile,Autorisation } = require("../models");
const { Op } = require("sequelize");
const jwt = require("jsonwebtoken");

const jwtSign = (user) => {
  const ONE_DAY = "1 days";
  return jwt.sign({id:user}, process.env.AUTH_SECRET);
};

exports.index = async (req, res) => {

  const users = await User.findAll({
    where:req.where,
    attributes: {
      exlude: ['password','ProfileId']
    },
    include: {model: Profile, include : Autorisation}
  })
  return res.json(users)
};

exports.show = async (req, res) => {
  const user = await User.findOne({
		where: { id: req.params.id },
		attributes: {
			exlude: ["password", "ProfileId"],
		},
		include: Profile,
	});
  return res.json(user)
};

exports.create = async (req, res) => {
  try {
    let { password, ...user } = (await User.create(req.body)).toJSON()
    return res.json(user)
  } catch (err) {
    return res.status(500).send(err.name || err.original.code)
  }
};

exports.update = async (req, res) => {
  const user = await User.update(req.body, { where: { id: req.params.id } })
  return res.json(user)
};

exports.delete = async (req, res) => {
  const user = await User.destroy({ where: { id: req.params.id } })
  return res.json(user)
};
exports.login = async (req, res) => {
  try {
    const { username, password } = req.body;
    const user = await User.findOne({ where: { username: username }, include: [Profile] });
    if (!user)
      return res.status(403).send({ error: "Invalid login creditentials" });

    if (!user.verifyHash(password))
      return res.status(403).send({ error: "Invalid login creditentials" });
    {
      const { password, ...userjson } = user.toJSON();
      return res.send({
        user: userjson,
        token: jwtSign(userjson.id),
      });
    }
  } catch (e) {
    console.log(e);
    return res.status(500).send({
      error: "error while loggin-in",
    });
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
  if (req.user) return res.status(200).send({ success: true, user : req.user.toJSON() });
  return res.status(403).send({ success: false });
}


