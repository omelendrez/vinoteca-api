/**
 * Controlador: Agnóstico de rutas o base de datos
 * Interface entre la ruta y el modelo
 * El controlador tiene la función de interactuar con el modelo
 * para realizar acciones con la base de datos de acuerdo a lo
 * que el cliente hace en las rutas
 * Puede recibir data o errores del modelo y se los envía al cliente
 */
const bcrypt = require('bcrypt')
const { generateToken } = require('../security')
const { getModelFromRoute } = require('../helpers')
const Email = require('../services/email')

// Importamos el modelo con el que este controlador va a interactuar

const Model = require('../models/model')

module.exports = {
  // En la ruta el cliente ha hecho un POST por lo que está agregando una nueva empresa
  add: (req, res) => {
    const modelName = getModelFromRoute(req)
    const { id, companyId } = req.decoded
    let payload = { ...req.body, createdBy: id }
    const requiresCompanyId = !['user', 'company'].includes(modelName)
    if (requiresCompanyId) {
      payload = { ...payload, companyId }
    }
    if (modelName !== 'user') {
      Model.save(payload, modelName) // Le decimos al modelo que ejecute la función "save" y le pasamos lo que el cliente posteó en la ruta
        .then(result => {
          Model.getById(result.id, modelName)
            .then(result => res.status(201).json({ errors: {}, data: result }))
            .catch(err => res.status(500).json(err)) // Hubo un error, se lo enviamos al cliente
        }) // Aquí todo salió bien, devolvemos  al cliente lo que nos devolvió el modelo
        .catch(err => res.status(500).json(err)) // Hubo un error, se lo enviamos al cliente
    } else {
      Model.saveUser(payload, modelName)
        .then(result => {
          Model.getById(result.id, modelName)
            .then(result => res.status(201).json({ errors: {}, data: result }))
            .catch(err => res.status(500).json(err)) // Hubo un error, se lo enviamos al cliente
        }) // Aquí todo salió bien, devolvemos  al cliente lo que nos devolvió el modelo
        .catch(err => res.status(500).json(err)) // Hubo un error, se lo enviamos al cliente
    }
  },

  // En la ruta el cliente ha hecho un PUT por lo que quiere modificar los datos de una empresa en particular
  update: (req, res) => {
    const modelName = getModelFromRoute(req)
    const { id, companyId } = req.decoded
    let payload = { ...req.body, updatedBy: id }
    const requiresCompanyId = !['user', 'company'].includes(modelName)
    if (requiresCompanyId) {
      payload = { ...payload, companyId }
    }
    Model.update(payload, req.params.id, modelName) // El controlador le está enviando los datos nuevos y el id de la empresa a modificar
      .then(result => res.status(200).json({ errors: {}, data: result }))
      .catch(err => res.status(500).json(err))
  },

  // En la ruta el cliente ha hecho un GET por lo que quiere una lista de todas las empresas
  getAll: (req, res) => {
    const modelName = getModelFromRoute(req)
    Model.getAll(modelName) // El controlador le dice al model que ejecute la función getAll
      .then(results => res.json(results))
      .catch(err => res.status(500).json(err))
  },

  // En la ruta el cliente ha hecho un GET y en la url le agregó un id, por lo que quiere los datos de una empresa en particular
  getById: (req, res) => {
    const modelName = getModelFromRoute(req)
    Model.getById(req.params.id, modelName) // Le decimos al modelo que ejecuta la función getById y le pasamos el id que estaba en la url
      .then(result => res.json(result))
      .catch(err => res.status(500).json(err))
  },

  login: async (req, res) => {
    const modelName = getModelFromRoute(req)
    const { email, password } = req.body
    const user = await Model.getByEmail(email, modelName)
    if (!user) return res.status(401).json({ message: 'Usuario o password incorrectos' })
    const ok = await bcrypt.compare(password, user.password)
    if (!ok) return res.status(401).json({ message: 'Usuario o password incorrectos' })
    const resp = generateToken(user)
    res.status(200).send(resp)
  },

  reset: (req, res) => {
    const model = req.params.table || ''
    Model.reset(model)
      .then(results => res.json(results))
      .catch(err => res.status(500).json(err))
  },

  delete: (req, res) => {
    const modelName = getModelFromRoute(req)
    Model.delete(req.params.id, modelName)
      .then(results => {
        return res.status(200).json(results)
      })
      .catch(err => res.status(500).json(err))
  },

  send: (req, res) => {
    if (!req.body.emailAddress) return res.status(200).json({ message: 'Falta la dirección de email' })
    Email.sendEmail(req.body.emailAddress)
      .then(results => {
        return res.status(200).json(results)
      })
      .catch(err => res.status(500).json(err))
  }
}