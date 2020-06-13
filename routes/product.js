const controller = require('../controllers/product')
const validateToken = require('../utils').validateToken

module.exports = (router) => {
  router.route('/products')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/products/:id')
    .put(controller.update)
    .get(controller.getById)

}