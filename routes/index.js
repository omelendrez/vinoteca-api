const user = require('./user')
const company = require('./company')
const category = require('./category')
const product = require('./product')

module.exports = (router) => {
  user(router)
  company(router)
  product(router)
  category(router)
  return router
}