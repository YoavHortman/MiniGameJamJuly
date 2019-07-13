extends Node

#   Red
#   Blue
#Gr Yellow Pink   
#   Black
var reference = Vector3(0, 0, 0)
enum Faces { Red, Blue, Green, Yellow, Pink, Black, None }
enum Orientation { North, East, South, West }
enum Direction { Up, Down, Left, Right }

var currentFace = Faces.Red
var nextUp = Faces.Blue
var nextLeft = Faces.Green
var nextRight = Faces.Pink
var nextDown = Faces.Black
var oppsiteSite = Faces.Yellow
var orientation = Orientation.North


func doSwitch(dir):
	match dir:
		Direction.Up:
			var temp = currentFace
			currentFace = nextUp
			nextUp = oppsiteSite
			oppsiteSite = nextDown
			nextDown = temp
		Direction.Down:
			var temp = currentFace
			currentFace = nextDown
			nextDown = oppsiteSite
			oppsiteSite = nextUp
			nextUp = temp
		Direction.Left:
			var temp = currentFace
			currentFace = nextLeft
			nextLeft = oppsiteSite
			oppsiteSite = nextRight
			nextRight = temp
		Direction.Right:
			var temp = currentFace
			currentFace = nextRight
			nextRight = oppsiteSite
			oppsiteSite = nextLeft
			nextLeft = temp

func _ready():
	print(handleInput(false, false, false, true))
	print(handleInput(false, false, false, true))
	
	pass # Replace with function body.

func getColorForInt(i):
	match i:
		Faces.Red:
			return Color.red
		Faces.Blue:
			return Color.blue
		Faces.Green:
			return Color.green
		Faces.Yellow:
			return Color.yellow
		Faces.Pink:
			return Color.pink
		Faces.Black:
			return Color.black

func handleInput(up,down,left,right):
	if up:
		doSwitch(Direction.Up)
	if down:
		doSwitch(Direction.Down)
	if left:
		doSwitch(Direction.Left)
	if right:
		doSwitch(Direction.Right)
		
	return getFace()
	
func getFace():
	return currentFace
	