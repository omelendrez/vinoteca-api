const OrderDetails = require('../models/order_details')

module.exports = {
  add: (req, res) => {
    OrderDetails.save(req.body)
      .then(orderDetails => res.json(orderDetails))
      .catch(err => res.status(500).json(err))
  },
  update: (req, res) => {
    Order_details.update(req.body, req.params.id)
      .then(order_details => res.json(order_details))
      .catch(err => res.status(500).json(err))
  },
  getAll: (req, res) => {
    OrderDetails.getAll()
      .then(orderDetails => res.json(orderDetails))
      .catch(err => res.status(500).json(err))
  },
  getById: (req, res) => {
    OrderDetails.getById(req.params.id)
      .then(orderDetails => res.json(orderDetails))
      .catch(err => res.status(500).json(err))
  }
}