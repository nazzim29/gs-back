const fs = require('fs')
const { UserController } = require('../controllers')
const { isAuth } = require('../middlewares/Auth')
const passport = require("passport");
module.exports = (app)=>{
    app.post('/register',UserController.register)
    app.post('/login', UserController.login)
    app.get('/checklogin',isAuth(),UserController.checklogin)
    console.log('Registring Routes ...')
    fs.readdirSync(__dirname).filter(file=> file !== "index.js"&& file.endsWith('.js')).forEach((router)=>{
        app.use(`/${router.replace('.js','')}`,require('./'+router))
        // console.log(`registred route ${router.replace('.js','')}`)
    })
}