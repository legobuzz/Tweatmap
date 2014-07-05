express = require 'express'
twitter_parser = require './twitter_parser.coffee'
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
				twitter_parser.rnd_coords(500)
			socket.emit "send_tweat_coords",
				twitter_parser.rnd_coords(500)
			socket.on "response", (data) ->
				console.log data
				return

		
		reactionFunction = twitter_parser.loopdecorator reactionFunction, 50, 1000
		reactionFunction()
		return

