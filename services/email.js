const sendGrid = require("@sendgrid/mail")
const fs = require('fs')
const path = require('path')
sendGrid.setApiKey(process.env.SENDGRID_API_KEY)

module.exports = {
  sendEmail: (emailAddress) => {
    return new Promise((resolve, reject) => {
      const directory = path.join(__dirname, 'templates', 'forgot-password.html')
      fs.readFile(directory, (error, data) => {
        if (error) {
          return reject({ error })
        }
        const mailOptions = {
          from: process.env.SENDGRID_SENDER_ADDRESS,
          to: emailAddress,
          subject: "Restaurar pasword",
          html: data.toString()
        }
        sendGrid.send(mailOptions, (error, result) => {
          if (error) {
            return reject({ error })
          }
          resolve({ response: result })
        })
      })
    })
  }
}
