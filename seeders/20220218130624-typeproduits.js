"use strict";
const { faker } = require("@faker-js/faker");
faker.locale = "fr";

const types = [
	{
		nom: "satiné",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
  {
    nom: "special plafond",
    createdAt: new Date(),
    updatedAt: new Date(),
  },
];
module.exports = {
	async up(queryInterface, Sequelize) {
		/**
		 * Add seed commands here.
		 *
		 * Example:
		 * await queryInterface.bulkInsert('People', [{
		 *   name: 'John Doe',
		 *   isBetaMember: false
		 * }], {});
		 */
    await queryInterface.bulkInsert("typeproduits", types, {});
	},

	async down(queryInterface, Sequelize) {
		/**
		 * Add commands to revert seed here.
		 *
		 * Example:
		 * await queryInterface.bulkDelete('People', null, {});
		 */
    await queryInterface.bulkDelete("typeproduits", null, {});
	},
};
