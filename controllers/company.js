/**
 * El controlador tiene la función de interactuar con el modelo
 * para realizar acciones con la base de datos de acuerdo a lo
 * que el cliente hace en cada ruta
 */

// Importamos el modelo con el que este controlador va a interactuar
const Company = require('../models/company')

module.exports = {
  // En la ruta el cliente ha hecho un POST por lo que está agregando una nueva empresa
  add: (req, res) => {
    Company.save(req.body) // Le decimos al modelo que ejecute la función "save" y le pasamos lo que el cliente posteó en la ruta
      .then(company => res.json(company)) // Aquí todo salió bien, devolvemos  al cliente lo que nos devolvió el modelo
      .catch(err => res.status(500).json(err)) // Hubo un error, se lo enviamos al cliente
  },

  // En la ruta el cliente ha hecho un PUT por lo que quiere modificar los datos de una empresa en particular
  update: (req, res) => {
    Company.update(req.body, req.params.id) // El controlador le está enviando los datos nuevos y el id de la empresa a modificar
      .then(company => res.json(company))
      .catch(err => res.status(500).json(err))
  },

  // En la ruta el cliente ha hecho un GET por lo que quiere una lista de todas las empresas
  getAll: (req, res) => {
    Company.getAll() // El controlador le dice al model que ejecute la función getAll
      .then(companies => res.json(companies))
      .catch(err => res.status(500).json(err))
  },

  // En la ruta el cliente ha hecho un GET y en la url le agregó un id, por lo que quiere los datos de una empresa en particular
  getById: (req, res) => {
    Company.getById(req.params.id) // Le decimos al modelo que ejecuta la función getById y le pasamos el id que estaba en la url
      .then(company => res.json(company))
      .catch(err => res.status(500).json(err))
  }
}