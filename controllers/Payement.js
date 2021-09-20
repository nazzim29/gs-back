const {Payement} = require('../models')
exports.index = async (req,res)=>{
    const payements = await Payement.findAll()
    return res.json(payements)
}
exports.show = async (req,res)=>{
    const payement = await Payement.findOne({ where: { id: req.params.id } })
    return res.json(payement)
}
exports.create = async (req,res)=>{
    const payement = Payement.create(req.body)
    return res.json(payement)
}
exports.update = async (req,res)=>{
    const payement = await Payement.update(req.body, { where: { id: req.params.id } })
    return res.json(payement)
}
exports.delete = async (req,res)=>{
    const payement = await Payement.destroy({ where: { id: req.params.id } })
    return res.json(payement)
}