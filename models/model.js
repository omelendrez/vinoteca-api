/**
 * Modelo: Agnóstico de rutas y seguridad
 * Interface entre el controlador y la base de datos (mysql)
 * Reponsable solo de guardar y extraer datos de la base de datos
 * Recibe del controlador lo que hay que guardar y le envía el resultado si fue satisfactorio o el error que se produjo
 * Envía al controlador los datos que el controlador le pidió cuando, por ejemplo la ruta recibió un GET
 */

const fs = require('fs') // Función de node que permite acceder al sistema de achivos (file system)
const path = require('path') // Función de node que genera urls
const pool = require('./pool')
const encryptPassword = require('../security').encryptPassword // Sólo para user
const { updateFieldsFromModel, convertListToCamelCase, convertObjectToCamelCase, convertObjectToUnderscoreCase } = require('../helpers')
const queries = require('./queries.json')

module.exports = {
  save: async (data, model) => { // El controlador ha ejecutado esta función pasado el objeto que le envió el cliente a la respectiva ruta
    data.created = new Date()
    data.updated = new Date()
    const payload = convertObjectToUnderscoreCase(data)
    return new Promise(async (resolve, reject) => { // Creamos una Promise, que nos permite actuar de manera diferente si hubo errores o no
      const sql = `INSERT INTO \`${model}\` SET ?` // La lista de fields y values es generada automáticamente
      pool.executeQuery(sql, [payload], (err, results, fields) => { // Mandamo el query a la base de datos
        if (err) return reject(err) // Si hubo errores devolvemos el error y terminamos acá
        resolve({ id: results.insertId }) // Si llegamos acá no hubo errores, formateamos la data y la devolvemos al controlador
      })
    })
  },

  saveUser: async (data, model) => {
    data.password = await encryptPassword(data) // Sólo para user
    data.created = new Date()
    data.updated = new Date()
    const payload = convertObjectToUnderscoreCase(data)
    return new Promise(async (resolve, reject) => {
      const sql = `INSERT INTO \`${model}\` SET ?`
      pool.executeQuery(sql, [payload], (err, results, fields) => {
        if (err) return reject(err)
        resolve({ id: results.insertId })
      })
    })
  },

  // El contolador quiere cambiar datos en una empresa
  update: async (data, id, model) => { // El controlador nos pasa los datos que envió el cliente (datos de la empresa y su id)
    const [fields] = await updateFieldsFromModel(data) // Otra función helper que genera SQL para ejectuar un UPDATE
    return new Promise(async (resolve, reject) => { // Creamos una nueva Promise
      const sql = `UPDATE \`${model}\` SET ${fields} WHERE id=?` // Preparamos el SQL
      console.log(sql)
      pool.executeQuery(sql, [id], (err, results, fields) => { // Enviamos el SQL y el id (estamos modificando un solo registro) a mysql
        if (err) return reject(err) // Si hubo errores devolvemos el error y terminamos acá
        const sql = `SELECT * FROM  \`${model}\` WHERE id=?` // Si no hubo errores creamos un query para traer los datos de este registro
        pool.executeQuery(sql, [id], (err, results, fields) => { // Ejecutamos el query en mysql
          if (err) return reject(err) // Si hubo errores devolvemos el error y terminamos acá
          resolve(convertListToCamelCase(results)[0]) // Si no hubo errores formateamos el registro y se la devolvemos al controlador
        })
      })
    })
  },

  // El controlador quiere una lista de todas las empresas
  getAll: (model) => {
    return new Promise((resolve, reject) => { // Creamos una nueva Promise
      const sql = `SELECT COUNT(*) as count FROM  \`${model}\`;` // Preparamos el query
      pool.executeQuery(sql, null, async (err, results, fields) => { // Enviamos el query a mysql
        if (err) return reject({ error: err }) // Si hubo errores devolvemos el error y terminamos acá
        let response = {
          count: results[0].count
        }
        const sql = `SELECT * FROM  \`${model}\`;` // Preparamos el query
        pool.executeQuery(sql, null, async (err, results, fields) => { // Enviamos el query a mysql
          if (err) return reject({ error: err }) // Si hubo errores devolvemos el error y terminamos acá
          response.rows = convertListToCamelCase(results)
          resolve(response) // Si no hubo errores formateamos la lista completa y se la devolvemos al controlador
        })
      })
    })
  },

  // El controlador quiere los datos de una empresa en particular
  getById: (id, model) => { // Por eso nos pasa el id
    let sql
    if (model === 'order') {
      sql = queries[model].one
      return new Promise((resolve, reject) => { // Creamos una nueva Promise
        pool.executeQuery(sql, [id, id], (err, results, fields) => { // Se lo enviamos a mysql junto con el id
          if (err) return reject({ error: err }) // Si hubo errores devolvemos el error y terminamos acá
          const order = convertListToCamelCase(results[0])[0]
          const items = convertListToCamelCase(results[1])
          const data = { ...order, items }

          resolve(data) // Si no hubo errores formateamos el registro y se lo devolvemos al controlador
        })
      })
    } else {
      sql = `SELECT * FROM  \`${model}\` WHERE id=?;` // Preparamos el query

      return new Promise((resolve, reject) => { // Creamos una nueva Promise
        pool.executeQuery(sql, [id, id], (err, results, fields) => { // Se lo enviamos a mysql junto con el id
          if (err) return reject({ error: err }) // Si hubo errores devolvemos el error y terminamos acá
          resolve(convertListToCamelCase(results)[0])
        })
      })
    }
  },

  delete: (id, model) => { // Por eso nos pasa el id
    return new Promise((resolve, reject) => { // Creamos una nueva Promise
      const sql = `DELETE FROM  \`${model}\` WHERE id=?;` // Preparamos el query
      pool.executeQuery(sql, [id], (err, results, fields) => { // Se lo enviamos a mysql junto con el id
        if (err) return reject({ error: err }) // Si hubo errores devolvemos el error y terminamos acá
        resolve(results)
      })
    })
  },

  getByName: (name, model) => { // Sólo para user
    return new Promise((resolve, reject) => {
      const sql = `SELECT * FROM \`${model}\` WHERE name=?;`
      pool.executeQuery(sql, [name], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results, false)[0]) // Es un solo record
      })
    })
  },

  getByEmail: (email, model) => { // Sólo para user
    return new Promise((resolve, reject) => {
      const sql = `SELECT * FROM \`${model}\` WHERE email=?;`
      pool.executeQuery(sql, [email], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results, false)[0]) // Es un solo record
      })
    })
  },

  reset: (model) => {
    return new Promise((resolve, reject) => {
      /**
       * __dirname: variable de node que contiene la url donde se está ejecutando la api
       * path['c://webserver/spa/vinoteca-api', '..', 'schema']
       * path.join() = 'c://webserver/spa/vinoteca-api/schema'
       *
       * fs.readdir('c://webserver/spa/vinoteca-api/schema') = ['category.sql', 'company.sql'.....] = fileNames
       * fs.readFileSync: devuelve el contenido del archivo
       *
       * path.join(directory, fileName): 'c://webserver/spa/vinoteca-api/schema/category.sql'
       * fs.readFileSync('c://webserver/spa/vinoteca-api/schema/category.sql'):
       *  DROP TABLE IF EXISTS category;
          CREATE TABLE category (
            id INTEGER NOT NULL AUTO_INCREMENT,
            code CHAR(6) NOT NULL,
            name VARCHAR(30) NOT NULL,
            company_id INTEGER NOT NULL,
            status_id TINYINT DEFAULT 1,
            created DATETIME DEFAULT NULL,
            created_by INTEGER DEFAULT 0,
            updated DATETIME DEFAULT NULL,
            updated_by INTEGER DEFAULT 0,
            PRIMARY KEY (id),
            INDEX(company_id, code)
          );DROP TABLE IF EXISTS company;
          CREATE TABLE company (
            id INTEGER NOT NULL AUTO_INCREMENT,
            name VARCHAR(30) NOT NULL,
            contact VARCHAR(60) NOT NULL,
            address VARCHAR(30) NOT NULL,
            phone VARCHAR(15) NOT NULL,
            email VARCHAR(60) NOT NULL,
            status_id TINYINT DEFAULT 1,
            created DATETIME DEFAULT NULL,
            created_by INTEGER DEFAULT 0,
            updated DATETIME DEFAULT NULL,
            updated_by INTEGER DEFAULT 0,
            PRIMARY KEY (id)
          );
       */
      const directory = path.join(__dirname, '..', 'schema')
      fs.readdir(directory, ((err, fileNames) => {
        let sql = ''
        let queries = []
        fileNames.map(fileName => {
          if (fileName.includes('.sql')) {
            if (!model || (model + '.sql' === fileName)) {
              sql += fs.readFileSync(path.join(directory, fileName)).toString()
              queries = [...queries, fileName]
            }

          }
        })
        pool.executeQuery(sql, null, (error, results) => {
          if (error) return reject(error)
          resolve({ message: 'Tablas recreadas', queries })
        })
      }))
    })
  }
}
