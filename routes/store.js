const controller = require('../controllers/store')
const validateToken = require('../utils').validateToken

module.exports = (router) => {
  router.route('/stores')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/stores/:id')
    .put(controller.update)
    .get(controller.getById)

}