const nodemailer = require("nodemailer")

module.exports = {
  sendEmail: (emailAddress) => {
    const mailOptions = {
      from: process.env.GMAIL_ADDRESS,
      to: emailAddress,
      subject: "Hello ✔",
      text: "Hello world?", // plain text body
      html: "<b>Hello world?</b>", // html body
    }

    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        type: "OAuth2",
        user: process.env.GMAIL_ADDRESS,
        clientId: process.env.OAUTH_CLIENT,
        clientSecret: process.env.CLIENT_SECRET,
      }
    })

    return new Promise(async (resolve, reject) => {
      await transporter.sendMail(mailOptions)
        .then(info => resolve({ response: info }))
        .catch(err => reject(err))
    })
  }
}
