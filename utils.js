const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')

String.prototype.toUnderscore = function () {
  return this.replace(/([A-Z])/g, function ($1) { return "_" + $1.toLowerCase() })
}

String.prototype.toCamel = function () {
  return this.replace(/(\_[a-z])/g, function ($1) { return $1.toUpperCase().replace('_', '') })
}

module.exports = {
  validateToken: (req, res, next) => {
    const authorizationHeader = req.headers.authorization
    let result
    if (authorizationHeader) {
      const token = req.headers.authorization.split(' ')[1] // Bearer <token>
      const options = {
        expiresIn: '2d',
        issuer: process.env.ISSUER
      }
      try {
        result = jwt.verify(token, process.env.JWT_SECRET, options)
        req.decoded = result
        next()
      } catch (err) {
        throw new Error(err)
      }
    } else {
      result = {
        error: `Authentication error. Token required.`,
        status: 401
      }
      res.status(401).send(result)
    }
  },
  generateToken(user) {
    const payload = { id: user.id, name: user.name, profileId: user.profile_id }
    const options = { expiresIn: '2d', issuer: process.env.ISSUER }
    const secret = process.env.JWT_SECRET
    const token = jwt.sign(payload, secret, options)
    delete user.password
    return {
      token,
      user
    }
  },
  async encryptPassword(user) {
    const hash = await bcrypt.hash(user.password, 10)
    return hash
  },
  async generateFieldsFromModel(model) {
    const fields = []
    const values = []
    await Object.keys(model).forEach(field => {
      fields.push(field.toUnderscore())
      values.push(`'${model[field]}'`)
    })
    return [fields, values]
  },
  convertToCamel(data) {
    const results = []
    data.map(record => {
      const row = {}
      Object.keys(record).forEach(field => {
        if (field !== 'password') {
          row[field.toCamel()] = record[field]
        }
      })
      results.push(row)
    })
    return results
  }
}