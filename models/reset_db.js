const fs = require('fs')
const path = require('path')
const pool = require('./pool')

module.exports = {
  reset: () => {
    return new Promise((resolve, reject) => {
      fs.readdir(path.join(__dirname, '..', 'schema'), ((err, fileNames) => {
        let sql = ''
        let queries = []
        fileNames.map(fileName => {
          if (fileName.includes('.sql')) {
            sql += fs.readFileSync(path.join(__dirname, '..', 'schema/', fileName)).toString()
            queries = [...queries, fileName]
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
