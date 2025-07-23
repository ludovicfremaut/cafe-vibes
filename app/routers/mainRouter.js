import express from "express";
import homeController from "../controllers/homeController.js";
import catalogController from "../controllers/catalogController.js";

const mainRouter = express.Router();

// Routes
mainRouter.get("/", homeController.getHomePage);

mainRouter.get("/catalog", catalogController.getCatalogPage);

mainRouter.get("/catalog/:id", catalogController.getCoffeeById);

mainRouter.get("/about", (req, res) => {
  res.render("about");
});


mainRouter.get("/contact", (req, res) => {
  res.render("contact");
});

export default mainRouter;
