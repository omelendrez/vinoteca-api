const pool = require('./pool')


const { insertFieldsFromModel, updateFieldsFromModel, convertListToCamelCase } = require('../helpers')

module.exports = {

  save: async product => {
    const [fields, values] = await insertFieldsFromModel(product)
    return new Promise(async (resolve, reject) => {
      const sql = `INSERT INTO product (${fields}) VALUES (${values})`
      pool.executeQuery(sql, null, (err, results, fields) => {
        if (err) return reject(err)
        resolve(convertListToCamelCase(results))
      })
    })
  },


  update: async (product, id) => {
    const [fields] = await updateFieldsFromModel(product)
    return new Promise(async (resolve, reject) => {
      const sql = `UPDATE product SET ${fields} WHERE id=?`
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject(err)
        const sql = `SELECT * FROM product WHERE id=?`
        pool.executeQuery(sql, [id], (err, results, fields) => {
          if (err) return reject(err)
          resolve(convertListToCamelCase(results)[0])
        })
      })
    })
  },


  getAll: () => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM product;'
      pool.executeQuery(sql, null, async (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results))
      })
    })
  },


  getById: id => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM product WHERE id=?;'
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results)[0])
      })
    })
  },
}