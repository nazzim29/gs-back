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
// app.get("/uploads/:filename", (req, res) => {
// 	const filePath = path.join(__dirname, "uploads", req.params.filename);
// 	const stat = fs.statSync(filePath);
// 	res.set({
// 		"Access-Control-Allow-Origin": "*",
// 		"Content-Length": stat.size,
// 	});
// 	const stream = fs.createReadStream(filePath);
// 	stream.pipe(res);
// });
var whitelist = [
	"http://admin.vost-dz.com",
	"https://admin.vost-dz.com",
	"http://vost-dz.com",
	"https://vost-dz.com",
	"http://localhost:8080",
];
var corsOptions = {
  origin: function (origin, callback) {
    // if (whitelist.indexOf(origin) !== -1) {
      callback(null, true)
    // } else {
    //   callback(new Error('Not allowed by CORS'))
    // }
  }
}

app.options("*", cors(corsOptions));
app.use(bodyParser.json({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.text({ extended: true }));
app.use(morgan("dev"));
app.use(passport.initialize());
app.use(FixObjectAsString);

  const baseRouter = require('express').Router()
  require("./routes")(baseRouter);
  app.use("",cors(corsOptions),baseRouter)

//* * * * * *
//chaque jour a  minuit
console.log(!!parseInt(process.env.PRODUCTION_MODE))
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
		force: false,//!!parseInt(process.env.PRODUCTION_MODE),
		logging: !!parseInt(process.env.PRODUCTION_MODE),
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
