const sendGrid = require("@sendgrid/mail")
const fs = require('fs')
const path = require('path')
sendGrid.setApiKey(process.env.SENDGRID_API_KEY)

module.exports = {
  sendEmail: (emailAddress, password, action, data) => {
    switch (action) {
      case 'forgot-password':
        return new Promise((resolve, reject) => {
          const fileName = path.join(__dirname, 'templates', `${action}.html`)
          const data = fs.readFileSync(fileName).toString()
          const mailOptions = {
            from: process.env.SENDGRID_SENDER_ADDRESS,
            to: emailAddress,
            subject: "Restaurar pasword",
            html: data.replace('{password}', password)
          }
          sendGrid.send(mailOptions, (error, result) => {
            if (error) {
              return reject({ error })
            }
            resolve({ response: result })
          })
        })
        break

      case 'notify-supplier':
        return new Promise((resolve, reject) => {
          const rows = []
          data.orderDetails.map(item => {
            const row = []
            row.push('<tr>')
            row.push('<td>' + item.productName + ' ' + item.description + '</td>')
            row.push('<td class="qty">' + item.qtyRequested + '</td>')
            row.push('</tr>')
            rows.push(row.join(''))
          })

          let fileName = path.join(__dirname, 'templates', `${action}-table.html`)

          const emailTable = fs.readFileSync(fileName).toString()
            .replace('{items}', rows.join(''))

          fileName = path.join(__dirname, 'templates', `${action}.html`)
          const emailBody = fs.readFileSync(fileName).toString().replace('{results}', emailTable)
            .replace('{store-name}', data.storeName)
            .replace('{store-address}', data.storeAddress)

          const mailOptions = {
            from: process.env.SENDGRID_SENDER_ADDRESS,
            to: emailAddress,
            subject: "Orden de compra",
            html: emailBody
          }

          sendGrid.send(mailOptions, (error, result) => {
            if (error) {
              return reject({ error })
            }
            resolve({ response: result })
          })

        })
        break

      default:
    }
  }
}
