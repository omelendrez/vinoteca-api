/**
 * Ruta: Agnóstica de seguridad y base datos
 * Interface entre el cliente y el controlador
 * Envia los requests del cliente al controlador
 *
 *
 * Las rutas son las que permiten al usuario interactuar con la api
 * Y utilizar desde el cliente un métod específico en cada ejecución
 * Los métodos válidos son:
 * POST:  Se usa para crear un registro nuevo, debe ir acompañado del "body"
 *        que contiene la información que se intenta guardar
 *        ej.: POST http://localhost:3000/categories
 *
 * PUT:   A diferencia de POST el PUT siempre requiere un id, porque se usa para
 *        acutalizar información de un registro específico. El registro se especifica
 *        pasando su id en la url.
 *        ej.: PUT http://localhost:3000/categories/1 Acá se pasa el id
 *
 * GET:   Este sólo sirve para obtener datos y no produce ninguna modificación
 *        de los datos existentes en la base de datos
 *        Se puede usar sin especificar id
 *        ej.: GET http://localhost:3000/categories     Lista todos los registros de la tabla
 *
 *        O especificando el id
 *        ej.: GET http://localhost:3000/categories/1   Lista los datos del registro con id = 1
 *
 * DELETE:Como su nombre lo indica permite eliminar un registro de la base de datos
 *        Como PUT siempre requiere un id en la url
 *        ej.: GET http://localhost:3000/categories/1     Elimina la empresa con id = 1
 */

const controller = require('../controllers/controller') // Este es el controlador que va a correr la acciones que se ejecuten en esta ruta (/categories)
const { validateToken } = require('../security')


module.exports = (router) => {

  router.route('/categories') // Si el usuario le pega a /categories (ej.: http://api/v1/categories)
    .post(controller.add) // Un POST agrega una nueva categoria
    //.get(validateToken, controller.getAll) // Ruta protegida con token por ahora desactivada
    .get(controller.getAll) // Un GET obtiene la lista de todas las categorias existentes en la base de datos

  router.route('/categories/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/companies')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/companies/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/inventory')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/inventory/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/orders')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/orders/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/order_details')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/order_details/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/products')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/products/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/reset-db')
    .post(controller.reset)

  router.route('/stock_variations')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/stock_variations/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/stock_variation_reasons')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/stock_variation_reasons/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/stores')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/stores/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/suppliers')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/suppliers/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/users')
    .post(controller.add)
    .get(controller.getAll)

  router.route('/users/:id')
    .put(controller.update)
    .get(controller.getById)
    .delete(controller.delete)

  router.route('/login')
    .post(controller.login)

}