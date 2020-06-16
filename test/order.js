//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../index')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('TEST DE ÓRDENES', () => {

  it('Recrear tabla order', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/order')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  })

  it('Debería devolver todas las órdenes', (done) => {
    chai.request(server)
      .get('/api/v1/orders')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  })

  it('Debería crear una nueva order', (done) => {
    const order = {
      "number": "123231",
      "date": "2019-06-13",
      "supplierId": "1",
      "amount": "342.12",
      "companyId": "1"
    }
    chai.request(server)
      .post('/api/v1/orders')
      .send(order)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('number')

        done()

      })
  })

  it('Debería devolver una order', (done) => {
    chai.request(server)
      .get('/api/v1/orders/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('number')
        res.body.should.have.property('date')
        res.body.should.have.property('supplierId')

        res.body.number.should.be.eql('123231')
        res.body.date.should.be.eql('2019-06-13T03:00:00.000Z')
        res.body.supplierId.should.be.eql(1)

        done()

      })
  })

  it('Debería devolver todas las órdenes (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/orders')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  })

  it('Debería modificar una orden', (done) => {
    const order = {
      "number": "363645",
      "date": "2019-06-12",
      "supplierId": "3",
    }
    chai.request(server)
      .put('/api/v1/orders/1')
      .send(order)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('number')
        res.body.data.should.have.property('date')
        res.body.data.should.have.property('supplierId')

        res.body.data.number.should.be.eql('363645')
        res.body.data.date.should.be.eql('2019-06-12T03:00:00.000Z')
        res.body.data.supplierId.should.be.eql(3)

        done()

      })
  })

  it('Debería eliminar una orden', (done) => {
    chai.request(server)
      .delete('/api/v1/orders/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  })
})