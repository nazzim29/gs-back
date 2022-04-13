const router = require("express").Router();
const { MatiereController } = require("../controllers");

router.get("/", MatiereController.index);
router.post("/arrivage", MatiereController.arrivage);
router.get("/:id([0-9]+)", MatiereController.show);
router.post("/", MatiereController.create);
router.patch("/:id([0-9]+)", MatiereController.update);
router.delete("/:id([0-9]+)", MatiereController.delete);

module.exports = router;
