tools 		= require './tools.coffee'
twitter 	= require './twitter.coffee'

# Server setup
express 	= require 'express'
app 		= express()
server 	= require("http").Server(app)
io 			= require("socket.io")(server)
 
app.use(express.static './public')
app.get '/', (req, res) -> res.sendfile './public/index.html'

# Socket action when client connects
io.on "connection", (socket) ->
	console.log('Client is connected.')

	twitter.stream.on "tweet", (tweet) ->
		if (tweet.place || {}).country_code == 'DE'
			console.log(tweet.place.name)
		#console.log(tweet.geo)

	# Random heatpoints with loop
	reactionFunction = ->
		socket.emit "send_tweat_coords",
			tools.rnd_coords(800)
	reactionFunction = tools.loopdecorator reactionFunction, 50, 1000
	reactionFunction()

exports.startServer = (port, path, callback) ->
	
	server.listen port
	console.log('Listening on port: ' + port)

