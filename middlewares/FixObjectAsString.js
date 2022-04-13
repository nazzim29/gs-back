module.exports = (req, res, next) => {
    if(req.headers['content-type']?.indexOf('multipart/form-data')>-1){
        for (let key in req.body) {
            try {
                req.body[key] = JSON.parse(req.body[key])
            } catch (err) {
                // console.log(err)
            }
        }
    }
    return next()
}