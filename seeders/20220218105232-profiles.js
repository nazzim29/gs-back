"use strict";
const { faker } = require("@faker-js/faker");
faker.locale = "fr";
const profiles = [...Array(15)].map((user) => ({
	nom: faker.name.jobType(),
	description: faker.lorem.sentence(),
	createdAt: new Date(),
	updatedAt: new Date(),
	couleur: faker.internet.color(),
	icon: "ph:test-tube",
}));
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
    await queryInterface.bulkInsert('profiles', profiles,{});
	},

	async down(queryInterface, Sequelize) {
		/**
		 * Add commands to revert seed here.
		 *
		 * Example:
		 * await queryInterface.bulkDelete('People', null, {});
		 */
    await queryInterface.bulkDelete("profiles", null, {});
	},
};
