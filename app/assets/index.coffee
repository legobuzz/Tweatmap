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

socket = io.connect("http://localhost:3000")
socket.on "news", (data) -> 	
	setHeatpoint data.x, data.y
	socket.emit "my other event",
		my: "danke"

	return

