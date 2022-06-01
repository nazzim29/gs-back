const router = require('express').Router()
const {UserController} = require('../controllers')
const ParseParams = require('../middlewares/ParseQuery')

router.get('/',ParseParams,UserController.index)
router.get('/:id([0-9]+)',UserController.show)
router.post('/',UserController.create)
router.patch('/:id([0-9]+)',UserController.update)
router.delete('/:id([0-9]+)',UserController.delete)
router.get('/count',UserController.count)
module.exports  = router;