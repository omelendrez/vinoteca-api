const pool = require('./pool')

const { insertFieldsFromModel, updateFieldsFromModel, convertListToCamelCase, convertObjectToCamelCase } = require('../helpers')


module.exports = {
	save: async order => {
		const [fields, values] = await insertFieldsFromModel(order)
		return new Promise(async (resolve, reject) => {
			const sql = `INSERT INTO \`order\` (${fields}) VALUES (${values})`
			pool.executeQuery(sql, null, (err, results, fields) => {
				if (err) return reject(err)
				resolve(convertObjectToCamelCase(results))
			})
		})
	},

	update: async (order, id) => {
		const [fields] = await updateFieldsFromModel(order)
		return new Promise(async (resolve, reject) => {
			const sql = `UPDATE \`order\` SET ${fields} WHERE id=?`
			pool.executeQuery(sql, [id], (err, results, fields) => {
				if (err) return reject(err)
				const sql = `SELECT * FROM \`order\` WHERE id=?`
				pool.executeQuery(sql, [id], (err, results, fields) => {
					if (err) return reject(err)
					resolve(convertListToCamelCase(results)[0])
				})
			})
		})
	},

	getAll: () => {
		return new Promise((resolve, reject) => {
			const sql = 'SELECT * FROM \`order\`;'
			pool.executeQuery(sql, null, async (err, results, fields) => {
				if (err) return reject({ error: err })
				resolve(convertListToCamelCase(results))
			})
		})
	},

	getById: id => {
		return new Promise((resolve, reject) => {
			const sql = 'SELECT * FROM \`order\` WHERE id=?;'
			pool.executeQuery(sql, [id], (err, results, fields) => {
				if (err) return reject({ error: err })
				resolve(convertListToCamelCase(results)[0]) // Es un solo record
			})
		})
	}
}
