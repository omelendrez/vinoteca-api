const Product = require('../models/product')

module.exports = {
  add: (req, res) => {
    Product.save(req.body)
      .then(product => res.json(product))
      .catch(err => res.status(500).json(err))
  },


  update: (req, res) => {
    Product.update(req.body, req.params.id)
      .then(product => res.json(product))
      .catch(err => res.status(500).json(err))
  },


  getAll: (req, res) => {
    Product.getAll()
      .then(companies => res.json(companies))
      .catch(err => res.status(500).json(err))
  },


  getById: (req, res) => {
    Product.getById(req.params.id)
      .then(product => res.json(product))
      .catch(err => res.status(500).json(err))
  }
}