'use strict';

const { faker } = require('@faker-js/faker');
faker.locale = "fr";

const users = [
	...Array(100)
		.fill(0)
		.map((user, i) => i+1),
];
const clients = [
	...Array(100)
		.fill(0)
		.map((user, i) => i +1),
];

const commande = [...Array(100)].map((user) => ({
  date: faker.date.past(),
  createdAt: new Date(),
  updatedAt: new Date(),
  ClientId: faker.helpers.randomize(clients),
  UserId: faker.helpers.randomize(users),
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
    await queryInterface.bulkInsert('commandes', commande, {})
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
    await queryInterface.bulkDelete('commandes', null, {})
  }
};
