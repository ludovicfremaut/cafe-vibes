import coffeeDataMapper from "../dataMappers/coffeeDataMapper.js";

const catalogController = {
  async getCatalogPage(req, res) {
    try {
      const showAll = req.query.all === "true";
      const coffees = showAll
        ? await coffeeDataMapper.findAllCoffees()
        : await coffeeDataMapper.findLastThreeCoffees();

      res.render("catalog", { coffees, showAll });
    } catch (error) {
      console.error(error);
      res.status(500).send("Erreur serveur");
    }
  },

    async getCoffeeById(req, res) {
        try {
        const coffeeId = req.params.id;
        const coffee = await coffeeDataMapper.findCoffeeById(coffeeId);
    
        if (!coffee) {
            return res.status(404).send("Café non trouvé");
        }
    
        res.render("coffeeDetail", { coffee });
        } catch (error) {
        console.error(error);
        res.status(500).send("Erreur serveur");
        }
    },
};

export default catalogController;
