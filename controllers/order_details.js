const Order_details = require('../models/order_details')
const order_details = require('../models/order_details')

module.exports = {
  add: (req, res) => {
    Order_details.save(req.body)
      .then(order_details => res.json(order_details))
      .catch(err => res.status(500).json(err))
  },
  update: (req, res) => {
    Order_details.update(req.body, req.params.id)
      .then(order_details => res.json(order_details))
      .catch(err => res.status(500).json(err))
  },
  getAll: (req, res) => {
    Order_details.getAll()
      .then(order_details => res.json(order_details))
      .catch(err => res.status(500).json(err))
  },
  getById: (req, res) => {
    Order_details.getById(req.params.id)
      .then(order_details => res.json(order_details))
      .catch(err => res.status(500).json(err))
  }
}