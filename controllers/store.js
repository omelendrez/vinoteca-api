const Store = require('../models/store')

module.exports = {
  add: (req, res) => {
    Store.save(req.body)
      .then(store => res.json(store))
      .catch(err => res.status(500).json(err))
  },

  update: (req, res) => {
    Store.update(req.body, req.params.id)
      .then(store => res.json(store))
      .catch(err => res.status(500).json(err))
  },

  getAll: (req, res) => {
    Store.getAll()
      .then(stores => res.json(stores))
      .catch(err => res.status(500).json(err))
  },

  getById: (req, res) => {
    Store.getById(req.params.id)
      .then(store => res.json(store))
      .catch(err => res.status(500).json(err))
  }
}