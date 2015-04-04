# Connect to socket server.
io = require 'socket.io'
socket = io.connect()

# Setup paper.js
paper   = require 'paper-full'
canvas  = document.getElementById "map"
paper.setup canvas

# Sets a heatpoint at a given x, y position on the canvas.
setHeatpoint= (x,y) ->  
  circle = new paper.Path.Circle
    center: [
      x
      y
    ]
    radius: 20

  circle.opacity = 0.5

  circle.fillColor =
    gradient:
      stops: [
        [
          "red" 
          0.4
        ]
        "white"
      ]
      radial: true
    origin: circle.position
    destination: circle.bounds

  paper.view.update()

# Reaction to socket event 'send_tweat_coords'.
socket.on "send_tweat_coords", (data) ->
  setHeatpoint data.x, data.y