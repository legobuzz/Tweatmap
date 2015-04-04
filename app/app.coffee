# Connect to socket server.
io = require 'socket.io'
socket = io.connect()

# Setup paper.js
paper   = require 'paper-full'
canvas  = document.getElementById "map"
paper.setup canvas

boundingBoxGermany =
  swLon:  5.86
  swLat:  47.27
  neLon:  15.05
  neLat:  55.06
pixelPer=
  lat:  canvas.height / (boundingBoxGermany.swLat - boundingBoxGermany.neLat)
  lon:  canvas.width / (boundingBoxGermany.neLon - boundingBoxGermany.swLon)
canvasOriginCoords=
  lat:  boundingBoxGermany.neLat
  lon:  boundingBoxGermany.swLon

# Sets a heatpoint at a given x, y position on the canvas.
setHeatpoint= (x,y) ->  
  circle = new paper.Path.Circle
    center: [
      x
      y
    ]
    radius: 15

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
    origin:       circle.position
    destination:  circle.bounds
  paper.view.update()

# Calculate draw coordinates using bounding box coordinates
calculateDrawCoords= (lat, lon) ->
  x = (lon - canvasOriginCoords.lon ) * pixelPer.lon
  y = (lat - canvasOriginCoords.lat ) * pixelPer.lat
  return x: x, y: y

# Reaction to socket event 'send_tweat_coords'.
socket.on "send_tweat_coords", (data) ->
  if (lat = data.coords[0]) && (lon = data.coords[1])
    drawCoords = calculateDrawCoords lat,lon
    console.log lat, lon, drawCoords, data.place
    setHeatpoint drawCoords.x, drawCoords.y