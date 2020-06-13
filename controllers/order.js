const Order = require('../models/order')

module.exports = {
  add: (req, res) => {
    Order.save(req.body)
      .then(order => res.json(order))
      .catch(err => res.status(500).json(err))
  },

  update: (req, res) => {
    Order.update(req.body, req.params.id)
      .then(order => res.json(order))
      .catch(err => res.status(500).json(err))
  },

  getAll: (req, res) => {
    Order.getAll()
      .then(orders => res.json(orders))
      .catch(err => res.status(500).json(err))
  },

  getById: (req, res) => {
    Order.getById(req.params.id)
      .then(order => res.json(order))
      .catch(err => res.status(500).json(err))
  }
}