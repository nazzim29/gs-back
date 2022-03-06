"use strict";

const { faker } = require("@faker-js/faker");
faker.locale = "fr";

const types = [
	{
		type: "revendeur",
		icon: "ph:test-tube",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		type: "entreprie de batiment",
		icon: "ph:test-tube",
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
		await queryInterface.bulkInsert("typeclients", types, {});
	},

	async down(queryInterface, Sequelize) {
		/**
		 * Add commands to revert seed here.
		 *
		 * Example:
		 * await queryInterface.bulkDelete('People', null, {});
		 */
		await queryInterface.bulkDelete("typeclients", null, {});
	},
};
