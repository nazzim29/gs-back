const { User } = require("../models");
const jwt = require("jsonwebtoken");

const jwtSign = (user) => {
  const ONE_DAY = 60 * 60 * 24;
  return jwt.sign(user, process.env.AUTH_SECRET, { expiresIn: ONE_DAY });
};

exports.index = async (req, res) => {
  const users = await User.findAll()
  return res.json(users)
};

exports.show = async (req, res) => {
  const user = await User.findOne({where:{id:req.params.id}})
  return res.json(user)
};

exports.create = async (req, res) => {
  const user = await User.create(req.body)
  return res.json(user)
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
    const user = await User.findOne({ where: { username: username } });
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
