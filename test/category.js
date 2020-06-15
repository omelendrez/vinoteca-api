//@ts-check/mocha
process.env.NODE_ENV = 'test'

const chai = require('chai')
const chaiHttp = require('chai-http')

// Assertion style
chai.should()
chai.use(chaiHttp)

describe('category end point', () => {
  const url = 'http://vinoteca-api-qa.herokuapp.com/api/v1'
  /**
   * Testear GET
   */

  describe('GET /api/v1/categories', () => {
    it('Debería devolver todas las categorías', (done) => {
      chai.request(url)
        .get('/categories')
        .end((err, res) => {
          //test
          res.should.have.status(200)
          res.body.should.be.a('array')
          res.body.length.should.be.eql(0)
          done()
        })
    })
  })

  /**
   * Testear POST
   */

  /**
   * Testear PUT
   */

  /**
   * Testear PATCH
   */

  /**
   * Testear DELETE
   */


})