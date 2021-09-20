const {Fonction} = require('../models')
exports.index = async (req, res) => {
    const fonctions = await Fonction.findAll()

    return res.json(fonctions)

}
exports.show = async (req,res)=>{
    const fonction = await Fonction.create(req.body)
    return res.json(fonction)
}
exports.create = async (req,res)=>{
    try {
        const fonction = await Fonction.create(req.body)
        return res.send(fonction.toJSON())
    } catch (e) {
        return res.send(e)
    }
}
exports.update = async (req,res)=>{
    const fonction = await Fonction.update(req.body, { where: { id: req.params.id } })
    return res.json(fonction)
}
exports.delete = async (req,res)=>{
    const fonction = await Fonction.destroy({ where: { id: req.params.id } })
    return res.json(fonction)
}