/**
 * El modelo es donde la api accede a la base de datos para obtener o grabar datos
 * Es la única parte de la api que actúa directamente con mysql
 */

const pool = require('./pool') // Aquí es donde está la conexión a la base de datos y podemos usarla para acceder a los datos

// Cargamos las funciones de ayuda que vamos a usar en el model
const { insertFieldsFromModel, updateFieldsFromModel, convertListToCamelCase } = require('../helpers')

module.exports = {
  // El contolador quiere agregar una nueva empresa
  save: async inventory => { // El controlador ha ejecutado esta función pasado el objeto que le envió el cliente a la respectiva ruta
    const [fields, values] = await insertFieldsFromModel(inventory) // Función helper que genera el código SQL para ejecutar un INSERT
    return new Promise(async (resolve, reject) => { // Creamos una Promise, que nos permite actuar de manera diferente si hubo errores o no
      const sql = `INSERT INTO inventory (${fields}) VALUES (${values})` // La lista de fields y values es generada automáticamente
      pool.executeQuery(sql, null, (err, results, fields) => { // Mandamo el query a la base de datos
        if (err) return reject(err) // Si hubo errores devolvemos el error y terminamos acá
        resolve(convertListToCamelCase(results)) // Si llegamos acá no hubo errores, formateamos la data y la devolvemos al controlador
      })
    })
  },

  // El contolador quiere cambiar datos en una empresa
  update: async (inventory, id) => { // El controlador nos pasa los datos que envió el cliente (datos de la empresa y su id)
    const [fields] = await updateFieldsFromModel(inventory) // Otra función helper que genera SQL para ejectuar un UPDATE
    return new Promise(async (resolve, reject) => { // Creamos una nueva Promise
      const sql = `UPDATE inventory SET ${fields} WHERE id=?` // Preparamos el SQL
      pool.executeQuery(sql, [id], (err, results, fields) => { // Enviamos el SQL y el id (estamos modificando un solo registro) a mysql
        if (err) return reject(err) // Si hubo errores devolvemos el error y terminamos acá
        const sql = `SELECT * FROM inventory WHERE id=?` // Si no hubo errores creamos un query para traer los datos de este registro
        pool.executeQuery(sql, [id], (err, results, fields) => { // Ejecutamos el query en mysql
          if (err) return reject(err) // Si hubo errores devolvemos el error y terminamos acá
          resolve(convertListToCamelCase(results)[0]) // Si no hubo errores formateamos el registro y se la devolvemos al controlador
        })
      })
    })
  },

  // El controlador quiere una lista de todas las empresas
  getAll: () => {
    return new Promise((resolve, reject) => { // Creamos una nueva Promise
      const sql = 'SELECT * FROM inventory;' // Preparamos el query
      pool.executeQuery(sql, null, async (err, results, fields) => { // Enviamos el query a mysql
        if (err) return reject({ error: err }) // Si hubo errores devolvemos el error y terminamos acá
        resolve(convertListToCamelCase(results)) // Si no hubo errores formateamos la lista completa y se la devolvemos al controlador
      })
    })
  },

  // El controlador quiere los datos de una empresa en particular
  getById: id => { // Por eso nos pasa el id
    return new Promise((resolve, reject) => { // Creamos una nueva Promise
      const sql = 'SELECT * FROM inventory WHERE id=?;' // Preparamos el query
      pool.executeQuery(sql, [id], (err, results, fields) => { // Se lo enviamos a mysql junto con el id
        if (err) return reject({ error: err }) // Si hubo errores devolvemos el error y terminamos acá
        resolve(convertListToCamelCase(results)[0]) // Si no hubo errores formateamos el registro y se lo devolvemos al controlador
      })
    })
  },
}
