const router = require('express').Router()
const {CouleurController} = require('../controllers')

router.get('/',CouleurController.index)
router.get('/:id([0-9]+)',CouleurController.show)
router.post('/',CouleurController.create)
router.patch('/:id([0-9]+)',CouleurController.update)
router.delete('/:id([0-9]+)',CouleurController.delete)

module.exports  = router;