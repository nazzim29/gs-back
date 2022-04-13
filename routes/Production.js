const router = require("express").Router();
const { ProductionController } = require("../controllers");
const { isAuth } = require("../middlewares/Auth");
const ParseParams = require("../middlewares/ParseQuery");


router.get("/", ParseParams, ProductionController.index);
router.get("/:id([0-9]+)", ProductionController.show);
router.post(
	"/",
	isAuth(),
	ProductionController.create
);
router.patch("/:id([0-9]+)", ProductionController.update);
router.delete("/:id([0-9]+)", ProductionController.delete);

module.exports = router;
