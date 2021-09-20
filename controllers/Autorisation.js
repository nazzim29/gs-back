const {DataTypes : {Op} } = require("sequelize");
const { Autorisation } = require("../models");
exports.index = async (req, res) => {
	const autorisations = await Autorisation.findAll({
		where: {
			nom: req.query.nom?{
				[Op.like]: "%" +req.query.nom+ "%",
            }:undefined,
            description: req.query.description ? {
                [Op.like]:"%"+req.query.description+"%"
            }:undefined
		},
    });
    return res.json(autorisations)
};
exports.show = async (req, res) => {
    const autorisation = await Autorisation.findOne({
        where: {
            id:req.params.id
        }
    })
    return res.json(autorisation)
};
exports.create = async (req, res) => {
    const autorisation = await Autorisation.create(req.body)
    return res.json(autorisation)
};
exports.update = async (req, res) => {
    const autorisation = await Autorisation.update(req.body, { where: { id: req.params.id } })
    return res.json(autorisation)
};
exports.delete = async (req, res) => {
    const autorisation = await Autorisation.destroy({ where: { id: req.params.id } })
    return res.json(autorisation)

};
