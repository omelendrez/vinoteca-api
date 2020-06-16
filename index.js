const express = require('express') // Middleware que simplifica la implemenetación de web servers
const bodyParser = require('body-parser') // Transorma la data enviada en un POST, PUT o PATCH en un objeto javascript llamado "body"
const logger = require('morgan') // Permite mostrar en gitbash qué acciones se están ejecutando cada vez que le pegamos a un endpoint
const cors = require('cors')

require('dotenv').config() // Permite leer las variables guardadas en archivo .env y las deja disponibles para toda la aplicación

const app = express()
app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false })) // extended permite recibir objetos anidados, pero no necesitamos eso.

const router = express.Router() // Este lo usamos para crear los endpoints

/**
 * Una serie de variables de http que el server setea en el header // Long story...
 */
app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*")
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, OPTIONS, PUT, DELETE" // Aquí seteamos los métodos que el cliente podrá utilizar
  )
  res.setHeader(
    "Access-Control-Allow-Headers",
    "X-Requested-With,content-type"
  )
  res.setHeader("Access-Control-Allow-Credentials", true)
  next()
})

// Se no estamos en producción activamos el logger
const environment = process.env.NODE_ENV || 'development' //
if (environment !== 'production') {
  app.use(logger('dev'))
}

/**
 * Aquí importamos las rutas que vamos a usar en la
 * aplicación.
 * Cada ruta estará asociada a un controller que permitirá
 * la creación, modificación, eliminación y listado de datos
 */
const routes = require('./routes')
app.use('/api/v1', routes(router))

/**
 * Si el usuario le pega a un endpoint (url) que no fue
 * definido dentro de los routes, le mandamos un status 404 (not found) y un mensaje de aviso
 */
app.use('/', (req, res) => {
  res.status(404).json({ message: 'Ruta inexistente' })
})

// Aquí arrancamos el server y lo dejamos "escuchando" al port especificado
const port = process.env.PORT
app.listen(`${port}`, () => {
  console.log(`Server now listening at localhost:${port}`)
})

module.exports = app