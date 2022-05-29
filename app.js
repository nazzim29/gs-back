require("dotenv").config();
var exec = require("child_process").exec;
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const morgan = require("morgan");
const { sequelize } = require("./models");
const passport = require("passport");
const FixObjectAsString = require("./middlewares/FixObjectAsString");
var cron = require("node-cron");
require("./utils/passport")(passport);
const app = express();
app.use(
	cors({
		origin: "http://localhost:8080/",
	})
);
app.options("*", cors());
app.enableCors({
	origin: true,
	methods: "GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS",
	credentials: true,
});
app.use(bodyParser.json({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.text({ extended: true }));
app.use(morgan("dev"));
app.use(passport.initialize());
app.use(FixObjectAsString);
app.use("/uploads", express.static("./uploads"));
require("./routes")(app);
//* * * * * *
//chaque jour a  minuit
cron.schedule("0 0 0 * * *", () => {
	const fn = Date.now();
	exec(
		`mysqldump --databases --host=${process.env.DB_URL} --user=${process.env.DB_USERNAME} --password="${process.env.DB_PASSWORD}" ${process.env.DB_NAME} > ./uploads/backups/${fn}.sql`,
		(err, stdout, stderr) => {
			if (err) {
				console.log("automatique backup failed: ");
				console.log(err);
				return;
			}
			console.log("automatique backup success");
		}
	);
});
app.get("/", passport.authenticate("jwt", {}), (req, res) => {
	res.json({
		message: "Hello world!!",
	});
});
sequelize
	.sync({
		force: false,
		logging: false,
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

module.exports = app;
