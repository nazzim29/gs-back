const router = require('express').Router()
const {CommandeController} = require('../controllers')

router.get('/',CommandeController.index)
router.get('/:id([0-9]+)',CommandeController.show)
router.post('/',CommandeController.create)
router.patch('/:id([0-9]+)',CommandeController.update)
router.delete('/:id([0-9]+)',CommandeController.delete)

module.exports  = router;