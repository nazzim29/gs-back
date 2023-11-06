const router = require("express").Router();
const { ClientController, FeedbackController } = require("../controllers");
const { isAuth } = require("../middlewares/Auth");
const passport = require("passport");
const ParseParams = require("../middlewares/ParseQuery");
router.get("/", ParseParams, ClientController.index);
router.get("/:id([0-9]+)", ClientController.show);
router.get("/:id([0-9]+)/etat", ClientController.etatActuelle);
router.post("/", isAuth(), ClientController.create);
router.patch("/:id([0-9]+)", ClientController.update);
router.delete("/:id([0-9]+)", ClientController.delete);
router.post(
  "/login",
  passport.authenticate("client", { session: false }),
  ClientController.login
);
router.get('/count', isAuth(), ClientController.count)
router.get('/best-buyer', isAuth(), ClientController.bestBuyer)

module.exports  = router;
