const {Vente,Produit,User,Client}= require('../models')
exports.index = async (req, res) => {
    if (req.user instanceof User) {
        
    } else {
        const ventes = await Vente.findAll({
            where: {
                ...req.where,
                ClientId: req.user.id
            }
        })
        return res.json(ventes)
    }
}
exports.show = async (req,res)=>{
    const vente = await Vente.findOne({
        where: { id: req.params.id },
        include: [
            {
                model: Produit,
            }
        ]
    });
    if (!vente) return res.status(404).json({ error: 'vente not found' })
    console.log(req.user.id, vente.Client.id)
    if (req.user instanceof Client && vente.Client.id !== req.user.id) return res.status(403).json({ error: 'access denied' })
    return res.json(vente)
}
exports.create = async (req,res)=>{
    const vente = await Vente.create(req.body)
    return res.json(vente)
}
exports.update = async (req,res)=>{
    const vente = await Vente.update(req.body, { where: { id: res.body.id } })
    return res.json(vente)
}
exports.delete = async (req,res)=>{
    const vente = await Vente.destroy({ where: { id: req.params.id } })
    return res.json(vente)
}