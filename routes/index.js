const user = require('./user')
const company = require('./company')
const order = require('./order')
const stock = require('./stock')
const supplier = require('./supplier')
const category = require('./category')
const orderDetails = require('./order_details')
const product = require('./product')


module.exports = (router) => {
  user(router)
  company(router) // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  order(router)
  stock(router)
  supplier(router) // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  product(router)
  category(router)
  orderDetails(router)
  return router
}