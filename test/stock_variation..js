//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../index')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('VARIACION DE STOCK', () => {

  it('Recrear tabla stock_variation', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/stock_variation')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  })

  it('Debería devolver todas los stock_variation', (done) => {
    chai.request(server)
      .get('/api/v1/stock_variations')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  })

  it('Debería crear una nuevo stock_Variation', (done) => {
    const stock_Variation = {
      "companyId": "1",
      "storeId": "1",
      "productId": "1",
      "quantity": "4",
      "variationType": "0",
      "variationReason": "1",
      "comments": "asdas"
    }
    chai.request(server)
      .post('/api/v1/stock_variations')
      .send(stock_Variation)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('storeId')

        done()

      })
  })

  it('Debería devolver un stock_variation', (done) => {
    chai.request(server)
      .get('/api/v1/stock_variations/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('quantity')
        res.body.should.have.property('storeId')
        res.body.should.have.property('productId')

        res.body.variationType.should.be.eql(0)
        res.body.comments.should.be.eql('asdas')

        res.body.companyId.should.be.eql(1)

        done()

      })
  })

  it('Debería devolver todas las variaciones de stock', (done) => {
    chai.request(server)
      .get('/api/v1/stock_variations')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  })

  it('Debería modificar una categoría', (done) => {
    const stock_Variation = {
      "companyId": "1",
      "storeId": "1",
      "productId": "1",
      "quantity": "4",
      "variationType": "0",
      "variationReason": "1",
      "comments": "asdas"
    }
    chai.request(server)
      .put('/api/v1/stock_variations/1')
      .send(stock_Variation)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('companyId')
        res.body.data.should.have.property('storeId')
        res.body.data.should.have.property('quantity')

        res.body.data.variationType.should.be.eql(0)
        res.body.data.comments.should.be.eql('asdas')

        res.body.data.companyId.should.be.eql(1)

        done()

      })
  })

  it('Debería eliminar una variacion de stock', (done) => {
    chai.request(server)
      .delete('/api/v1/stock_variations/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  })
})