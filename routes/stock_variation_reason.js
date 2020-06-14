const controller = require('../controllers/stock_variation_reason')
const validateToken = require('../utils')
  .validateToken

module.exports = (router) => {
  router.route('/stock_variation_reason')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/stock_variation_reason/:id')
    .put(controller.update)
    .get(controller.getById)

}