const Supplier = require('../models/supplier')

module.exports = {

  add: (req, res) => {
    Supplier.save(req.body)
      .then(supplier => res.json(supplier))
      .catch(err => res.status(500).json(err))
  },


  update: (req, res) => {
    Supplier.update(req.body, req.params.id)
      .then(supplier => res.json(supplier))
      .catch(err => res.status(500).json(err))
  },


  getAll: (req, res) => {
    Supplier.getAll()
      .then(suppliers => res.json(suppliers))
      .catch(err => res.status(500).json(err))
  },


  getById: (req, res) => {
    Supplier.getById(req.params.id)
      .then(supplier => res.json(supplier))
      .catch(err => res.status(500).json(err))
  }
}