const router = require("express").Router();
const { ProduitController } = require("../controllers");
const { isAuth } = require("../middlewares/Auth");
const ParseParams = require("../middlewares/ParseQuery");
const multer = require("multer");
const FixObjectAsString = require("../middlewares/FixObjectAsString");
const upload = multer({ dest: "uploads/Products" });
router.get("/", ParseParams, ProduitController.index);
router.get("/:id([0-9]+)", ProduitController.show);
router.post(
	"/",
	isAuth(),
	upload.single("image"),
	FixObjectAsString,
	ProduitController.storeImage,
	ProduitController.create
);
router.patch("/:id([0-9]+)", ProduitController.update);
router.delete("/:id([0-9]+)", ProduitController.delete);
router.post("/:id([0-9]+)/formule", isAuth(), ProduitController.addFormule);
router.delete(
	"/:ProduitId([0-9]+)/formule/:MatiereId([0-9]+)",
	isAuth(),
	ProduitController.removeFormule
);

module.exports = router;
