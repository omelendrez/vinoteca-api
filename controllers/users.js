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

    const user = await User.getByName(name)
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
  },

  getById: (req, res) => {
    User.getById(req.params.id)
      .then(user => res.json(user))
      .catch(err => res.status(500).json(err))
  }
}