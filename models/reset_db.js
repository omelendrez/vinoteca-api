const fs = require('fs')
const path = require('path')
const pool = require('./pool')

module.exports = {
  reset: () => {
    return new Promise((resolve, reject) => {
      const sql = fs.readFileSync(path.join(__dirname, '..', 'schema/CREATE_DATABASE.sql')).toString()
      pool.executeQuery(sql, null, (error, results) => {
        if (error) return reject(error)
        resolve(results)
      })
    })
  }
}
