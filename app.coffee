# Module dependencies.

express = require('express')
bodyParser = require('body-parser')
logger = require('morgan')
methodOverride = require('method-override')
path = require('path')

# Controllers
homeController = require('./controllers/home')

# Create Express server.

app = express()

# Express configuration.

app.set 'port', process.env.PORT or 3000
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'
app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: true)
app.use methodOverride()
app.use express.static(path.join(__dirname, 'public'), maxAge: 31557600000)

# Primary app routes.

app.get '/', homeController.index

# Start Express server.

app.listen app.get('port'), ->
  console.log 'Express server listening on port %d in %s mode', app.get('port'), app.get('env')

module.exports = app