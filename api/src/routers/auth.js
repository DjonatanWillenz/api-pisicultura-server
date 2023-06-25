const router = require("express").Router();

const controller = require("../controllers/auth");

router.route("/register")
    .post((req, res) => controller.create(req, res));

router.route("/login")
    .post((req, res) => controller.login(req, res));

module.exports = router;