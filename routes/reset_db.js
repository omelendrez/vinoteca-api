const controller = require('../controllers/reset_db')
const validateToken = require('../utils').validateToken

module.exports = (router) => {
  router.route('/reset-db')
    .post(controller.add)
}