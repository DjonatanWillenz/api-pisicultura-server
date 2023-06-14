const { User: UserModel } = require('../models/user.js');

module.exports = {
    async create(json) {

        if (UserModel.find({ email: json.email }))
            throw "E-mail in use.";

        const user = UserModel({
            email: json.email,
            name: json.name,
            password: json.password
        });

        return user.save();
    },

    async findByEmailAndPassword(email, password) {
        const response = UserModel.find({ email: email, password: password });
        if (!response)
            throw Error("E-mail or password is not valid...")
        return response;
    }
}