const {
  Commande,
  Produit,
  Client,
  Couleur,
  Vente,
  produits_commande,
  User,
  Payement,
  sequelize,
  TypeProduit,
  Sequelize,
} = require("../models");
const path = require("path");
const fs = require("fs");
const pdf = require("html-pdf");
const moment = require("moment");
const moustache = require("mustache");
const { Stream } = require("stream");
exports.index = async (req, res) => {
  if (req.user instanceof Client) {
    const commandes = await Commande.findAll({
      where: {
        ...req.where,
        ClientId: req.user.id,
      },
      include: [
        {
          model: Produit,
          paranoid: false,
        },
      ],
    });

    return res.json(commandes);
  }
  const commandes = await Commande.findAll({
    where: {
      ...req.where,
    },
  });
  console.log(commandes);
  return res.json(commandes);
};
exports.show = async (req, res) => {
  console.log(Payement);
  const commande = await Commande.findByPk(req.params.id, {
    include: [
      {
        model: Produit,
        include: [TypeProduit, Couleur],
        paranoid: false,
      },
      {
        model: Client,
      },
    ],
  });
  if (!commande) return res.status(404).send({ error: "Commande not found" });
  return res.json(commande);
};
exports.create = async (req, res) => {
  const commande = await Commande.create({
    ...req.body,
    ClientId: req.body.Client.id,
    UserId: req.user.id,
    etat: "en negiciation",
  });
  req.params.id = commande.id;
  return await this.show(req, res);
};
exports.update = async (req, res) => {
  // await Commande.update(
  // 	{ ...req.body },
  // 	{
  // 		where: { id: req.params.id },
  // 	}
  // );
  const transaction = await sequelize.transaction();
  try {
    const commande = await Commande.findByPk(req.params.id);
    console.log(commande.Client.id, req.user.id);
    if (!commande) return res.status(404).json({ error: "Commande not found" });
    if (req.user.id != commande.Client.id && req.user instanceof Client)
      return res
        .status(403)
        .json({ error: "You are not allowed to update this commande" });
    for (let i in req.body.Produits) {
      console.log(req.body.Produits[i].id);
      if (req.body.Produits[i].produits_commande.quantite == 0) {
        await produits_commande.destroy(
          {
            where: {
              CommandeId: req.body.Produits[i].produits_commande.CommandeId,
              ProduitId: req.body.Produits[i].produits_commande.ProduitId,
            },
          },
          { transaction }
        );
        continue;
      }
      const pc = await produits_commande.findOne(
        {
          where: {
            CommandeId: commande.id,
            ProduitId: req.body.Produits[i].id,
          },
        },
        { transaction }
      );
      if (pc) {
        console.log("update: ", req.body.Produits[i].produits_commande);
        await produits_commande.update(
          req.body.Produits[i].produits_commande,
          {
            where: {
              CommandeId: commande.id,
              ProduitId: req.body.Produits[i].id,
            },
          },
          { transaction }
        );
        continue;
      }
      await produits_commande.create(req.body.Produits[i].produits_commande, {
        transaction,
      });
    }
    commande.Produits = await commande.getProduits({ transaction });
    if (req.user instanceof Client) {
      commande.validationClient = true;
      commande.validationAdmin = false;
    } else {
      commande.validationClient = false;
      commande.validationAdmin = true;
    }
    await commande.save({ transaction });
    await transaction.commit();
    return res.json(commande);
  } catch (error) {
    console.log(error);
    await transaction.rollback();
    return res.status(500).json({ error: "An error occured" });
  }
};
exports.delete = async (req, res) => {
  const commande = await Commande.findByPk(req.params.id);
  if (!commande) return res.status(404).json({ error: "Commande not found" });
  if (req.user instanceof Client && req.user.id != commande.UserId)
    return res
      .status(403)
      .json({ error: "You are not allowed to delete this commande" });
  await commande.destroy();
  return res.json({ success: true });
};

exports.addproduct = async (req, res) => {
  //add products to commande

  const v = [];
  try {
    //new transaction
    const transaction = await sequelize.transaction();
    const commande = await Commande.findByPk(req.params.id, {
      transaction: transaction,
    });
    const { produits_commande } = req.body;
    console.log(produits_commande);
    await commande.addProduit(req.body.produit.id, {
      through: produits_commande,
      transaction: transaction,
    });
    if (req.user instanceof Client) {
      await commande.update(
        {
          etat: "en negiciation",
          validationClient: true,
          validationAdmin: false,
        },
        { transaction: transaction }
      );
    } else {
      await commande.update(
        {
          etat: "en negiciation",
          validationClient: false,
          validationAdmin: true,
        },
        { transaction: transaction }
      );
    }
    await transaction.commit();
    return res.json(v);
  } catch (err) {
    console.log(err);
    await transaction.rollback();
  }
};
exports.updateProduct = async (req, res) => {
  const { id, idProduct } = req.params;
  const p = await produits_commande.update(req.body.produits_commande, {
    where: {
      CommandeId: id,
      ProduitId: idProduct,
    },
  });
  return res.json(p);
};
exports.deleteProduct = async (req, res) => {
  try {
    const commande = await Commande.findByPk(req.params.id);
    await commande.removeProduit(req.params.idProduct);
    return res.status(200).json({ success: true });
  } catch (err) {
    console.log(err);
  }
};
exports.validate = async (req, res) => {
  const { id } = req.params;
  // Sequelize.Transaction
  const transaction = await sequelize.transaction();
  try {
    const commande = await Commande.findByPk(id);
    if (!commande)
      return res
        .status(404)
        .json({ success: false, message: "commande not found" });
    if (req.user instanceof Client) {
      await commande.update(
        {
          validationClient: true,
        },
        { transaction: transaction }
      );
    } else {
      await commande.update(
        {
          validationAdmin: true,
        },
        { transaction: transaction }
      );
    }

    await transaction.commit();
    return res.status(200).json({ success: true });
  } catch (err) {
    console.log(err);
    await transaction.rollback();
  }
};
exports.saveBDC = async (req, res) => {
  if (req.file) {
    try {
      const transaction = await sequelize.transaction();
      let newpath = req.file.path + path.extname(req.file.originalname);
      fs.rename(req.file.path, newpath, async (err) => {
        if (err) return res.status(500).json({ error: "An error occured" });
        await Commande.update(
          {
            bonDeCommande: newpath,
            etat: "vendu",
          },
          { where: { id: req.params.id }, transaction }
        );
        const commande = await Commande.findByPk(req.params.id, {
          transaction,
        });
        if (commande.validationClient && commande.validationAdmin) {
          const vente = await Vente.create(
            {
              UserId: commande.UserId,
              ClientId: commande.Client.id,
            },
            { transaction }
          );
          const produits = await commande.getProduits({ transaction });
          for (produit in produits) {
            await vente.addProduit(produits[produit].id, {
              through: {
                quantite: produits[produit].produits_commande.quantite,
                prix: produits[produit].produits_commande.prix,
              },
              transaction,
            });
          }
          await commande.destroy({ transaction });
          res.send({ id: vente.id });
        } else {
          res.status(400).send({ error: "Commande non validée" });
        }
      });
    } catch (err) {
      console.log(err);
      return res.status(500).send();
    }
  } else {
    return res.status(400).send({ error: "No file uploaded" });
  }
};

exports.downloadDocs = async (req, res) => {
  try {
    const commande = await Commande.findByPk(req.params.id);
    // if (!commande) return res.status(404).json({ error: "Commande not found" });
    // if (req.user instanceof Client && req.user.id != commande.ClientId)
    // 	return res
    // 		.status(403)
    // 		.json({ error: "You are not allowed to download this commande" });
    // const file = fs.readFileSync();
    // res.setHeader("Content-Type", "application/pdf");
    // res.setHeader(
    // 	"Content-Disposition",
    // 	`attachment; filename="bon de commande ${commande.id}.pdf"`
    // );

    // const stream = fs.createReadStream(commande.bonDeCommande);
    // console.log(stream)
    // stream.pipe(res);
    res.download(commande.bonDeCommande, `bon de commande ${commande.id}.pdf`);
    return;

    const facturetemplate = fs.readFileSync(
      "private/template/facture/index.html",
      "utf8"
    );
    const facture = moustache.render(facturetemplate, {
      client: commande.Client,
      commande: commande,
      produits: await commande.getProduits(),
      moment: moment,
      formatDate: function () {
        if (!/Date\]$/.test(Object.prototype.toString.call(this))) {
          return "Invalid Date:" + this;
        }
        return (
          this.getDate() +
          "/" +
          (this.getMonth() + 1) +
          "/" +
          this.getFullYear()
        );
      },
      subtotal: function () {
        return this.prix * this.quantite;
      },
    });
    pdf
      .create(facture, {
        directory: "tmp",
        base: "private/template/facture/",
        type: "pdf",
      })
      .toFile(function (err, file) {
        res.download(file.filename);
      });
  } catch (error) {
    console.log(error);
    return res.send(error);
  }
};

exports.getfacture = async (req, res) => {
  try {
    const commande = await Commande.findByPk(req.params.id);
    //read file content as string
    const file = fs.readFileSync("private/template/facture/index.html", "utf8");

    //render file content as with mustach
    console.log(commande);
    const html = moustache.render(file, {
      client: commande.Client,
      commande: commande,
      produits: await commande.getProduits(),
      moment: moment,
      formatDate: function () {
        if (!/Date\]$/.test(Object.prototype.toString.call(this))) {
          return "Invalid Date:" + this;
        }
        return (
          this.getDate() +
          "/" +
          (this.getMonth() + 1) +
          "/" +
          this.getFullYear()
        );
      },
      subtotal: function () {
        return this.prix * this.quantite;
      },
    });
    pdf
      .create(html, {
        directory: "tmp",
        base: "private/template/facture/",
        type: "pdf",
      })
      .toStream(function (err, stream) {
        stream.pipe(res);
      });
  } catch (error) {
    console.log(error);
    res.send(error);
  }
};


exports.count = async (req,res) => {
	const total = await Commande.count();
	const attente = await Commande.count({where:{etat:'en negiciation'}})
	return res.status(200).json( {total,attente} );
}