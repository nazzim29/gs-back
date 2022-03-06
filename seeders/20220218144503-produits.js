'use strict';
const { faker } = require("@faker-js/faker");
faker.locale = "fr";

const produits = [...Array(100)].map((user) => ({
	nom: faker.commerce.productName(),
	contenance: faker.helpers.randomize([5, 15, 10]),
  featured: faker.helpers.randomize([true, false]),
  TypeProduitId: faker.helpers.randomize([1, 2]),
  CouleurId: 1,
}));


module.exports = {
  async up (queryInterface, Sequelize) {
    /**
     * Add seed commands here.
     *
     * Example:
     * await queryInterface.bulkInsert('People', [{
     *   name: 'John Doe',
     *   isBetaMember: false
     * }], {});
    */
    await queryInterface.bulkInsert('produits', produits,{})
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
    await queryInterface.bulkDelete('produits', null,{})
  }
};
