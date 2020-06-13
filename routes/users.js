const controller = require('../controllers/users')
const validateToken = require('../utils').validateToken

module.exports = (router) => {
  router.route('/users')
    .post(controller.add)
    //.get(validateToken, controller.getAll) // Ruta protegida con token
    .get(controller.getAll)

  router.route('/users/:id')
    .put(controller.update)
    .get(controller.getById)


  router.route('/login')
    .post(controller.login)
}