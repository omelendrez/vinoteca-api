const express = require('express')
const bodyParser = require('body-parser')
const logger = require('morgan')
require('dotenv').config()

const app = express()
app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

app.use(function (req, res, next) {
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

const port = process.env.PORT || 3000

app.listen(port, () => {
  console.log('API listeing on port ' + port)
})

app.get('/', async (req, res) => {
  res.json({ status: 'Ok' })
})

module.exports = app
