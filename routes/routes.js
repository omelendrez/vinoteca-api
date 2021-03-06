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

const fs = require('fs')
const path = require('path')
const files = require('./index.json')
const controller = require('../controllers/controller')
const { validateToken } = require('../security')

const generateRoutes = (router, files) => {
  return files.map(file => {
    const fileName = path.join(__dirname, `${file.model}.json`)
    const routes = JSON.parse(fs.readFileSync(fileName, 'UTF-8'))
    routes.map(route => {
      const path = router.route(route.url)
      return route.methods.map(method => {
        if (method.secure) {
          return path[method.method](validateToken, controller[method.function])
        }
        return path[method.method](controller[method.function])
      })
    })
  })
}

module.exports = (router) => {
  generateRoutes(router, files)
}