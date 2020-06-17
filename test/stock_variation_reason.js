//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../index')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('Razones de variación de stock', () => {

  it('Recrear tabla stock_variation_reason', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/stock_variation_reason')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería devolver todas las razones devariación de stock', (done) => {
    chai.request(server)
      .get('/api/v1/stock_variation_reasons')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  }).timeout(5000)

  it('Debería crear una nueva razón de variación de stock', (done) => {
    const stock_variation_reason = {
      "code": "123",
      "name": "Nombre",
      "companyId": "1"
    }
    chai.request(server)
      .post('/api/v1/stock_variation_reasons')
      .send(stock_variation_reason)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('name')

        done()

      })
  }).timeout(5000)

  it('Debería devolver una razón de variación de stock', (done) => {
    chai.request(server)
      .get('/api/v1/stock_variation_reasons/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('code')
        res.body.should.have.property('name')
        res.body.should.have.property('companyId')

        res.body.code.should.be.eql('123')
        res.body.name.should.be.eql('Nombre')

        res.body.companyId.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería devolver todas las razones de variación de stock (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/stock_variation_reasons')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería modificar una razón de variación de stock', (done) => {
    const stock_variation_reason = {
      "code": "123",
      "name": "Nombre nuevo",
      "companyId": "2"
    }
    chai.request(server)
      .put('/api/v1/stock_variation_reasons/1')
      .send(stock_variation_reason)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('code')
        res.body.data.should.have.property('name')
        res.body.data.should.have.property('companyId')

        res.body.data.code.should.be.eql('123')
        res.body.data.name.should.be.eql('Nombre nuevo')

        res.body.data.companyId.should.be.eql(2)

        done()

      })
  }).timeout(5000)

  it('Debería eliminar una razón de variación de stock', (done) => {
    chai.request(server)
      .delete('/api/v1/stock_variation_reasons/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  }).timeout(5000)
})