"use strict";

const { faker } = require("@faker-js/faker");
faker.locale = "fr";

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
		const commande = [...Array(100)].map((user) => ({
			
			createdAt: faker.date.past(),
			updatedAt: faker.date.past(),
			ClientId: 1,
			UserId: 1,
		}));
    await queryInterface.bulkInsert("commandes", commande,{})
	},

	async down(queryInterface, Sequelize) {
		/**
		 * Add commands to revert seed here.
		 *
		 * Example:
		 * await queryInterface.bulkDelete('People', null, {});
		 */
		await queryInterface.bulkDelete("commandes", null, {});
	},
};
