const router = require('express').Router()
const {VenteController} = require('../controllers')
const ParseQuery = require('/middlewares/parseQuery.js')
router.get('/',ParseQuery,VenteController.index)
router.get('/:id([0-9]+)',VenteController.show)
router.post('/',VenteController.create)
router.patch('/:id([0-9]+)',VenteController.update)
router.delete('/:id([0-9]+)',VenteController.delete)

module.exports  = router;