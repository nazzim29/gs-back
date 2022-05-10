const { Op } = require("sequelize");
module.exports = function (req, res, next) {
	let or = null;
	req.where = {};
	console.log(req.params);
	Object.keys(req.query).forEach((key) => {
		if (Array.isArray(req.query[key])) {
			req.where[key] = req.query[key];
		} else if (req.query[key] == "true") {
			req.where[key] = true;
		} else if (req.query[key] == "false") {
			req.where[key] = false;
		} else if (typeof parseFloat(req.query[key]) == "float") {
			req.where[key] = parseFloat(req.query[key]);
		} else {
			if (!or) or = {};
			or[key] = {
				[Op.like]: "%" + req.query[key] + "%",
			};
		}
	});
	if (or) req.where[Op.or] = or;
	console.log(req.where);
	next();
};
