//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../index')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('Proveedores', () => {

  it('Recrear tabla supplier', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/supplier')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería devolver todos los proveedores', (done) => {
    chai.request(server)
      .get('/api/v1/suppliers')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  }).timeout(5000)

  it('Debería crear un nuevo proveedor', (done) => {
    const supplier = {
      "name": "matias",
      "contact": "Oscar",
      "address": "Necochea 636",
      "phone": "154737118",
      "email": "matias@gmail.com",
      "companyId": "1"
    }
    chai.request(server)
      .post('/api/v1/suppliers')
      .send(supplier)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('name')

        done()

      })
  }).timeout(5000)

  it('Debería devolver un proveedor', (done) => {
    chai.request(server)
      .get('/api/v1/suppliers/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('contact')
        res.body.should.have.property('name')
        res.body.should.have.property('companyId')

        res.body.contact.should.be.eql('Oscar')
        res.body.name.should.be.eql('matias')

        res.body.companyId.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería devolver todos los proveedores (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/suppliers')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería modificar un proveedor', (done) => {
    const supplier = {
      "name": "matias mancinelli",
      "contact": "Jorge",
      "address": "Necochea 637",
      "phone": "154737118",
      "email": "matias@gmail.com",
      "companyId": "2",
      "statusId": "1"
    }
    chai.request(server)
      .put('/api/v1/suppliers/1')
      .send(supplier)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('contact')
        res.body.data.should.have.property('address')
        res.body.data.should.have.property('companyId')

        res.body.data.contact.should.be.eql('Jorge')
        res.body.data.address.should.be.eql('Necochea 637')

        res.body.data.companyId.should.be.eql(2)

        done()

      })
  }).timeout(5000)

  it('Debería eliminar un proveedor', (done) => {
    chai.request(server)
      .delete('/api/v1/suppliers/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  }).timeout(5000)
})