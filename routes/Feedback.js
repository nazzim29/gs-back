const router = require("express").Router();
const { FeedbackController } = require("../controllers");
const ParseQuery = require("../middlewares/ParseQuery");
router.get("/",ParseQuery, FeedbackController.index);
router.get("/:id([0-9]+)", FeedbackController.show);
router.post("/", FeedbackController.create);
router.post("/:id([0-9]+)", FeedbackController.update);
router.delete("/:id([0-9]+)", FeedbackController.delete);

module.exports = router;
