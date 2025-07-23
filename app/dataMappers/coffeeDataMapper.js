import client from "../database/client.js";

const coffeeDataMapper = {
    /* Récupération des trois derniers cafés */
  async findLastThreeCoffees() {
    const result = await client.query(
      "SELECT * FROM coffee ORDER BY created_at DESC LIMIT 3"
    );
    return result.rows;
  },

    /* Récupération de tous les cafés */
    async findAllCoffees() {
    const result = await client.query("SELECT * FROM coffee ORDER BY created_at DESC");
    return result.rows;
  },

  /* Récupération d'un café par son ID */
async findCoffeeById(id) {
  const result = await client.query(
    `
    SELECT
      coffee.*,
      origin_country.name AS origin_country,
      ARRAY_AGG(characteristic.name) AS characteristics
    FROM coffee
    JOIN origin_country ON coffee.origin_country_id = origin_country.id
    LEFT JOIN coffee_has_characteristic ON coffee.id = coffee_has_characteristic.coffee_id
    LEFT JOIN characteristic ON coffee_has_characteristic.characteristic_id = characteristic.id
    WHERE coffee.id = $1
    GROUP BY coffee.id, origin_country.name
    `,
    [id]
  );
  return result.rows[0];
}

};

export default coffeeDataMapper;
