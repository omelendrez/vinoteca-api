const pool = require('./pool')

const { insertFieldsFromModel, updateFieldsFromModel, convertListToCamelCase, convertObjectToCamelCase } = require('../helpers')


module.exports = {
  save: async stockVariationReason => {
    const [fields, values] = await insertFieldsFromModel(stockVariationReason)
    return new Promise(async (resolve, reject) => {
      const sql = `INSERT INTO stock_variation_reason (${fields}) VALUES (${values})`
      pool.executeQuery(sql, null, (err, results, fields) => {
        if (err) return reject(err)
        resolve(convertObjectToCamelCase(results))
      })
    })
  },

  update: async (stockVariationReason, id) => {
    const [fields] = await updateFieldsFromModel(stockVariationReason)
    return new Promise(async (resolve, reject) => {
      const sql = `UPDATE stock_variation_reason SET ${fields} WHERE id=?`
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject(err)
        const sql = `SELECT * FROM stock_variation_reason WHERE id=?`
        pool.executeQuery(sql, [id], (err, results, fields) => {
          if (err) return reject(err)
          resolve(convertListToCamelCase(results)[0])
        })
      })
    })
  },

  getAll: () => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM stock_variation_reason;'
      pool.executeQuery(sql, null, async (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results))
      })
    })
  },

  getById: id => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM stock_variation_reason WHERE id=?;'
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results)[0]) // Es un solo record
      })
    })
  }
}