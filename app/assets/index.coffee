# Connect to socket server.
socket = io.connect("http://localhost:3000")

# Reaction to socket event 'send_tweat_coords'.
socket.on "send_tweat_coords", (data) ->
	console.log data 	
	setHeatpoint data.x, data.y
	socket.emit "response",
		great: "success"

#
# Sets a heatpoint at a given x, y position on the canvas.
#
setHeatpoint= (x,y) ->	
	circle = new Path.Circle({
		center: [x, y],
		radius: 20
	})

	circle.opacity = 0.5

	circle.fillColor = {
	  gradient: {
	    stops: [["red", 0.4], "white"],
	    radial: true
	  },
	  origin: circle.position,
	  destination: circle.bounds
	}



