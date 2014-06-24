paper

from = new Point(100, 200)
to = new Point(200, 100)
rotator = new Point(200, 200)
pathAngle = new Path()
pathAngle.add rotator
pathAngle.add from
pathAngle.rotate 45, rotator
through = pathAngle.getPointAt(pathAngle.length)
path = new Path.Arc(from, through, to)
path.strokeColor = "black"
path2 = new Path.Arc(from, through, to)
path2.rotate 270, rotator
path2.strokeColor = "black"
from = new Point(200, 300)
to = new Point(400, 100)
rotator = new Point(200, 100)
pathAngle = new Path()
pathAngle.add rotator
pathAngle.add to
pathAngle.rotate 45, rotator
through = pathAngle.getPointAt(pathAngle.length)
path3 = new Path.Arc(from, through, to)
path3.strokeColor = "black"