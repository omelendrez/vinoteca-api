const user = require('./user')
const company = require('./company')
const supplier = require('./supplier')
const category = require('./category')
const product = require('./product')

module.exports = (router) => {
  user(router)
  company(router)
  supplier(router) // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  product(router)
  category(router)
  return router
}