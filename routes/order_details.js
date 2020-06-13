const controller = require('../controllers/order_details')
const validateToken = require('../utils')
  .validateToken

module.exports = (router) => {
  router.route('/order_details')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/order_details/:id')
    .put(controller.update)
    .get(controller.getById)

}