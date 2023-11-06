'use strict';
const { faker } = require("@faker-js/faker");
faker.locale = "fr";

let i = 1
const users = [...Array(100).fill(0).map(() => i++)]
const nifs = [...Array(48)].map(() => {
  // return a fake numerical string of 15 number
  return faker.datatype.number({ min: 100000000000000, max: 999999999999999 }).toString()
})
const niss = [...Array(48)].map(() => {
  // return a fake numerical string of 15 number
  return faker.datatype.number({ min: 100000000000000, max: 999999999999999 }).toString()
})
const clients = [...Array(48)].map((user) => ({
	raisonSociale: faker.name.firstName() + " " + faker.name.lastName(),
	numero: faker.phone.phoneNumber(),
	numeroSecondaire: faker.phone.phoneNumber(),
	username: faker.internet.userName(),
  password: "$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm",
  image: '',
  nif: nifs.pop(),
  nis: niss.pop(),
  miseEnAvant: false,
	createdAt: new Date(),
	updatedAt: new Date(),
	UserId: faker.helpers.randomize(users),
	TypeClientId: 1,
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
      await queryInterface.bulkInsert('clients', clients,{})
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
    await queryInterface.bulkDelete('clients', null,{})
  }
};
