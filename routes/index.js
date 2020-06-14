const category = require('./category')
const company = require('./company')
const inventory = require('./inventory')
const order = require('./order')
const orderDetails = require('./order_details')
const product = require('./product')
const resetDb = require('./reset_db')
const store = require('./store')
const supplier = require('./supplier')
const user = require('./user')
const stockVariationReason = require('./stock_variation_reason')
const stock_variation = require('./stock_variation')

module.exports = (router) => {
  category(router)
  company(router) // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  inventory(router)
  order(router)
  orderDetails(router)
  product(router)
  resetDb(router)
  store(router)
  supplier(router) // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  user(router)
  stockVariationReason(router)
  stock_variation(router)
  return router
}