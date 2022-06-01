const router = require('express').Router()
const {PayementController} = require('../controllers')
const {isAuth} = require('../middlewares/Auth')
router.get('/',isAuth(),PayementController.index)
router.get('/:id([0-9]+)',isAuth(),PayementController.show)
router.post('/',isAuth(),PayementController.create)
router.patch('/:id([0-9]+)',isAuth(),PayementController.update)
router.delete('/:id([0-9]+)',isAuth(),PayementController.delete)

module.exports  = router;