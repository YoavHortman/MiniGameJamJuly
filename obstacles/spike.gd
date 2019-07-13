extends Area2D


var defines = preload("res://matrix/Defines.gd")

func canEnter(state):
	print("Checking Spike")
	print("Got state:", state)
	#check if face is correct
	var canmove = state == defines.Faces.Jump or state == defines.Faces.Shield
	
	if !canmove:
		get_tree().change_scene("res://GameOver/GameOver.tscn")
		return false

	return canmove
