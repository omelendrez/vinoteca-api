process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../index')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('PRODUCTOS', () => {

  it('Recrear tabla product', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/product')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  })

  it('Debería devolver todas los productos', (done) => {
    chai.request(server)
      .get('/api/v1/products')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  })

  it('Debería crear un nuevo producto', (done) => {
    const product = {
      "code": "P-0001",
      "barcode": "333",
      "name": "Matias",
      "description": "asdas",
      "quantity": "4",
      "minimum": "2",
      "categoryId": "1",
      "companyId": "1",
      "lastPurchaseDate": "2017-06-15",
      "lastPurchasePrice": "126",
      "lastSaleDate": "2019-05-01",
      "lastSalePrice": "216",
      "price": "134",
      "statusId": "1"
    }
    chai.request(server)
      .post('/api/v1/products')
      .send(product)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('name')

        done()

      })
  })

  it('Debería devolver un producto', (done) => {
    chai.request(server)
      .get('/api/v1/products/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('code')
        res.body.should.have.property('barcode')
        res.body.should.have.property('name')
        res.body.should.have.property('description')
        res.body.should.have.property('quantity')
        res.body.should.have.property('minimum')
        res.body.should.have.property('categoryId')
        res.body.should.have.property('companyId')
        res.body.should.have.property('lastPurchaseDate')
        res.body.should.have.property('lastPurchasePrice')
        res.body.should.have.property('lastSaleDate')
        res.body.should.have.property('lastSalePrice')
        res.body.should.have.property('price')
        res.body.should.have.property('statusId')

        res.body.code.should.be.eql('P-0001')
        res.body.name.should.be.eql('Matias')

        res.body.companyId.should.be.eql(1)

        done()

      })
  })

  it('Debería devolver todos los productos (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/products')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  })

  it('Debería modificar un producto', (done) => {
    const product = {
      code: "P-0001",
      barcode: "333",
      name: "Matias",
      description: "asdas",
      quantity: "4",
      minimum: "2",
      categoryId: "1",
      companyId: "1",
      lastPurchaseDate: "2017-06-15",
      lastPurchasePrice: "126",
      lastSaleDate: "2019-05-01",
      lastSalePrice: "216",
      price: "134",
      statusId: "1"
    }
    chai.request(server)
      .put('/api/v1/products/1')
      .send(product)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('code')
        res.body.data.should.have.property('name')
        res.body.data.should.have.property('companyId')

        res.body.data.code.should.be.eql('P-0001')
        res.body.data.name.should.be.eql('Matias')

        res.body.data.companyId.should.be.eql(1)

        done()

      })
  })

  it('Debería eliminar un producto', (done) => {
    chai.request(server)
      .delete('/api/v1/products/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  })
})