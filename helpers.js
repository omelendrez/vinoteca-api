module.exports = {
  async insertFieldsFromModel(model) {
    // Crea lista de campos y valores separados por coma para ser usado con SQL INSERT INTO...
    /**
     * Por ejemplo, si el usuario posteó {email: 'omar.melendrez@gmail.com', name:'Omar', companyId: '1'}
     * esta función generará los fields así:
     * fields= "created,updated,email,name,company_id"
     * values= "NOW(),NOW(),'omar.melendrez@gmail.com','Omar','1'"
     * que es el formato que se usa para hacer un INSERT en SQL
     *
     * INSERT INTO user (created,updated,email,name,company_id) VALUES (NOW(),NOW(),'omar.melendrez@gmail.com','Omar','1')
     *
     */
    const fields = ['created', 'updated']
    const values = ['NOW()', 'NOW()']
    await Object.keys(model).forEach(field => {
      fields.push(field.toUnderscore())
      values.push(`'${model[field]}'`)
    })
    return [fields, values]
  },

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
  }
}