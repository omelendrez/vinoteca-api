//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../index')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('CATEGORIAS', () => {

  it('Recrear tabla category', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(11)

        done()

      })
  })

  it('Debería devolver todas las categorías', (done) => {
    chai.request(server)
      .get('/api/v1/categories')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  })

  it('Debería crear una nueva categoría', (done) => {
    const category = {
      name: "Vinoteca",
      code: "123456",
      companyId: 1
    }
    chai.request(server)
      .post('/api/v1/categories')
      .send(category)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('name')

        done()

      })
  })

  it('Debería devolver una categoría', (done) => {
    chai.request(server)
      .get('/api/v1/categories/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('code')
        res.body.should.have.property('name')
        res.body.should.have.property('companyId')

        res.body.code.should.be.eql('123456')
        res.body.name.should.be.eql('Vinoteca')

        res.body.companyId.should.be.eql(1)

        done()

      })
  })

  it('Debería devolver todas las categorías (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/categories')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  })

  it('Debería crear modificar una categoría', (done) => {
    const category = {
      name: "Vinoteca & Fiambreria Gourment",
      code: "123456",
      companyId: 2
    }
    chai.request(server)
      .put('/api/v1/categories/1')
      .send(category)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('code')
        res.body.data.should.have.property('name')
        res.body.data.should.have.property('companyId')

        res.body.data.code.should.be.eql('123456')
        res.body.data.name.should.be.eql('Vinoteca & Fiambreria Gourment')

        res.body.data.companyId.should.be.eql(2)

        done()

      })
  })

  it('Debería eliminar una categoría', (done) => {
    chai.request(server)
      .delete('/api/v1/categories/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  })
})