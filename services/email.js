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
        user: process.env.GMAIL_USER,
        pass: process.env.GMAIL_PASSORD
      }
    })

    return new Promise((resolve, reject) => {
      transporter.sendMail(mailOptions, (err, info) => {
        if (err) return reject(err)
        resolve({ response: info.response })
      })
    })
  }
}
