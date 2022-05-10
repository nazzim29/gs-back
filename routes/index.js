const fs = require("fs");
const { UserController } = require("../controllers");
const { isAuth } = require("../middlewares/Auth");
const passport = require("passport");
var exec = require("child_process").exec;
module.exports = (app) => {
	app.post("/register", UserController.register);
	app.post(
		"/login",
		UserController.login
	);
	app.get("/checklogin", isAuth(), UserController.checklogin);
    app.get("/dump", async (req, res) => {
        const fn = Date.now();
		exec(
			`mysqldump --databases --user=root --password="" gs-test > ./uploads/backups/${fn}.sql`,
			(err, stdout, stderr) => {
				if (err) {
                    console.log(err);
                    res.status(500).send(err);
					return;
                }
                res.download(`./uploads/backups/${fn}.sql`);
			}
		);
    });
    app.get('/lastdump', async (req, res) => {
        const files = fs.readdirSync('./uploads/backups/');
        const last = files.sort().reverse()[0];
        console.log(last);
        res.download(`./uploads/backups/${last}`);
    })
	console.log("Registring Routes ...");
	fs.readdirSync(__dirname)
		.filter((file) => file !== "index.js" && file.endsWith(".js"))
		.forEach((router) => {
			app.use(`/${router.replace(".js", "")}`, require("./" + router));
			// console.log(`registred route ${router.replace('.js','')}`)
		});
};
