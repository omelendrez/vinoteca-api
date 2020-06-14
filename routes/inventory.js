// Las rutas son las que permiten al usuario interactuar con la api
/**
 * Los métodos son siempre usar una url específica (endpoint)
 * Y utilizar desde el cliente un métod específico en cada ejecución
 * Los métodos válidos son:
 * POST:  Se usa para crear un registro nuevo, debe ir acompañado del "body"
 *        que contiene la información que se intenta guardar
 *        ej.: POST http://localhost:3000/companies
 *
 * PUT:   A diferencia de POST el PUT siempre requiere un id, porque se usa para
 *        acutalizar información de un registro específico. El registro se especifica
 *        pasando su id en la url.
 *        ej.: PUT http://localhost:3000/companies/1 Acá se pasa el id
 *
 * GET:   Este sólo sirve para obtener datos y no produce ninguna modificación
 *        de los datos existentes en la base de datos
 *        Se puede usar sin especificar id
 *        ej.: GET http://localhost:3000/companies     Lista todos los registros de la tabla
 *
 *        O especificando el id
 *        ej.: GET http://localhost:3000/companies/1   Lista los datos del registro con id = 1
 *
 * DELETE:Como su nombre lo indica permite eliminar un registro de la base de datos
 *        Como PUT siempre requiere un id en la url
 *        ej.: GET http://localhost:3000/companies/1     Elimina la empresa con id = 1
 */


const controller = require('../controllers/inventory') // Este es el controlador que va a correr la acciones que se ejecuten en esta ruta (/companies)
const validateToken = require('../utils').validateToken

module.exports = (router) => {
  router.route('/inventory') // Si el usuario le pega a /companies (ej.: http://api/v1/companies)
    .post(controller.add) // Un POST agrega una nueva empresa
    //.get(validateToken, controller.getAll) // Ruta protegida con token por ahora desactivada
    .get(controller.getAll) // Un GET obtiene la lista de todas las empresas existentes en la base de datos

  router.route('/inventory/:id') // Notar el :id || Sólo se va a actuar en una empresa en particular
    .put(controller.update) // Un PUT modifica los datos de una exmpresa
    .get(controller.getById) // Un GET obtiene los datos de una empresa

}