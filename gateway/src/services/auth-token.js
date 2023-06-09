const jwt = require("jsonwebtoken");

module.exports = {

    checkToken(req, res) {
        const authHeader = req.headers["authorization"];
        const token = authHeader && authHeader.split(" ")[1];
        if (!token) return res.status(401).json({ msg: "Acesso negado!" });
        try {
            jwt.verify(token, process.env.SECRET);
        } catch (err) {
            res.status(400).json({ msg: "O Token é inválido!" });
        }
    }
}