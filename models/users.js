const pool = require('./pool')
const encryptPassword = require('../utils').encryptPassword // Sólo para user
const insertFieldsFromModel = require('../utils').insertFieldsFromModel
const updateFieldsFromModel = require('../utils').updateFieldsFromModel
const convertToCamel = require('../utils').convertToCamel

module.exports = {
  save: async user => {
    user.password = await encryptPassword(user) // Sólo para user
    const [fields, values] = await insertFieldsFromModel(user)
    return new Promise(async (resolve, reject) => {
      const sql = `INSERT INTO user (${fields}) VALUES (${values})`
      pool.executeQuery(sql, null, (err, results, fields) => {
        if (err) return reject(err)
        resolve(convertToCamel(results))
      })
    })
  },

  update: async (user, id) => {
    const [fields] = await updateFieldsFromModel(user)
    return new Promise(async (resolve, reject) => {
      const sql = `UPDATE user SET ${fields} WHERE id=?`
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject(err)
        const sql = `SELECT * FROM user WHERE id=?`
        pool.executeQuery(sql, [id], (err, results, fields) => {
          if (err) return reject(err)
          resolve(convertToCamel(results)[0])
        })
      })
    })
  },

  getAll: () => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM user;'
      pool.executeQuery(sql, null, async (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertToCamel(results))
      })
    })
  },

  getById: id => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM user WHERE id=?;'
      pool.executeQuery(sql, [id], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertToCamel(results)[0]) // Es un solo record
      })
    })
  },

  getByName: name => { // Sólo para user
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM user WHERE name=?;'
      pool.executeQuery(sql, [name], (err, results, fields) => {
        if (err) return reject({ error: err })
        resolve(convertToCamel(results, false)[0]) // Es un solo record
      })
    })
  }
}
