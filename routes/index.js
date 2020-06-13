const user = require('./user')
const company = require('./company')
const product = require('./product')

module.exports = (router) => {
  user(router)
  company(router)
  product(router)
  // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  return router
}