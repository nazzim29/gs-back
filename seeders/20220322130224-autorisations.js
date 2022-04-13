'use strict';

const autorisations = [
	{
		id: 1,
		nom: "add-client",
		description: "ajouter un client",
		categorie: "gestion des clients",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-client",
		description: "voir une fiche client",
		categorie: "gestion des clients",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-client",
		description: "modifier une fiche client",
		categorie: "gestion des clients",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-client",
		description: "supprimer un client",
		categorie: "gestion des clients",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-own-client",
		description: "voir une fiche client",
		categorie: "gestion des clients",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-own-client",
		description: "modifier une fiche client",
		categorie: "gestion des clients",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-own-client",
		description: "supprimer un client",
		categorie: "gestion des clients",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "add-produit",
		description: "ajouter un produit",
		categorie: "gestion des produits",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-produit",
		description: "voir un produit",
		categorie: "gestion des produits",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-produit",
		description: "modifier un produit",
		categorie: "gestion des produits",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-produit",
		description: "supprimer un produit",
		categorie: "gestion des produits",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-own-produit",
		description: "voir un produit",
		categorie: "gestion des produits",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-own-produit",
		description: "modifier un produit",
		categorie: "gestion des produits",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-own-produit",
		description: "supprimer un produit",
		categorie: "gestion des produits",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "add-utilisateur",
		description: "ajouter un utilisateur",
		categorie: "gestion des utilisateurs",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-utilisateur",
		description: "voir un utilisateur",
		categorie: "gestion des utilisateurs",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-utilisateur",
		description: "modifier un utilisateur",
		categorie: "gestion des utilisateurs",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-utilisateur",
		description: "supprimer un utilisateur",
		categorie: "gestion des utilisateurs",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-own-utilisateur",
		description: "voir un utilisateur",
		categorie: "gestion des utilisateurs",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-own-utilisateur",
		description: "modifier un utilisateur",
		categorie: "gestion des utilisateurs",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-own-utilisateur",
		description: "supprimer un utilisateur",
		categorie: "gestion des utilisateurs",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "add-vente",
		description: "ajouter une vente",
		categorie: "gestion des ventes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-vente",
		description: "voir une ventes",
		categorie: "gestion des ventes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-vente",
		description: "modifier une vente",
		categorie: "gestion des ventes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-vente",
		description: "supprimer une vente",
		categorie: "gestion des ventess",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-own-vente",
		description: "voir une vente",
		categorie: "gestion des ventes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-own-vente",
		description: "modifier une vente",
		categorie: "gestion des ventes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-own-vente",
		description: "supprimer une vente",
		categorie: "gestion des ventes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "add-formule",
		description: "ajouter une formule",
		categorie: "gestion des formules",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-formule",
		description: "voir une formule",
		categorie: "gestion des formules",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-formule",
		description: "modifier une formule",
		categorie: "gestion des formules",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-formule",
		description: "supprimer une formule",
		categorie: "gestion des formules",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-own-formule",
		description: "voir une formule",
		categorie: "gestions des formules",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-own-formule",
		description: "modifier une formule",
		categorie: "gestion des formules",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-own-formule",
		description: "supprimer une formule",
		categorie: "gestion des formules",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "add-production",
		description: "ajouter une production",
		categorie: "gestion des productions",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-production",
		description: "voir une production",
		categorie: "gestion des productions",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-production",
		description: "modifier une production",
		categorie: "gestion des productions",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-production",
		description: "supprimer une production",
		categorie: "gestion des productions",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-own-production",
		description: "voir une production",
		categorie: "gestion des productions",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-own-production",
		description: "modifier une production",
		categorie: "gestion des productions",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-own-production",
		description: "supprimer une production",
		categorie: "gestion des productions",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "add-commande",
		description: "ajouter une commande",
		categorie: "gestion des commandes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-commande",
		description: "voir une commande",
		categorie: "gestion des commandes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-commande",
		description: "modifier une commande",
		categorie: "gestion des commandes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-commande",
		description: "supprimer une commande",
		categorie: "gestion des commandes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "read-own-commande",
		description: "voir une commande",
		categorie: "gestion des commandes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "update-own-commande",
		description: "modifier une commande",
		categorie: "gestion des commandes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
	{
		nom: "delete-own-commande",
		description: "supprimer une commande",
		categorie: "gestion des commandes",
		createdAt: new Date(),
		updatedAt: new Date(),
	},
];




module.exports = {
  async up (queryInterface, Sequelize) {
    /**
     * Add seed commands here.
     *
     * Example:
     **/
     await queryInterface.bulkInsert('autorisations', autorisations, {});

  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     */
    await queryInterface.bulkDelete('autorisations', null, {});
  }
};
