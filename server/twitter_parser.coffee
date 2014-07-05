#
# Generates a random pair of x, y coordinates.
#
exports.rnd_coords = (range) ->
  x: Math.floor (Math.random() * range) + 1
  y: Math.floor (Math.random() * range) + 1


#
# Decorates a given function an loops it.
# 
exports.loopdecorator = (f, rounds, delay) ->
  ->
    myLoop = ->
      setTimeout (->
        f()
        i++
        if i < rounds
          myLoop()
        return
      ), delay
      return
    i = 1
    myLoop()