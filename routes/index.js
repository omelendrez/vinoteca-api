const user = require('./user')
const company = require('./company')
const category = require('./category')
const order_details = require('./order_details')

module.exports = (router) => {
  user(router)
  company(router) // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  category(router)
  order_details(router)
  return router
}