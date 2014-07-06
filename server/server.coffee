express = require 'express'
tools = require './tools.coffee'
app = express()
 
app.use(express.static './public')

exports.startServer = (port, path, callback) ->

	# Server setup.
	server = require("http").Server(app)
	io = require("socket.io")(server) 
	server.listen port
	console.log('Listening on port: ' + port)

	# Defining routes.
	app.get '/', (req, res) -> res.sendfile './public/index.html'

	# Socket action when client connects.
	io.on "connection", (socket) ->
		console.log('Client is connected.')

		reactionFunction = ->
			socket.emit "send_tweat_coords",
				tools.rnd_coords(800)
			socket.emit "send_tweat_coords",
				tools.rnd_coords(800)
			socket.on "response", (data) ->
				console.log data
				return

		
		reactionFunction = tools.loopdecorator reactionFunction, 50, 1000
		reactionFunction()
		return

