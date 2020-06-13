const express = require('express')
const bodyParser = require('body-parser')
const logger = require('morgan')
require('dotenv').config()

const app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

const router = express.Router()
const environment = process.env.NODE_ENV || 'development'

app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*")
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, OPTIONS, PUT, DELETE"
  )
  res.setHeader(
    "Access-Control-Allow-Headers",
    "X-Requested-With,content-type"
  )
  res.setHeader("Access-Control-Allow-Credentials", true)
  next()
})

if (environment !== 'production') {
  app.use(logger('dev'))
}

const routes = require('./routes')
app.use('/api/v1', routes(router))

const port = process.env.PORT
app.listen(`${port}`, () => {
  console.log(`Server now listening at localhost:${port}`)
})

module.exports = app