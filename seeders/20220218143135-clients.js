'use strict';
const { faker } = require("@faker-js/faker");
faker.locale = "fr";

let i = 1
const users = [...Array(100).fill(0).map(() => i++)]
console.log(users)
const clients = [...Array(100)].map((user) => ({
  raisonSociale: faker.company.companyName(),
  numero: faker.phone.phoneNumber(),
  numeroSecondaire: faker.phone.phoneNumber(),
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
