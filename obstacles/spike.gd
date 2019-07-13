extends Area2D


var defines = preload("res://matrix/Defines.gd")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func canEnter(state):
	print("Checking Spike")
	print("Got state:", state)
	#check if face is correct
	
	var gameover = state != defines.Faces.Red
	
	if gameover:
		get_tree().change_scene("res://GameOver/GameOver.tscn")
		return false
			
	return true
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass