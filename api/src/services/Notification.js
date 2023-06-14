const { Notification: NotificationModel } = require("../models/notifications");

module.exports = {
   async create(vo) {
      
      const model = new NotificationModel({
        title: vo.title,
        description: vo.description,        
        state: "PENDING",
        type: "EMAIL",
        onCreate: new Date(),
        destiny: vo.destiny
      });

    await model.save();
    console.log(NotificationModel.findAll())
   } 
}