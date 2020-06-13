const pool = require('./pool')
const encryptPassword = require('../utils').encryptPassword
const generateFieldsFromModel = require('../utils').generateFieldsFromModel
const convertToCamel = require('../utils').convertToCamel

module.exports = {
  save: async user => {
    user.password = await encryptPassword(user)
    const [fields, values] = await generateFieldsFromModel(user)
    return new Promise(async (resolve, reject) => {
      const sql = `INSERT INTO user (${fields}) VALUES (${values})`
      pool.executeQuery(sql, null, (err, results, fields) => {
        if (err) return reject(err)
        resolve(results)
      })
    })
  },
  getAll: () => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM user;'
      pool.executeQuery(sql, null, async (err, results, fields) => {
        if (err) return reject({ error: err })
        const data = await convertToCamel(results)
        resolve(data)
      })
    })
  },
  findByName: name => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM user WHERE name=?;'
      pool.executeQuery(sql, [name], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(results[0])
      })
    })
  }
}