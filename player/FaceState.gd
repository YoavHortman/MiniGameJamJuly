extends Node

#   Red
#   Blue
#Gr Yellow Pink   
#   Black
const defines = preload("res://matrix/Defines.gd")

enum Direction { Up, Down, Left, Right }

var currentFace = defines.Faces.Smile
var nextUp = defines.Faces.Jump
var nextLeft = defines.Faces.Axe
var nextRight = defines.Faces.Hand
var nextDown = defines.Faces.Key
var oppsiteSite = defines.Faces.Shield

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

signal onMovementHappened

func getColorForInt(i):
	match i:
		defines.Faces.Jump:
			return Color.red
		defines.Faces.Smile:
			return Color.blue
		defines.Faces.Shield:
			return Color.green
		defines.Faces.Axe:
			return Color.yellow
		defines.Faces.Hand:
			return Color.pink
		defines.Faces.Key:
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
		
	var ret = getFace()
	emit_signal("onMovementHappened")
	return ret
	
func getNextUp():
	return nextUp
	
func getNextDown():
	return nextDown
	
func getNextLeft():
	return nextLeft
	
func getNextRight():
	return nextRight
	
func getFace():
	return currentFace
	