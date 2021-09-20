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
app.get('/',(req,res)=>{
    res.json({
        message:"Hello world!!"
    })
})


module.exports = async () => {
    try {
        
        await sequelize.sync({ force: true })
    } catch (e) {
        console.log(e)
    }
    
    return app
}
