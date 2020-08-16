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
const { encryptPassword } = require('../security') // Sólo para user
const { updateFieldsFromModel, convertListToCamelCase, convertObjectToCamelCase, convertObjectToUnderscoreCase, formatDateFull } = require('../helpers')
//const queries = require('./queries.json')

module.exports = {
  save: async (data, model) => { // El controlador ha ejecutado esta función pasado el objeto que le envió el cliente a la respectiva ruta
    if (model === 'user') {
      data.password = await encryptPassword(data) // Sólo para user
    }
    data.created = formatDateFull(new Date())
    if (model !== 'order_tracking') {
      data.updated = formatDateFull(new Date())
    }
    const payload = convertObjectToUnderscoreCase(data)
    return new Promise(async (resolve, reject) => { // Creamos una Promise, que nos permite actuar de manera diferente si hubo errores o no
      const sql = `INSERT INTO \`${model}\` SET ?` // La lista de fields y values es generada automáticamente
      pool.executeQuery(sql, [payload], (err, results, fields) => { // Mandamo el query a la base de datos
        if (err) return reject({ error: err })
        resolve({ id: results.insertId }) // Si llegamos acá no hubo errores, formateamos la data y la devolvemos al controlador
      })
    })
  },

  // El contolador quiere cambiar datos en una empresa
  update: async (data, id, model) => { // El controlador nos pasa los datos que envió el cliente (datos de la empresa y su id)
    if (data.password) {
      data.password = await encryptPassword(data) // Sólo para user
    }
    const [fields] = await updateFieldsFromModel(data) // Otra función helper que genera SQL para ejectuar un UPDATE
    return new Promise(async (resolve, reject) => { // Creamos una nueva Promise
      const fileName = path.join(__dirname, 'queries', 'update', `${model}.sql`)
      const sql = fs.readFileSync(fileName).toString().replace('{ fields }', fields)

      pool.executeQuery(sql, [id], (err, results, fields) => { // Enviamos el SQL y el id (estamos modificando un solo registro) a mysql
        if (err) return reject({ error: err })
        resolve() // Si no hubo errores formateamos el registro y se la devolvemos al controlador
      })
    })
  },

  getAll: (model) => {
    return new Promise((resolve, reject) => {
      const fileName = path.join(__dirname, 'queries', 'all', `${model}.sql`)
      let countModel
      if (model === 'low_stock_product') {
        countModel = 'product'
      } else {
        countModel = model
      }
      /** Con este query sólo contamos los registros que traerá el siguiente query */
      const sql = `SELECT COUNT(*) as count FROM  \`${countModel}\`;`
      pool.executeQuery(sql, null, async (err, results, fields) => {
        if (err) return reject({ error: err })
        const response = { count: results[0].count }
        const sql = fs.readFileSync(fileName).toString()
        /** Aquí traemos los registros con todos los campos que especifica el archivo queries/all/[model].sql  */
        pool.executeQuery(sql, null, async (err, results, fields) => {
          if (err) return reject({ error: err })
          response.rows = convertListToCamelCase(results)
          resolve(response)
        })
      })
    })
  },

  getById: (id, model, withPassword = false) => {
    return new Promise((resolve, reject) => {
      const fileName = path.join(__dirname, 'queries', 'one', `${model}.sql`)
      const sql = fs.readFileSync(fileName).toString()
      /** Aquí traemos el registro con todos los campos que especifica el archivo queries/one/[model].sql  */
      pool.executeQuery(sql, [id], async (err, results, fields) => {
        if (err) return reject({ error: err })
        let response = results
        if (model === 'order') {
          response = { ...results[1][0] }
          response.order_details = convertListToCamelCase(results[2])
          response.order_tracking = convertListToCamelCase(results[3])
          response = [response]
        }
        resolve(convertListToCamelCase(response, withPassword)[0])
      })
    })
  },

  delete: (id, model) => {
    return new Promise((resolve, reject) => {
      const fileName = path.join(__dirname, 'queries', 'delete', `${model}.sql`)
      const sql = fs.readFileSync(fileName).toString()
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject({ error: err })
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
      const directory = path.join(__dirname, 'schema')
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
        pool.executeQuery(sql, null, (err, results) => {
          if (err) return reject({ error: err })
          resolve({ message: 'Tablas recreadas', queries })
        })
      }))
    })
  },
  changePassword: async (user, id, model) => {
    const password = await encryptPassword(user)
    const payload = { password }
    const [fields] = await updateFieldsFromModel(payload)
    return new Promise(async (resolve, reject) => {
      const sql = `UPDATE \`${model}\` SET ${fields} WHERE id=?`
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve({ message: 'Password cambiada satisfactoriamente' })
      })
    })
  },
  getLastCode: async (model, companyId, fieldName) => {
    return new Promise(async (resolve, reject) => {
      /**
       * Necesitamos obtener el último 'code' existente en este modelo (tabla)
       * para sumarle 1 (ej.: 002 -> 003)
       *
       * Para ello hacemos lo siguiente:
       *
       * 1) Nos fijamos en el esquema de este modelo qué tamaño tiene code (size).
       *    Ya que no en todas la tablas que usan 'code' el campo tiene el mismo tamaño (product, category, variation_reason)
       *
       * 2) Una vez obtenido el size buscamos en la tabla el registro con el mayor valor de code
       *
       * 3) Lo convertimos en número y le sumamos uno
       *
       * 4) Lo formateamos agregando '0' a la izquierda hasta llegar al tamaño
       *    especificado en el esquema (size)
       *
       * 5) Devolvemos el valor
       *
       */

      // Abrimos el archivo de esquema de este model
      const directory = path.join(__dirname, 'schema', `${model}.sql`)
      const file = fs.readFileSync(directory, 'UTF-8')
      const lines = file.split(/\r?\n/)

      // Buscamos en el esquema el campo fieldName y obtenemos su tamaño (size)
      let size
      lines.forEach((line) => {
        if (line.indexOf(fieldName) > -1 && line.indexOf('CHAR') > -1) {
          // code CHAR(3) NOT NULL,          0    1     2       3         4       5
          const words = line.split(' ') // [' ', ' ', 'code','CHAR(3)', 'NOT', 'NULL,']
          if (words[2] === fieldName) {
            const type = words[3] // CHAR(3)
            size = type.replace('CHAR', '').substr(1, 1) // 3
          }
        }
      })

      // Buscamos el code de mayor valor para este modelo y para la empresa del usuario
      const sql = `PREPARE stmt FROM "SELECT MAX(${fieldName}) as 'last_code' FROM \`${model}\` WHERE company_id = ?";
      SET @company_id = ${companyId};
      EXECUTE stmt USING @company_id;
      DEALLOCATE PREPARE stmt;`

      pool.executeQuery(sql, [], (err, results, fields) => {
        if (err) return reject({ error: err })
        const lastCode = convertListToCamelCase(results[2])[0].lastCode

        // Si hay registros en la tabla consideramos valor 0
        // Ahora le sumamos uno y lo formateamos con ceros a la izquierda con pad
        const newCode = (parseInt(lastCode || 0) + 1).pad(size, '0')
        resolve({ newCode }) // 003
      })
    })
  },
  receiveOrder: async (values) => {
    return new Promise(async (resolve, reject) => { // Creamos una nueva Promise
      const fileName = path.join(__dirname, 'queries', 'update', 'order_receive.sql')
      const sql = fs.readFileSync(fileName).toString()
      pool.executeQuery(sql, values, (err, results, fields) => { // Enviamos el SQL y el id (estamos modificando un solo registro) a mysql
        if (err) return reject({ error: err })
        resolve() // Si no hubo errores formateamos el registro y se la devolvemos al controlador
      })
    })
  },
  addInventoryVariation: async (values) => {
    return new Promise(async (resolve, reject) => {
      const fileName = path.join(__dirname, 'queries', 'insert', 'inventory_variation.sql')
      const sql = fs.readFileSync(fileName).toString()
      pool.executeQuery(sql, values, (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(results)
      })
    })
  }
}
