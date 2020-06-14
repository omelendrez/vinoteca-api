const category = require('./category')
const company = require('./company')
const inventory = require('./inventory')
const order = require('./order')
const orderDetails = require('./order_details')
const product = require('./product')
const store = require('./store')
const supplier = require('./supplier')
const user = require('./user')

module.exports = (router) => {
  category(router)
  company(router) // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  inventory(router)
  order(router)
  orderDetails(router)
  product(router)
  store(router)
  supplier(router) // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  user(router)
  return router
}