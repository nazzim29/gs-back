const router = require('express').Router()
const {VenteController} = require('../controllers')
const ParseQuery = require('../middlewares/ParseQuery.js')
const { isAuth } = require("../middlewares/Auth");

router.get('/',isAuth(),ParseQuery,VenteController.index)
router.get('/:id([0-9]+)',isAuth(),VenteController.show)
router.get('/:id([0-9]+)/facture',isAuth(),VenteController.downloadFacture)
router.post("/", isAuth(), VenteController.create);
router.post("/:id([0-9]+)", isAuth(), VenteController.update);
router.delete("/:id([0-9]+)", isAuth(), VenteController.delete);
router.get("/count", isAuth(), VenteController.count);
router.get("/count", isAuth(), VenteController.count);
// router.get("/:id([0-9]+)/facture", isAuth(), VenteController.getfacture);
module.exports  = router;