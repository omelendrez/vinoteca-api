const sendGrid = require("@sendgrid/mail")
const fs = require('fs')
const path = require('path')
sendGrid.setApiKey(process.env.SENDGRID_API_KEY)

module.exports = {
  sendEmail: (emailAddress, password, action, data) => {
    switch (action) {
      case 'forgot-password':
        return new Promise((resolve, reject) => {
          const directory = path.join(__dirname, 'templates', `${action}.html`)
          fs.readFile(directory, (error, data) => {
            if (error) {
              return reject({ error })
            }
            const mailOptions = {
              from: process.env.SENDGRID_SENDER_ADDRESS,
              to: emailAddress,
              subject: "Restaurar pasword",
              html: data.toString().replace('{password}', password)
            }
            sendGrid.send(mailOptions, (error, result) => {
              if (error) {
                return reject({ error })
              }
              resolve({ response: result })
            })
          })
        })
        break
      case 'notify-supplier':
        return new Promise((resolve, reject) => {
          const directory = path.join(__dirname, 'templates', `${action}.html`)

          fs.readFile(directory, (error, data) => {
            if (error) {
              return reject({ error })
            }
            const mailOptions = {
              from: process.env.SENDGRID_SENDER_ADDRESS,
              to: emailAddress,
              subject: "Orden de compra",
              html: data.toString().replace('{items}', items)
            }
            sendGrid.send(mailOptions, (error, result) => {
              if (error) {
                return reject({ error })
              }
              resolve({ response: result })
            })
          })
        })
        break
      default:
    }
  }
}
