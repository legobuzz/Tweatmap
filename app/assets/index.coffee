setHeadpoint= (x,y) ->	
	circle = new Path.Circle({
	  center: [x, y],
	  radius: 10
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

setHeadpoint 50, 50