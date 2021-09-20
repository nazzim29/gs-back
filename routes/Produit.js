const router = require('express').Router()
const {ProduitController} = require('../controllers')

router.get('/',ProduitController.index)
router.get('/:id([0-9]+)',ProduitController.show)
router.post('/',ProduitController.create)
router.patch('/:id([0-9]+)',ProduitController.update)
router.delete('/:id([0-9]+)',ProduitController.delete)

module.exports  = router;