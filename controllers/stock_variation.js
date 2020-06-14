const StockVariation = require('../models/stock_variation')

module.exports = {

  add: (req, res) => {
    StockVariation.save(req.body)
      .then(stockVariation => res.json(stockVariation))
      .catch(err => res.status(500).json(err))
  },


  update: (req, res) => {
    StockVariation.update(req.body, req.params.id)
      .then(stockVariation => res.json(stockVariation))
      .catch(err => res.status(500).json(err))
  },


  getAll: (req, res) => {
    StockVariation.getAll()
      .then(stockVariations => res.json(stockVariations))
      .catch(err => res.status(500).json(err))
  },


  getById: (req, res) => {
    StockVariation.getById(req.params.id)
      .then(stockVariation => res.json(stockVariation))
      .catch(err => res.status(500).json(err))
  }
}