const pool = require('./pool')


const { insertFieldsFromModel, updateFieldsFromModel, convertListToCamelCase } = require('../helpers')

module.exports = {

  save: async supplier => {
    const [fields, values] = await insertFieldsFromModel(supplier)
    return new Promise(async (resolve, reject) => {
      const sql = `INSERT INTO supplier (${fields}) VALUES (${values})`
      pool.executeQuery(sql, null, (err, results, fields) => {
        if (err) return reject(err)
        resolve(convertListToCamelCase(results))
      })
    })
  },


  update: async (supplier, id) => {
    const [fields] = await updateFieldsFromModel(supplier)
    return new Promise(async (resolve, reject) => {
      const sql = `UPDATE supplier SET ${fields} WHERE id=?`
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject(err)
        const sql = `SELECT * FROM supplier WHERE id=?`
        pool.executeQuery(sql, [id], (err, results, fields) => {
          if (err) return reject(err)
          resolve(convertListToCamelCase(results)[0])
        })
      })
    })
  },


  getAll: () => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM supplier;'
      pool.executeQuery(sql, null, async (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results))
      })
    })
  },


  getById: id => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM supplier WHERE id=?;'
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results)[0])
      })
    })
  },
}