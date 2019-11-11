express = require 'express'
router = express.Router()
config = require '../config'

upload_name = config.upload_name
upload_dir = config.upload_dir

multer = require 'multer'
upload = multer({dest: upload_dir})

router.route '/'
.post upload.single(upload_name), (req, res, next)->
  console.log JSON.stringify req.file, null, 2
  res.send
    message: 'file is uploaded'

module.exports = router