const router = require('express').Router()
const {FonctionController} = require('../controllers')

router.get('/',FonctionController.index)
router.get('/:id([0-9]+)',FonctionController.show)
router.post('/',FonctionController.create)
router.patch('/:id([0-9]+)',FonctionController.update)
router.delete('/:id([0-9]+)',FonctionController.delete)

module.exports  = router;