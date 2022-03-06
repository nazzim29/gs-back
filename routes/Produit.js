const router = require('express').Router()
const {ProduitController} = require('../controllers')
const {isAuth} = require('../middlewares/Auth')
router.get('/',ProduitController.index)
router.get('/:id([0-9]+)',ProduitController.show)
router.post('/',isAuth(),ProduitController.create)
router.patch('/:id([0-9]+)',ProduitController.update)
router.delete('/:id([0-9]+)',ProduitController.delete)

module.exports  = router;