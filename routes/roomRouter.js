const express = require("express");
const router = express.Router();
const roomController = require("../controller/room");

router
  .route("/")
  .get(roomController.getAllRooms)
  .post(roomController.createRoom);

router
  .route("/:id")
  .get(roomController.getRoomById)
  .put(roomController.updateRoom)
  .delete(roomController.deleteRoom);

module.exports = router;
