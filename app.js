launch = async () => {
    require('dotenv').config()
    const express =require('express')
    const bodyParser =require('body-parser')
    const cors =require('cors')
    const morgan =require('morgan')
    const {sequelize} = require('./models')
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
    await sequelize.sync({ force: true, logging: false })
    return app.listen(process.env.PORT || 8080, (p) => {
        console.log(
            "app started at http://localhost:" + (process.env.PORT || 8080)
        );
        return app
    });
}
module.exports = launch
launch()