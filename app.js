require('dotenv').config()
const express =require('express')
const bodyParser =require('body-parser')
const cors =require('cors')
const morgan =require('morgan')
const {sequelize} = require('./models')
launch = async () => {
    require('./passport')



    const app = express()



    app.use(bodyParser.json())
    app.use(morgan('dev'))
    app.use(cors())

    require('./routes')(app)
    app.get('/', (req, res) => {
        res.json({
            message: "Hello world!!"
        })
    })


    try {
        
        await sequelize.sync({ force: true })
    } catch (e) {
        throw e
    }
    return app
}
module.exports = launch