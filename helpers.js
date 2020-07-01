const moment = require('moment')
require('moment/locale/es')

String.prototype.toUnderscore = function () {
  return this.replace(/([A-Z])/g, function ($1) { return "_" + $1.toLowerCase() })
}

String.prototype.toCamel = function () {
  return this.replace(/(\_[a-z])/g, function ($1) { return $1.toUpperCase().replace('_', '') })
}

const routeMaps = require('./routes/routes.json')

module.exports = {
  async updateFieldsFromModel(model) {
    // Crea lista de campos y valores separados por coma para ser usados con SQL UPDATE table...
    /**
     * Por ejemplo, si el usuario posteó {email: 'omar.melendrez@gmail.com', name:'Omar', companyId: '1'}
     * esta función generará los fields así:
     * fields= "updated=NOW(),email='omar.melendrez@gmail.com',name='Omar',company_id='1'"
     * que es el formato que se usa para hacer un UPDATE en SQL
     *
     * UPDATE user SET updated=NOW(),email='omar.melendrez@gmail.com',name='Omar' WHERE id='23'
     *
     */
    const fields = ['updated=NOW()']
    await Object.keys(model).forEach(field => {
      fields.push(`${field.toUnderscore()}='${model[field]}'`)
    })
    return [fields.join(',')]
  },

  convertObjectToCamelCase(object, excludePassword = true) {
    // Toma un registro único y convierte los nombres de campo de user_id a userId (snake_case -> camelCase)
    const row = {} // Creamos un objeto vacío
    Object.keys(object).forEach(field => { // Con Object.keys obtenemos la lista de sus campos y los recorremos con forEach
      if (field !== 'password' || !excludePassword) { // field contiene el nombre del campo. Si el campo se llama password nunca lo procesamos porque no se lo tenemos que enviar al cliente jamás
        row[field.toCamel()] = object[field] // Ahora agregamos a row el nombre del campo formatado y el valor que contiene
        // Esto hace algo como row['userId'] = '15'
      }
    })
    return row // Devolvemos el nuevo objeto con todos los campos y sus valores ({userId: '15', name: 'Omar',.....})
  },

  convertListToCamelCase(list, excludePassword = true) {
    // Toma una lista de registros y convierte los nombres de campo de user_id a userId (snake_case -> camelCase)
    if (!list.length) return list
    const results = []
    list.map(record => {
      const row = {} // Esta parte hace lo mismo que la función anterior ya que hay que aplicar la misma funcionalidad
      Object.keys(record).forEach(field => {
        if (field !== 'password' || !excludePassword) {
          row[field.toCamel()] = record[field]
        }
      })
      results.push(row)
    })
    return results
  },

  convertObjectToUnderscoreCase(object) {
    const row = {}
    Object.keys(object).forEach(field => {
      row[field.toUnderscore()] = object[field]
    })
    return row
  },

  getRouteMaps() {
    return routeMaps
  },

  getModelFromRoute(req) {
    const originalUrl = req.originalUrl.split('/')
    const routeName = originalUrl[3]
    const result = routeMaps.find(item => item.route === routeName)
    if (result) {
      return result.model
    } else {
      return ''
    }
  },
  formatDateFull(dateTime) {
    return moment(dateTime).format('YYYY-MM-DD HH:mm:SS')
  }
}