import coffeeDataMapper from "../dataMappers/coffeeDataMapper.js";

const homeController = {
  async getHomePage(req, res) {
    try {
      const lastCoffees = await coffeeDataMapper.findLastThreeCoffees();
      res.render("home", { lastCoffees });
    } catch (error) {
      console.error(error);
      res.status(500).send("Erreur interne serveur");
    }
  },

  async getTestPage(req, res) {
    try {
      res.render("test");
    } catch (error) {
      console.error(error);
      res.status(500).send("Erreur interne serveur");
    }
  }
};


export default homeController;
