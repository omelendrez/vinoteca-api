//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../testServer')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('PERFILES DE USUARIO', () => {

  it('Recrear tabla profile', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/profile')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería devolver todas los perfiles', (done) => {
    chai.request(server)
      .get('/api/v1/profiles')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  }).timeout(5000)

  it('Debería crear una nueva categoría', (done) => {
    const profile = {
      "name": "Admin",
      "code": "ADM"
    }
    chai.request(server)
      .post('/api/v1/profiles')
      .send(profile)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('code')

        done()

      })
  }).timeout(5000)

  it('Debería devolver un perfil', (done) => {
    chai.request(server)
      .get('/api/v1/profiles/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('code')
        res.body.should.have.property('name')

        res.body.code.should.be.eql('ADM')
        res.body.name.should.be.eql('Admin')

        done()

      })
  }).timeout(5000)

  it('Debería devolver todas los perfiles (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/profiles')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería modificar un perfil', (done) => {
    const profile = {
      name: "Administradores",
      code: "ADM"
    }
    chai.request(server)
      .put('/api/v1/profiles/1')
      .send(profile)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('code')
        res.body.data.should.have.property('name')

        res.body.data.code.should.be.eql('ADM')
        res.body.data.name.should.be.eql('Administradores')

        done()

      })
  }).timeout(5000)

  it('Debería eliminar un perfil', (done) => {
    chai.request(server)
      .delete('/api/v1/profiles/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  }).timeout(5000)
})