//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../testServer')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('Depósitos', () => {

  it('Recrear tabla store', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/store')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería devolver todos los depósitos', (done) => {
    chai.request(server)
      .get('/api/v1/stores')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  }).timeout(5000)

  it('Debería crear un nuevo depósito', (done) => {
    const store = {
      "name": "Almacen Pepito",
      "contact": "El perro de Pepito 11221",
      "address": "Juan Molina y Avellaneda",
      "phone": "2912222222",
      "email": "ap@gmail.com",
      "companyId": "1"
    }
    chai.request(server)
      .post('/api/v1/stores')
      .send(store)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('name')

        done()

      })
  }).timeout(5000)

  it('Debería devolver un depósito', (done) => {
    chai.request(server)
      .get('/api/v1/stores/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('contact')
        res.body.should.have.property('name')
        res.body.should.have.property('companyId')

        res.body.contact.should.be.eql('El perro de Pepito 11221')
        res.body.name.should.be.eql('Almacen Pepito')

        res.body.companyId.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería devolver todos los depósitos (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/stores')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería modificar un depósito', (done) => {
    const store = {
      "name": "El garage de la esquina",
      "contact": "El gato de Pepito 11221",
      "address": "Juan Molina 12",
      "phone": "2912211222",
      "email": "aaa@gmail.com",
      "companyId": "2"
    }
    chai.request(server)
      .put('/api/v1/stores/1')
      .send(store)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('phone')
        res.body.data.should.have.property('name')
        res.body.data.should.have.property('companyId')

        res.body.data.phone.should.be.eql('2912211222')
        res.body.data.name.should.be.eql('El garage de la esquina')

        res.body.data.companyId.should.be.eql(2)

        done()

      })
  }).timeout(5000)

  it('Debería eliminar un depósito', (done) => {
    chai.request(server)
      .delete('/api/v1/stores/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  }).timeout(5000)
})