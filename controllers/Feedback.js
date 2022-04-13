const { Feedback } = require('../models')


exports.index = async (req, res) => {
    try {
        const feedbacks = await Feedback.findAll({ where: { ...req.where, lu: false } })
        return res.json(feedbacks)
    } catch (err) {
        return res.status(500).json({message: "Error getting feedbacks"})
    }
    
}
exports.show = async (req, res) => {
    
}
exports.create = async (req, res) => {
    console.log(req.body)
    const feedback = await Feedback.create(req.body)
    return res.json(feedback)
}
exports.update = async (req, res) => {
    try {
        const feedback = await Feedback.findByPk(req.params.id)
        if(!feedback) return res.status(404).json({message: "Feedback not found"})
        feedback.lu = true;
        await feedback.save()
        return res.json(feedback)
    } catch (err) {
        return res.status(500).json({message: "Error updating feedback"})
    }
}
exports.delete = async (req, res) => {
    
}