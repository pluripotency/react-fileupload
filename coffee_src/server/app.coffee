express = require 'express'
path = require 'path'
config = require './config'

app = express()

app.use("/static", express.static(path.join(__dirname, '../../dist')))
app.use '/', require './routes/index'
app.use config.upload_url, require './routes/upload'



# catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next err
  return
# error handlers
# development error handler
# will print stacktrace
if app.get('env') == 'development'
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.send
      message: err.message
      error: err
    return
# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.send
    message: err.message
    error: {}
  return

app.set 'port', process.env.PORT || config.server.port
server = app.listen app.get('port'), ()->
  console.log('NODE_ENV: ' + process.env.NODE_ENV)
  console.log('Express server listening on port ' + server.address().port)
