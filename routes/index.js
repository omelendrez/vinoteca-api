const user = require('./user')
const company = require('./company')
const order = require('./order')
const store = require('./store')

module.exports = (router) => {
  user(router)
  company(router) // Cada vez que agregamos una nueva ruta con su respectivo modelo y controlador, debemos importarla arriba y agregarla acá
  order(router)
  store(router)
  return router
}