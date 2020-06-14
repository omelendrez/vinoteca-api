const StockVariationReason = require('../models/stock_variation_reason')

module.exports = {
  add: (req, res) => {
    StockVariationReason.save(req.body)
      .then(stockVariationReason => res.json(stockVariationReason))
      .catch(err => res.status(500).json(err))
  },
  update: (req, res) => {
    StockVariationReason.update(req.body, req.params.id)
      .then(stockVariationReason => res.json(stockVariationReason))
      .catch(err => res.status(500).json(err))
  },
  getAll: (req, res) => {
    StockVariationReason.getAll()
      .then(stockVariationReason => res.json(stockVariationReason))
      .catch(err => res.status(500).json(err))
  },
  getById: (req, res) => {
    StockVariationReason.getById(req.params.id)
      .then(stockVariationReason => res.json(stockVariationReason))
      .catch(err => res.status(500).json(err))
  }
}