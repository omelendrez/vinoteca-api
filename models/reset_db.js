const fs = require('fs') // Función de node que permite acceder al sistema de achivos (file system)
const path = require('path') // Función de node que genera urls
const pool = require('./pool')

module.exports = {
  reset: () => {
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
       * fs.readFileSync('c://webserver/spa/vinoteca-api/schema/category.sql') : DROP TABLE IF EXISTS category;
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
      const directory = path.join(__dirname, '..', 'schema')

      fs.readdir(directory, ((err, fileNames) => {
        let sql = ''
        let queries = []
        fileNames.map(fileName => {
          if (fileName.includes('.sql')) {
            sql += fs.readFileSync(path.join(directory, fileName)).toString()
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
