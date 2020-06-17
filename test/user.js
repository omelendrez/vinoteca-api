//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')
const server = require('../testServer')

// Assertion style
chai.should()
chai.use(chaiHttp)


describe('USUARIOS', () => {
  it('Recrear tabla user', (done) => {
    chai.request(server)
      .post('/api/v1/reset-db/user')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('queries')

        res.body.queries.length.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería devolver todos los usuarios', (done) => {
    chai.request(server)
      .get('/api/v1/users')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(0)

        done()

      })
  }).timeout(5000)

  it('Debería crear un nuevo usuario', (done) => {
    const user = {
      "name": "Omar",
      "password": "Master1",
      "email": "omar@gmail.com",
      "profileId": 1,
      "companyId": 1
    }
    chai.request(server)
      .post('/api/v1/users')
      .send(user)
      .end((err, res) => {

        res.should.have.status(201)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('name')
        res.body.data.should.have.property('email')
        res.body.data.should.have.property('profileId')
        res.body.data.should.have.property('companyId')

        res.body.data.name.should.be.eql('Omar')
        res.body.data.email.should.be.eql('omar@gmail.com')
        res.body.data.profileId.should.be.eql(1)
        res.body.data.companyId.should.be.eql(1)

        done()
      })
  }).timeout(5000)

  it('Debería devolver un usuario', (done) => {
    chai.request(server)
      .get('/api/v1/users/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('name')
        res.body.should.have.property('email')
        res.body.should.have.property('profileId')
        res.body.should.have.property('companyId')

        res.body.name.should.be.eql('Omar')
        res.body.email.should.be.eql('omar@gmail.com')
        res.body.profileId.should.be.eql(1)
        res.body.companyId.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería devolver todos los usuarios (el registro insertado)', (done) => {
    chai.request(server)
      .get('/api/v1/users')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.have.property('count')

        res.body.should.have.property('rows')

        res.body.count.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería modificar un usuario', (done) => {
    const user = {
      "name": "OmarMel",
      "email": "omar.melendrez@gmail.com",
      "profileId": 1,
      "companyId": 1
    }
    chai.request(server)
      .put('/api/v1/users/1')
      .send(user)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('errors')
        res.body.should.have.property('data')

        res.body.data.should.have.property('name')
        res.body.data.should.have.property('email')
        res.body.data.should.have.property('profileId')
        res.body.data.should.have.property('companyId')

        res.body.data.name.should.be.eql('OmarMel')
        res.body.data.email.should.be.eql('omar.melendrez@gmail.com')
        res.body.data.profileId.should.be.eql(1)
        res.body.data.companyId.should.be.eql(1)

        done()

      })
  }).timeout(5000)

  it('Debería loguearse', (done) => {
    const user = {
      "name": "OmarMel",
      "password": "Master1"
    }

    chai.request(server)
      .post('/api/v1/login')
      .send(user)
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('token')
        res.body.should.have.property('user')

        res.body.user.should.have.property('id')
        res.body.user.should.have.property('name')

        res.body.user.id.should.be.eql(1)
        res.body.user.name.should.be.eql('OmarMel')

        done()

      })
  }).timeout(5000)

  it('Debería eliminar un usuario', (done) => {
    chai.request(server)
      .delete('/api/v1/users/1')
      .end((err, res) => {

        res.should.have.status(200)

        res.body.should.be.a('object')

        res.body.should.have.property('affectedRows')

        res.body.affectedRows.should.be.eql(1)

        done()

      })
  }).timeout(5000)
})
