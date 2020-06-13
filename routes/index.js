const user = require('./user')
const company = require('./company')
const stock = require('./stock')

module.exports = (router) => {
  user(router)
  company(router) // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  stock(router)
  return router
}