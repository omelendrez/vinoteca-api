//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../index')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('TEST DE INVENTARIO', () => {

  it('Recrear tabla inventory', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/inventory')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  })

  it('Debería devolver todos los registros en inventario', (done) => {
    chai.request(server)
      .get('/api/v1/inventory')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  })

  it('Debería crear un nuevo inventario', (done) => {
    const inventory = {
      "companyId": 1,
      "storeId": 1,
      "productId": 1,
      "quantity": 10
    }
    chai.request(server)
      .post('/api/v1/inventory')
      .send(inventory)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('quantity')

        done()

      })
  })

  it('Debería devolver un nuevo inventario', (done) => {
    chai.request(server)
      .get('/api/v1/inventory/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('companyId')
        res.body.should.have.property('storeId')
        res.body.should.have.property('quantity')

        res.body.companyId.should.be.eql(1)
        res.body.storeId.should.be.eql(1)
        res.body.quantity.should.be.eql(10)

        done()

      })
  })

  it('Debería devolver todos los inventarios (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/inventory')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  })

  it('Debería modificar un inventario', (done) => {
    const inventory = {
      "companyId": 2,
      "storeId": 3,
      "productId": 1,
      "quantity": 20
    }
    chai.request(server)
      .put('/api/v1/inventory/1')
      .send(inventory)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('companyId')
        res.body.data.should.have.property('storeId')
        res.body.data.should.have.property('quantity')

        res.body.data.companyId.should.be.eql(2)
        res.body.data.storeId.should.be.eql(3)
        res.body.data.quantity.should.be.eql(20)

        done()

      })
  })

  it('Debería eliminar un inventario', (done) => {
    chai.request(server)
      .delete('/api/v1/inventory/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  })
})