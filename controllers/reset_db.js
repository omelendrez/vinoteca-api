const Model = require('../models/reset_db')

module.exports = {
  add: (req, res) => {
    Model.reset()
      .then(results => res.json(results))
      .catch(err => res.status(500).json(err))
  }
}