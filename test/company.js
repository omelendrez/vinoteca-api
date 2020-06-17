//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../testServer')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('TEST DE COMPAÑÍAS', () => {

  it('Recrear tabla company', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/company')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  })

  it('Devolver todas las compañías', (done) => {
    chai.request(server)
      .get('/api/v1/companies')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  })

  it('Crear una nueva compañía', (done) => {
    const company = {
      "name": "Vinos Copados Co",
      "contact": "Emiliano el loco",
      "address": "Juan Molina y Avellaneda",
      "phone": "2912222222",
      "email": "emiliano@gmail.com"
    }
    chai.request(server)
      .post('/api/v1/companies')
      .send(company)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('name')

        done()

      })
  })

  it('Debería devolver una compañía', (done) => {
    chai.request(server)
      .get('/api/v1/companies/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('name')
        res.body.should.have.property('contact')
        res.body.should.have.property('address')
        res.body.should.have.property('phone')
        res.body.should.have.property('email')

        res.body.name.should.be.eql('Vinos Copados Co')
        res.body.contact.should.be.eql('Emiliano el loco')
        res.body.address.should.be.eql('Juan Molina y Avellaneda')

        done()

      })
  })

  it('Debería devolver todas las compañías (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/companies')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  })

  it('Debería modificar una compañía', (done) => {
    const company = {
      "name": "Vinos Aburridos Co",
      "contact": "Carla la loco",
      "address": "Avellaneda",
      "phone": "2912222222",
      "email": "emiliano@gmail.com"
    }
    chai.request(server)
      .put('/api/v1/companies/1')
      .send(company)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('name')
        res.body.data.should.have.property('contact')
        res.body.data.should.have.property('address')
        res.body.data.should.have.property('phone')
        res.body.data.should.have.property('email')

        res.body.data.name.should.be.eql('Vinos Aburridos Co')
        res.body.data.contact.should.be.eql('Carla la loco')
        res.body.data.address.should.be.eql('Avellaneda')

        done()

      })
  })

  it('Debería eliminar una compañía', (done) => {
    chai.request(server)
      .delete('/api/v1/companies/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  })
})