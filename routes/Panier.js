const router = require("express").Router();
const { PanierController } = require("../controllers");
const { isAuth } = require("../middlewares/Auth");
router.get("/", isAuth(), PanierController.index);
router.delete("/",isAuth(),PanierController.clearCart)
router.post("/:id([0-9]+)", isAuth(), PanierController.addToCart);
router.get('/validate',isAuth(),PanierController.validate)
router.patch("/:id([0-9]+)", isAuth(), PanierController.changeQuantity);
router.delete("/:id([0-9]+)", isAuth(),PanierController.removeFromCart);

module.exports = router;
