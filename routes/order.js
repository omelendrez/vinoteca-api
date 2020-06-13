const controller = require('../controllers/order')
const validateToken = require('../utils').validateToken

module.exports = (router) => {
  router.route('/orders')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/orders/:id')
    .put(controller.update)
    .get(controller.getById)
}
