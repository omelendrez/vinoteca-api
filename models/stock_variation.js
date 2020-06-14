const pool = require('./pool')

const { insertFieldsFromModel, updateFieldsFromModel, convertListToCamelCase } = require('../helpers')

module.exports = {

  save: async stockVariation => {
    const [fields, values] = await insertFieldsFromModel(stockVariation)
    return new Promise(async (resolve, reject) => {
      const sql = `INSERT INTO stock_variation (${fields}) VALUES (${values})`
      pool.executeQuery(sql, null, (err, results, fields) => {
        if (err) return reject(err)
        resolve(convertListToCamelCase(results))
      })
    })
  },

  update: async (stockVariation, id) => {
    const [fields] = await updateFieldsFromModel(stockVariation)
    return new Promise(async (resolve, reject) => {
      const sql = `UPDATE stock_variation SET ${fields} WHERE id=?`
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject(err)
        const sql = `SELECT * FROM stock_variation WHERE id=?`
        pool.executeQuery(sql, [id], (err, results, fields) => {
          if (err) return reject(err)
          resolve(convertListToCamelCase(results)[0])
        })
      })
    })
  },


  getAll: () => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM stock_variation;'
      pool.executeQuery(sql, null, async (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results))
      })
    })
  },


  getById: id => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM stock_variation WHERE id=?;'
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertListToCamelCase(results)[0])
      })
    })
  },
}
