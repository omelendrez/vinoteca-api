const controller = require('../controllers/supplier')
const validateToken = require('../utils').validateToken

module.exports = (router) => {
  router.route('/suppliers')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/suppliers/:id')
    .put(controller.update)
    .get(controller.getById)

}