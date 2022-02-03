require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const morgan = require("morgan");
const { sequelize } = require("./models");
const passport = require("passport");
require("./utils/passport")(passport);
const app = express();
app.use(bodyParser.json({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.text({ extended : true}));
app.use(morgan("dev"));
app.use(cors());
app.use(passport.initialize());
require("./routes")(app);
app.get("/", passport.authenticate('jwt',{}),(req, res) => {
	res.json({
		message: "Hello world!!",
	});
});
sequelize
	.sync({
		force: false
		, logging: false
	})
	.then(() => {
		return app.listen(process.env.PORT || 2931, (p) => {
			console.log(
				"app started at http://localhost:" + (process.env.PORT || 8080)
			);
			return app;
		});
	})
	.catch((err) => {
		throw err;
	});
