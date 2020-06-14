const controller = require('../controllers/stock_variation')
const validateToken = require('../utils').validateToken

module.exports = (router) => {
  router.route('/stock_variations')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/stock_variations/:id')
    .put(controller.update)
    .get(controller.getById)

}