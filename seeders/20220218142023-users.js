"use strict";
const { faker } = require("@faker-js/faker");
faker.locale = "fr";

const users = [...Array(100)].map((user) => ({
	nom: faker.name.firstName(),
	prenom: faker.name.lastName(),
	username: faker.internet.userName(),
	password: "$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm",
	numero: faker.phone.phoneNumber(),
	ProfileId: 1,
}));

module.exports = {
	async up(queryInterface, Sequelize) {
		/**
		 * Add seed commands here.
		 *
		 * Example:
		 * await queryInterface.bulkInsert('users', [{
		 *   name: 'John Doe',
		 *   isBetaMember: false
		 * }], {});
		 */

		await queryInterface.bulkInsert(
			"users",
			[
				{
					nom: "admin",
					prenom: "admin",
					username: "admin",
					password:
						"$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm",
					numero: "0698151348",
					ProfileId: 1,
				},
				...users,
			],
			{}
		);
	},

	async down(queryInterface, Sequelize) {
		/**
		 * Add commands to revert seed here.
		 *
		 * Example:
		 * await queryInterface.bulkDelete('users', null, {});
		 */
		await queryInterface.bulkDelete("users", null, {});
	},
};
