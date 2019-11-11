express = require('express')
router = express.Router()

router.route '/'
.get (req, res)=>
  res.send """
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>File Upload</title>
    </head>
    <body>
      <div id="root"></div>
      <script src="/static/index.js"></script>
    </body>
  </html>
  """

module.exports = router
