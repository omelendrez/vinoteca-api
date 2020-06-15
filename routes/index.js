const routes = require('./routes')

module.exports = (router) => {
  routes(router)
  return router
}