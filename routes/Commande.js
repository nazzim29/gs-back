const router = require('express').Router()
const {CommandeController} = require('../controllers')
const ParseQuery = require('../middlewares/ParseQuery')
const {isAuth} = require('../middlewares/Auth')
router.get('/',isAuth(),ParseQuery,CommandeController.index)
router.get('/:id([0-9]+)',CommandeController.show)
router.get('/:id([0-9]+)/validate',isAuth(),CommandeController.validate)
router.post('/',isAuth(),CommandeController.create)
router.post("/:id([0-9]+)/produit", CommandeController.addproduct);
router.delete("/:id([0-9]+)/produit/:idProduct([0-9]+)", CommandeController.deleteProduct);
router.patch("/:id([0-9]+)/produit/:idProduct([0-9]+)", CommandeController.updateProduct);
router.patch('/:id([0-9]+)',isAuth(),CommandeController.update)
router.delete('/:id([0-9]+)',CommandeController.delete)

module.exports  = router;