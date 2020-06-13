const pool = require('./pool')
const { insertFieldsFromModel, updateFieldsFromModel, convertListToCamelCase, convertObjectToCamelCase } = require('../helpers')


module.exports = {
  save: async store => {
    const [fields, values] = await insertFieldsFromModel(store)
    return new Promise(async (resolve, reject) => {
      const sql = `INSERT INTO store (${fields}) VALUES (${values})`
      pool.executeQuery(sql, null, (err, results, fields) => {
        if (err) return reject(err)
        resolve(convertObjectToCamelCase(results))
      })
    })
  },

  update: async (store, id) => {
    const [fields] = await updateFieldsFromModel(store)
    return new Promise(async (resolve, reject) => {
      const sql = `UPDATE store SET ${fields} WHERE id=?`
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject(err)
        const sql = `SELECT * FROM store WHERE id=?`
        pool.executeQuery(sql, [id], (err, results, fields) => {
          if (err) return reject(err)
          resolve(convertListToCamelCase(results)[0])
        })
      })
    })
  },

  getAll: () => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM store;'
      pool.executeQuery(sql, null, async (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results))
      })
    })
  },

  getById: id => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM store WHERE id=?;'
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results)[0])
      })
    })
  }
}
