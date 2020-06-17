//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../testServer')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('DETALLE DE ORDEN', () => {

  it('Recrear tabla order_details', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/order_details')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  })

  it('Debería devolver todas los detalles de orden', (done) => {
    chai.request(server)
      .get('/api/v1/order_details')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  })

  it('Debería crear un nuevo detalle de orden', (done) => {
    const order_details = {
      "orderId": "1",
      "storeId": "2",
      "productId": "3",
      "qtyRequested": 8,
      "qtyReceived": 3
    }
    chai.request(server)
      .post('/api/v1/order_details')
      .send(order_details)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('orderId')

        done()

      })
  })

  it('Debería devolver un detalle de orden', (done) => {
    chai.request(server)
      .get('/api/v1/order_details/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('orderId')
        res.body.should.have.property('storeId')
        res.body.should.have.property('productId')

        res.body.qtyRequested.should.be.eql(8)
        res.body.qtyReceived.should.be.eql(3)

        res.body.productId.should.be.eql(3)

        done()

      })
  })

  it('Debería devolver todas los detalles de orden (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/order_details')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  })

  it('Debería modificar una orden de detalle', (done) => {
    const order_details = {
      orderId: "1",
      storeId: "2",
      productId: "3",
      qtyRequested: 8,
      qtyReceived: 3
    }
    chai.request(server)
      .put('/api/v1/order_details/1')
      .send(order_details)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('orderId')
        res.body.data.should.have.property('storeId')
        res.body.data.should.have.property('productId')

        res.body.data.qtyRequested.should.be.eql(8)
        res.body.data.qtyReceived.should.be.eql(3)

        res.body.data.productId.should.be.eql(3)

        done()

      })
  })

  it('Debería eliminar un detalle de orden', (done) => {
    chai.request(server)
      .delete('/api/v1/order_details/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  })
})