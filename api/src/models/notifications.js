const mongoose = require("mongoose");
const { UserSchema } = require("./user");

const { Schema } = mongoose;

const NotificationSchema = new Schema({
    id: {
        type: String
    },
    title: {
        type: String,
        require: true
    },
    description: {
        type: String,
        require: true
    },
    type: {
        type: String,
        require: true
    },
    user: {
        type: UserSchema,
        require: true
    },
    state: {
        type: String,
        require: true
    },
    sendAt: {
        type: Date,
        require: true
    }
}, { timestamps: true });

const Notification = mongoose.model("notification", NotificationSchema);

module.exports = { Notification, NotificationSchema };
