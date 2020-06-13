const jwt = require('jsonwebtoken')
const User = require('../models/users')
const bcrypt = require('bcrypt')
const generateToken = require('../utils').generateToken

module.exports = {
  add: (req, res) => {
    User.save(req.body)
      .then(user => res.json(user))
      .catch(err => res.status(500).json(err))
  },

  login: async (req, res) => {
    const { name, password } = req.body
    const user = await User.findByName(name)
    if (!user) return res.status(401).json({ message: 'Usuario o password incorrectos' })
    const ok = await bcrypt.compare(password, user.password)
    if (!ok) return res.status(401).json({ message: 'Usuario o password incorrectos' })
    const resp = generateToken(user)
    res.status(200).send(resp)
  },

  getAll: (req, res) => {
    User.getAll()
      .then(users => res.json(users))
      .catch(err => res.status(500).json(err))
  }

  /*
  mongoose.connect(connUri, { useNewUrlParser: true, useUnifiedTopology: true }, (err) => {
    let result = {}
    let status = 200
    if (!err) {
      const payload = req.decoded
      if (payload && payload.user === 'admin') {
        User.find({}, (err, users) => {
          if (!err) {
            result.status = status
            result.error = err
            result.result = users
          } else {
            status = 500
            result.status = status
            result.error = err
          }
          res.status(status).send(result)
        }).then(() => mongoose.connection.close())
      } else {
        status = 401
        result.status = status
        result.error = `Authentication error`
        res.status(status).send(result)

        mongoose.connection.close()
      }
    } else {
      status = 500
      result.status = status
      result.error = err
      res.status(status).send(result)

      mongoose.connection.close()
    }
  })
  */
}