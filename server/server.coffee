express = require 'express'
app = express()
 
app.use(express.static './public') 

exports.startServer = (port, path, callback) ->

	server = require("http").Server(app)
	io = require("socket.io")(server) 

	server.listen port
	console.log('Listening on port: ' + port)

	app.get '/', (req, res) -> res.sendfile './public/index.html'

	io.on "connection", (socket) ->
	  socket.emit "news",
	    x: 50
	    y: 60

	  socket.on "my other event", (data) ->
	    console.log data
	    return

	  return

	